; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65210 () Bool)

(assert start!65210)

(declare-fun b!292609 () Bool)

(declare-fun e!208766 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292609 (= e!208766 (bvslt from!505 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!474 from!505))))))

(declare-fun res!241675 () Bool)

(declare-fun e!208770 () Bool)

(assert (=> start!65210 (=> (not res!241675) (not e!208770))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((array!17415 0))(
  ( (array!17416 (arr!8568 (Array (_ BitVec 32) (_ BitVec 8))) (size!7542 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17415)

(assert (=> start!65210 (= res!241675 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7542 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65210 e!208770))

(declare-datatypes ((BitStream!13094 0))(
  ( (BitStream!13095 (buf!7608 array!17415) (currentByte!14063 (_ BitVec 32)) (currentBit!14058 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13094)

(declare-fun e!208767 () Bool)

(declare-fun inv!12 (BitStream!13094) Bool)

(assert (=> start!65210 (and (inv!12 thiss!1728) e!208767)))

(assert (=> start!65210 true))

(declare-fun array_inv!7154 (array!17415) Bool)

(assert (=> start!65210 (array_inv!7154 arr!273)))

(declare-fun b!292610 () Bool)

(declare-fun res!241674 () Bool)

(assert (=> b!292610 (=> res!241674 e!208766)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292610 (= res!241674 (not (invariant!0 (currentBit!14058 thiss!1728) (currentByte!14063 thiss!1728) (size!7542 (buf!7608 thiss!1728)))))))

(declare-fun b!292611 () Bool)

(assert (=> b!292611 (= e!208770 (not e!208766))))

(declare-fun res!241676 () Bool)

(assert (=> b!292611 (=> res!241676 e!208766)))

(declare-fun lt!424903 () (_ BitVec 64))

(assert (=> b!292611 (= res!241676 (not (= (bvsub (bvadd lt!424903 to!474) from!505) lt!424903)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292611 (= lt!424903 (bitIndex!0 (size!7542 (buf!7608 thiss!1728)) (currentByte!14063 thiss!1728) (currentBit!14058 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17415 array!17415 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292611 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20373 0))(
  ( (Unit!20374) )
))
(declare-fun lt!424904 () Unit!20373)

(declare-fun lt!424902 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17415 array!17415 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20373)

(assert (=> b!292611 (= lt!424904 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424902 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292611 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424902)))

(assert (=> b!292611 (= lt!424902 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7542 arr!273))))))

(declare-fun lt!424905 () Unit!20373)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17415) Unit!20373)

(assert (=> b!292611 (= lt!424905 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292612 () Bool)

(assert (=> b!292612 (= e!208767 (array_inv!7154 (buf!7608 thiss!1728)))))

(declare-fun b!292613 () Bool)

(declare-fun res!241673 () Bool)

(assert (=> b!292613 (=> (not res!241673) (not e!208770))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292613 (= res!241673 (validate_offset_bits!1 ((_ sign_extend 32) (size!7542 (buf!7608 thiss!1728))) ((_ sign_extend 32) (currentByte!14063 thiss!1728)) ((_ sign_extend 32) (currentBit!14058 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292614 () Bool)

(declare-fun res!241672 () Bool)

(assert (=> b!292614 (=> (not res!241672) (not e!208770))))

(assert (=> b!292614 (= res!241672 (bvsge from!505 to!474))))

(assert (= (and start!65210 res!241675) b!292613))

(assert (= (and b!292613 res!241673) b!292614))

(assert (= (and b!292614 res!241672) b!292611))

(assert (= (and b!292611 (not res!241676)) b!292610))

(assert (= (and b!292610 (not res!241674)) b!292609))

(assert (= start!65210 b!292612))

(declare-fun m!428189 () Bool)

(assert (=> b!292612 m!428189))

(declare-fun m!428191 () Bool)

(assert (=> b!292610 m!428191))

(declare-fun m!428193 () Bool)

(assert (=> b!292613 m!428193))

(declare-fun m!428195 () Bool)

(assert (=> b!292611 m!428195))

(declare-fun m!428197 () Bool)

(assert (=> b!292611 m!428197))

(declare-fun m!428199 () Bool)

(assert (=> b!292611 m!428199))

(declare-fun m!428201 () Bool)

(assert (=> b!292611 m!428201))

(declare-fun m!428203 () Bool)

(assert (=> b!292611 m!428203))

(declare-fun m!428205 () Bool)

(assert (=> start!65210 m!428205))

(declare-fun m!428207 () Bool)

(assert (=> start!65210 m!428207))

(push 1)

(assert (not b!292612))

(assert (not b!292611))

(assert (not start!65210))

(assert (not b!292610))

(assert (not b!292613))

(check-sat)

(pop 1)

(push 1)

(check-sat)

