; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65212 () Bool)

(assert start!65212)

(declare-fun b!292627 () Bool)

(declare-fun e!208783 () Bool)

(declare-datatypes ((array!17417 0))(
  ( (array!17418 (arr!8569 (Array (_ BitVec 32) (_ BitVec 8))) (size!7543 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13096 0))(
  ( (BitStream!13097 (buf!7609 array!17417) (currentByte!14064 (_ BitVec 32)) (currentBit!14059 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13096)

(declare-fun array_inv!7155 (array!17417) Bool)

(assert (=> b!292627 (= e!208783 (array_inv!7155 (buf!7609 thiss!1728)))))

(declare-fun b!292628 () Bool)

(declare-fun e!208782 () Bool)

(declare-fun lt!424914 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!292628 (= e!208782 (or (bvsge from!505 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!474 from!505))) (bvsle (bvadd from!505 (bvsub to!474 from!505)) lt!424914)))))

(declare-fun res!241690 () Bool)

(declare-fun e!208785 () Bool)

(assert (=> start!65212 (=> (not res!241690) (not e!208785))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17417)

(assert (=> start!65212 (= res!241690 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7543 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65212 e!208785))

(declare-fun inv!12 (BitStream!13096) Bool)

(assert (=> start!65212 (and (inv!12 thiss!1728) e!208783)))

(assert (=> start!65212 true))

(assert (=> start!65212 (array_inv!7155 arr!273)))

(declare-fun b!292629 () Bool)

(declare-fun res!241688 () Bool)

(assert (=> b!292629 (=> res!241688 e!208782)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292629 (= res!241688 (not (invariant!0 (currentBit!14059 thiss!1728) (currentByte!14064 thiss!1728) (size!7543 (buf!7609 thiss!1728)))))))

(declare-fun b!292630 () Bool)

(assert (=> b!292630 (= e!208785 (not e!208782))))

(declare-fun res!241689 () Bool)

(assert (=> b!292630 (=> res!241689 e!208782)))

(declare-fun lt!424916 () (_ BitVec 64))

(assert (=> b!292630 (= res!241689 (not (= (bvsub (bvadd lt!424916 to!474) from!505) lt!424916)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292630 (= lt!424916 (bitIndex!0 (size!7543 (buf!7609 thiss!1728)) (currentByte!14064 thiss!1728) (currentBit!14059 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17417 array!17417 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292630 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20375 0))(
  ( (Unit!20376) )
))
(declare-fun lt!424917 () Unit!20375)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17417 array!17417 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20375)

(assert (=> b!292630 (= lt!424917 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424914 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292630 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424914)))

(assert (=> b!292630 (= lt!424914 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7543 arr!273))))))

(declare-fun lt!424915 () Unit!20375)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17417) Unit!20375)

(assert (=> b!292630 (= lt!424915 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292631 () Bool)

(declare-fun res!241687 () Bool)

(assert (=> b!292631 (=> (not res!241687) (not e!208785))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292631 (= res!241687 (validate_offset_bits!1 ((_ sign_extend 32) (size!7543 (buf!7609 thiss!1728))) ((_ sign_extend 32) (currentByte!14064 thiss!1728)) ((_ sign_extend 32) (currentBit!14059 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292632 () Bool)

(declare-fun res!241691 () Bool)

(assert (=> b!292632 (=> (not res!241691) (not e!208785))))

(assert (=> b!292632 (= res!241691 (bvsge from!505 to!474))))

(assert (= (and start!65212 res!241690) b!292631))

(assert (= (and b!292631 res!241687) b!292632))

(assert (= (and b!292632 res!241691) b!292630))

(assert (= (and b!292630 (not res!241689)) b!292629))

(assert (= (and b!292629 (not res!241688)) b!292628))

(assert (= start!65212 b!292627))

(declare-fun m!428209 () Bool)

(assert (=> b!292629 m!428209))

(declare-fun m!428211 () Bool)

(assert (=> b!292627 m!428211))

(declare-fun m!428213 () Bool)

(assert (=> b!292631 m!428213))

(declare-fun m!428215 () Bool)

(assert (=> start!65212 m!428215))

(declare-fun m!428217 () Bool)

(assert (=> start!65212 m!428217))

(declare-fun m!428219 () Bool)

(assert (=> b!292630 m!428219))

(declare-fun m!428221 () Bool)

(assert (=> b!292630 m!428221))

(declare-fun m!428223 () Bool)

(assert (=> b!292630 m!428223))

(declare-fun m!428225 () Bool)

(assert (=> b!292630 m!428225))

(declare-fun m!428227 () Bool)

(assert (=> b!292630 m!428227))

(push 1)

(assert (not b!292627))

(assert (not b!292629))

(assert (not b!292630))

(assert (not start!65212))

(assert (not b!292631))

(check-sat)

(pop 1)

(push 1)

(check-sat)

