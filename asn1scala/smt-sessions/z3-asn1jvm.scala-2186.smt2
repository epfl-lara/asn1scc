; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55482 () Bool)

(assert start!55482)

(declare-fun res!216571 () Bool)

(declare-fun e!179317 () Bool)

(assert (=> start!55482 (=> (not res!216571) (not e!179317))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55482 (= res!216571 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55482 e!179317))

(assert (=> start!55482 true))

(declare-datatypes ((array!14063 0))(
  ( (array!14064 (arr!7151 (Array (_ BitVec 32) (_ BitVec 8))) (size!6164 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11250 0))(
  ( (BitStream!11251 (buf!6686 array!14063) (currentByte!12279 (_ BitVec 32)) (currentBit!12274 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11250)

(declare-fun e!179315 () Bool)

(declare-fun inv!12 (BitStream!11250) Bool)

(assert (=> start!55482 (and (inv!12 thiss!1754) e!179315)))

(declare-fun b!258527 () Bool)

(declare-fun res!216570 () Bool)

(assert (=> b!258527 (=> (not res!216570) (not e!179317))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258527 (= res!216570 (validate_offset_bits!1 ((_ sign_extend 32) (size!6164 (buf!6686 thiss!1754))) ((_ sign_extend 32) (currentByte!12279 thiss!1754)) ((_ sign_extend 32) (currentBit!12274 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258528 () Bool)

(assert (=> b!258528 (= e!179317 (and (not (= (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!258529 () Bool)

(declare-fun array_inv!5905 (array!14063) Bool)

(assert (=> b!258529 (= e!179315 (array_inv!5905 (buf!6686 thiss!1754)))))

(assert (= (and start!55482 res!216571) b!258527))

(assert (= (and b!258527 res!216570) b!258528))

(assert (= start!55482 b!258529))

(declare-fun m!387983 () Bool)

(assert (=> start!55482 m!387983))

(declare-fun m!387985 () Bool)

(assert (=> b!258527 m!387985))

(declare-fun m!387987 () Bool)

(assert (=> b!258529 m!387987))

(check-sat (not b!258527) (not start!55482) (not b!258529))
(check-sat)
