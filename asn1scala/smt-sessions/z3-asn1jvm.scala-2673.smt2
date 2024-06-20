; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65460 () Bool)

(assert start!65460)

(declare-fun b!293592 () Bool)

(declare-fun e!209738 () Bool)

(declare-datatypes ((array!17560 0))(
  ( (array!17561 (arr!8636 (Array (_ BitVec 32) (_ BitVec 8))) (size!7610 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13224 0))(
  ( (BitStream!13225 (buf!7673 array!17560) (currentByte!14146 (_ BitVec 32)) (currentBit!14141 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13224)

(declare-fun array_inv!7222 (array!17560) Bool)

(assert (=> b!293592 (= e!209738 (array_inv!7222 (buf!7673 thiss!1728)))))

(declare-fun b!293589 () Bool)

(declare-fun res!242435 () Bool)

(declare-fun e!209739 () Bool)

(assert (=> b!293589 (=> (not res!242435) (not e!209739))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293589 (= res!242435 (validate_offset_bits!1 ((_ sign_extend 32) (size!7610 (buf!7673 thiss!1728))) ((_ sign_extend 32) (currentByte!14146 thiss!1728)) ((_ sign_extend 32) (currentBit!14141 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293591 () Bool)

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293591 (= e!209739 (not (bvslt (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bvsub to!474 from!505))))))

(declare-datatypes ((tuple2!23058 0))(
  ( (tuple2!23059 (_1!12834 Bool) (_2!12834 BitStream!13224)) )
))
(declare-fun lt!425528 () tuple2!23058)

(assert (=> b!293591 (validate_offset_bits!1 ((_ sign_extend 32) (size!7610 (buf!7673 (_2!12834 lt!425528)))) ((_ sign_extend 32) (currentByte!14146 (_2!12834 lt!425528))) ((_ sign_extend 32) (currentBit!14141 (_2!12834 lt!425528))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20409 0))(
  ( (Unit!20410) )
))
(declare-fun lt!425529 () Unit!20409)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13224 BitStream!13224 (_ BitVec 64) (_ BitVec 64)) Unit!20409)

(assert (=> b!293591 (= lt!425529 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12834 lt!425528) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!13224) tuple2!23058)

(assert (=> b!293591 (= lt!425528 (readBit!0 thiss!1728))))

(declare-fun res!242434 () Bool)

(assert (=> start!65460 (=> (not res!242434) (not e!209739))))

(declare-fun arr!273 () array!17560)

(assert (=> start!65460 (= res!242434 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7610 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65460 e!209739))

(declare-fun inv!12 (BitStream!13224) Bool)

(assert (=> start!65460 (and (inv!12 thiss!1728) e!209738)))

(assert (=> start!65460 true))

(assert (=> start!65460 (array_inv!7222 arr!273)))

(declare-fun b!293590 () Bool)

(declare-fun res!242433 () Bool)

(assert (=> b!293590 (=> (not res!242433) (not e!209739))))

(assert (=> b!293590 (= res!242433 (bvslt from!505 to!474))))

(assert (= (and start!65460 res!242434) b!293589))

(assert (= (and b!293589 res!242435) b!293590))

(assert (= (and b!293590 res!242433) b!293591))

(assert (= start!65460 b!293592))

(declare-fun m!429141 () Bool)

(assert (=> b!293592 m!429141))

(declare-fun m!429143 () Bool)

(assert (=> b!293589 m!429143))

(declare-fun m!429145 () Bool)

(assert (=> b!293591 m!429145))

(declare-fun m!429147 () Bool)

(assert (=> b!293591 m!429147))

(declare-fun m!429149 () Bool)

(assert (=> b!293591 m!429149))

(declare-fun m!429151 () Bool)

(assert (=> start!65460 m!429151))

(declare-fun m!429153 () Bool)

(assert (=> start!65460 m!429153))

(check-sat (not start!65460) (not b!293591) (not b!293592) (not b!293589))
(check-sat)
