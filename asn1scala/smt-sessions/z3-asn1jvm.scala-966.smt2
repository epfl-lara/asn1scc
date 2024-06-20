; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27302 () Bool)

(assert start!27302)

(declare-fun b!140200 () Bool)

(declare-fun res!116889 () Bool)

(declare-fun e!93441 () Bool)

(assert (=> b!140200 (=> (not res!116889) (not e!93441))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6395 0))(
  ( (array!6396 (arr!3601 (Array (_ BitVec 32) (_ BitVec 8))) (size!2894 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5046 0))(
  ( (BitStream!5047 (buf!3315 array!6395) (currentByte!6157 (_ BitVec 32)) (currentBit!6152 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5046)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140200 (= res!116889 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2894 (buf!3315 thiss!1634))) ((_ sign_extend 32) (currentByte!6157 thiss!1634)) ((_ sign_extend 32) (currentBit!6152 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!116888 () Bool)

(assert (=> start!27302 (=> (not res!116888) (not e!93441))))

(declare-fun arr!237 () array!6395)

(assert (=> start!27302 (= res!116888 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2894 arr!237))))))

(assert (=> start!27302 e!93441))

(assert (=> start!27302 true))

(declare-fun array_inv!2683 (array!6395) Bool)

(assert (=> start!27302 (array_inv!2683 arr!237)))

(declare-fun e!93439 () Bool)

(declare-fun inv!12 (BitStream!5046) Bool)

(assert (=> start!27302 (and (inv!12 thiss!1634) e!93439)))

(declare-fun b!140201 () Bool)

(declare-fun res!116890 () Bool)

(assert (=> b!140201 (=> (not res!116890) (not e!93441))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140201 (= res!116890 (invariant!0 (currentBit!6152 thiss!1634) (currentByte!6157 thiss!1634) (size!2894 (buf!3315 thiss!1634))))))

(declare-fun b!140202 () Bool)

(assert (=> b!140202 (= e!93439 (array_inv!2683 (buf!3315 thiss!1634)))))

(declare-fun b!140203 () Bool)

(declare-fun res!116887 () Bool)

(assert (=> b!140203 (=> (not res!116887) (not e!93441))))

(assert (=> b!140203 (= res!116887 (bvslt from!447 to!404))))

(declare-fun b!140204 () Bool)

(assert (=> b!140204 (= e!93441 (bvsge from!447 (size!2894 arr!237)))))

(assert (= (and start!27302 res!116888) b!140200))

(assert (= (and b!140200 res!116889) b!140203))

(assert (= (and b!140203 res!116887) b!140201))

(assert (= (and b!140201 res!116890) b!140204))

(assert (= start!27302 b!140202))

(declare-fun m!216003 () Bool)

(assert (=> b!140200 m!216003))

(declare-fun m!216005 () Bool)

(assert (=> start!27302 m!216005))

(declare-fun m!216007 () Bool)

(assert (=> start!27302 m!216007))

(declare-fun m!216009 () Bool)

(assert (=> b!140201 m!216009))

(declare-fun m!216011 () Bool)

(assert (=> b!140202 m!216011))

(check-sat (not start!27302) (not b!140202) (not b!140200) (not b!140201))
(check-sat)
