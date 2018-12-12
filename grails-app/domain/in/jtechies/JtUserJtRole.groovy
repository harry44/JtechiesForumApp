package in.jtechies

import org.apache.commons.lang.builder.HashCodeBuilder

class JtUserJtRole implements Serializable {

	private static final long serialVersionUID = 1

	JtUser jtUser
	JtRole jtRole

	boolean equals(other) {
		if (!(other instanceof JtUserJtRole)) {
			return false
		}

		other.jtUser?.id == jtUser?.id &&
		other.jtRole?.id == jtRole?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (jtUser) builder.append(jtUser.id)
		if (jtRole) builder.append(jtRole.id)
		builder.toHashCode()
	}

	static JtUserJtRole get(long jtUserId, long jtRoleId) {
		JtUserJtRole.where {
			jtUser == JtUser.load(jtUserId) &&
			jtRole == JtRole.load(jtRoleId)
		}.get()
	}

	static boolean exists(long jtUserId, long jtRoleId) {
		JtUserJtRole.where {
			jtUser == JtUser.load(jtUserId) &&
			jtRole == JtRole.load(jtRoleId)
		}.count() > 0
	}

	static JtUserJtRole create(JtUser jtUser, JtRole jtRole, boolean flush = false) {
		def instance = new JtUserJtRole(jtUser: jtUser, jtRole: jtRole)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(JtUser u, JtRole r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = JtUserJtRole.where {
			jtUser == JtUser.load(u.id) &&
			jtRole == JtRole.load(r.id)
		}.deleteAll()

		if (flush) { JtUserJtRole.withSession { it.flush() } }

		rowCount > 0
	}

	static void removeAll(JtUser u, boolean flush = false) {
		if (u == null) return

		JtUserJtRole.where {
			jtUser == JtUser.load(u.id)
		}.deleteAll()

		if (flush) { JtUserJtRole.withSession { it.flush() } }
	}

	static void removeAll(JtRole r, boolean flush = false) {
		if (r == null) return

		JtUserJtRole.where {
			jtRole == JtRole.load(r.id)
		}.deleteAll()

		if (flush) { JtUserJtRole.withSession { it.flush() } }
	}

	static constraints = {
		jtRole validator: { JtRole r, JtUserJtRole ur ->
			if (ur.jtUser == null) return
			boolean existing = false
			JtUserJtRole.withNewSession {
				existing = JtUserJtRole.exists(ur.jtUser.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['jtRole', 'jtUser']
		version false
	}
}
