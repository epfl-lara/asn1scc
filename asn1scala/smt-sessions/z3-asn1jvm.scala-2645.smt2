; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65190 () Bool)

(assert start!65190)

(declare-fun b!292474 () Bool)

(declare-fun res!241567 () Bool)

(declare-fun e!208638 () Bool)

(assert (=> b!292474 (=> (not res!241567) (not e!208638))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292474 (= res!241567 (bvsge from!505 to!474))))

(declare-fun res!241566 () Bool)

(assert (=> start!65190 (=> (not res!241566) (not e!208638))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((array!17395 0))(
  ( (array!17396 (arr!8558 (Array (_ BitVec 32) (_ BitVec 8))) (size!7532 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17395)

(assert (=> start!65190 (= res!241566 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7532 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65190 e!208638))

(declare-datatypes ((BitStream!13074 0))(
  ( (BitStream!13075 (buf!7598 array!17395) (currentByte!14053 (_ BitVec 32)) (currentBit!14048 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13074)

(declare-fun e!208641 () Bool)

(declare-fun inv!12 (BitStream!13074) Bool)

(assert (=> start!65190 (and (inv!12 thiss!1728) e!208641)))

(assert (=> start!65190 true))

(declare-fun array_inv!7144 (array!17395) Bool)

(assert (=> start!65190 (array_inv!7144 arr!273)))

(declare-fun b!292473 () Bool)

(declare-fun res!241568 () Bool)

(assert (=> b!292473 (=> (not res!241568) (not e!208638))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292473 (= res!241568 (validate_offset_bits!1 ((_ sign_extend 32) (size!7532 (buf!7598 thiss!1728))) ((_ sign_extend 32) (currentByte!14053 thiss!1728)) ((_ sign_extend 32) (currentBit!14048 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292475 () Bool)

(assert (=> b!292475 (= e!208638 (not true))))

(declare-fun lt!424783 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292475 (= lt!424783 (bitIndex!0 (size!7532 (buf!7598 thiss!1728)) (currentByte!14053 thiss!1728) (currentBit!14048 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17395 array!17395 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292475 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424785 () (_ BitVec 64))

(declare-datatypes ((Unit!20353 0))(
  ( (Unit!20354) )
))
(declare-fun lt!424782 () Unit!20353)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17395 array!17395 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20353)

(assert (=> b!292475 (= lt!424782 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424785 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292475 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424785)))

(assert (=> b!292475 (= lt!424785 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7532 arr!273))))))

(declare-fun lt!424784 () Unit!20353)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17395) Unit!20353)

(assert (=> b!292475 (= lt!424784 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292476 () Bool)

(assert (=> b!292476 (= e!208641 (array_inv!7144 (buf!7598 thiss!1728)))))

(assert (= (and start!65190 res!241566) b!292473))

(assert (= (and b!292473 res!241568) b!292474))

(assert (= (and b!292474 res!241567) b!292475))

(assert (= start!65190 b!292476))

(declare-fun m!428005 () Bool)

(assert (=> start!65190 m!428005))

(declare-fun m!428007 () Bool)

(assert (=> start!65190 m!428007))

(declare-fun m!428009 () Bool)

(assert (=> b!292473 m!428009))

(declare-fun m!428011 () Bool)

(assert (=> b!292475 m!428011))

(declare-fun m!428013 () Bool)

(assert (=> b!292475 m!428013))

(declare-fun m!428015 () Bool)

(assert (=> b!292475 m!428015))

(declare-fun m!428017 () Bool)

(assert (=> b!292475 m!428017))

(declare-fun m!428019 () Bool)

(assert (=> b!292475 m!428019))

(declare-fun m!428021 () Bool)

(assert (=> b!292476 m!428021))

(check-sat (not b!292475) (not b!292476) (not start!65190) (not b!292473))
