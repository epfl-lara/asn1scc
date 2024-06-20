; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65214 () Bool)

(assert start!65214)

(declare-fun res!241704 () Bool)

(declare-fun e!208796 () Bool)

(assert (=> start!65214 (=> (not res!241704) (not e!208796))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17419 0))(
  ( (array!17420 (arr!8570 (Array (_ BitVec 32) (_ BitVec 8))) (size!7544 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17419)

(assert (=> start!65214 (= res!241704 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7544 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65214 e!208796))

(declare-datatypes ((BitStream!13098 0))(
  ( (BitStream!13099 (buf!7610 array!17419) (currentByte!14065 (_ BitVec 32)) (currentBit!14060 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13098)

(declare-fun e!208798 () Bool)

(declare-fun inv!12 (BitStream!13098) Bool)

(assert (=> start!65214 (and (inv!12 thiss!1728) e!208798)))

(assert (=> start!65214 true))

(declare-fun array_inv!7156 (array!17419) Bool)

(assert (=> start!65214 (array_inv!7156 arr!273)))

(declare-fun b!292645 () Bool)

(declare-fun res!241706 () Bool)

(assert (=> b!292645 (=> (not res!241706) (not e!208796))))

(assert (=> b!292645 (= res!241706 (bvsge from!505 to!474))))

(declare-fun b!292646 () Bool)

(declare-fun res!241705 () Bool)

(assert (=> b!292646 (=> (not res!241705) (not e!208796))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292646 (= res!241705 (validate_offset_bits!1 ((_ sign_extend 32) (size!7544 (buf!7610 thiss!1728))) ((_ sign_extend 32) (currentByte!14065 thiss!1728)) ((_ sign_extend 32) (currentBit!14060 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292647 () Bool)

(declare-fun res!241703 () Bool)

(declare-fun e!208797 () Bool)

(assert (=> b!292647 (=> res!241703 e!208797)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292647 (= res!241703 (not (invariant!0 (currentBit!14060 thiss!1728) (currentByte!14065 thiss!1728) (size!7544 (buf!7610 thiss!1728)))))))

(declare-fun b!292648 () Bool)

(assert (=> b!292648 (= e!208798 (array_inv!7156 (buf!7610 thiss!1728)))))

(declare-fun b!292649 () Bool)

(declare-fun lt!424929 () (_ BitVec 64))

(assert (=> b!292649 (= e!208797 (or (bvsge from!505 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!474 from!505))) (bvsle (bvadd from!505 (bvsub to!474 from!505)) lt!424929)))))

(declare-fun b!292650 () Bool)

(assert (=> b!292650 (= e!208796 (not e!208797))))

(declare-fun res!241702 () Bool)

(assert (=> b!292650 (=> res!241702 e!208797)))

(declare-fun lt!424926 () (_ BitVec 64))

(assert (=> b!292650 (= res!241702 (not (= (bvsub (bvadd lt!424926 to!474) from!505) lt!424926)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292650 (= lt!424926 (bitIndex!0 (size!7544 (buf!7610 thiss!1728)) (currentByte!14065 thiss!1728) (currentBit!14060 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17419 array!17419 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292650 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20377 0))(
  ( (Unit!20378) )
))
(declare-fun lt!424927 () Unit!20377)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17419 array!17419 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20377)

(assert (=> b!292650 (= lt!424927 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424929 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292650 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424929)))

(assert (=> b!292650 (= lt!424929 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7544 arr!273))))))

(declare-fun lt!424928 () Unit!20377)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17419) Unit!20377)

(assert (=> b!292650 (= lt!424928 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!65214 res!241704) b!292646))

(assert (= (and b!292646 res!241705) b!292645))

(assert (= (and b!292645 res!241706) b!292650))

(assert (= (and b!292650 (not res!241702)) b!292647))

(assert (= (and b!292647 (not res!241703)) b!292649))

(assert (= start!65214 b!292648))

(declare-fun m!428229 () Bool)

(assert (=> start!65214 m!428229))

(declare-fun m!428231 () Bool)

(assert (=> start!65214 m!428231))

(declare-fun m!428233 () Bool)

(assert (=> b!292648 m!428233))

(declare-fun m!428235 () Bool)

(assert (=> b!292646 m!428235))

(declare-fun m!428237 () Bool)

(assert (=> b!292647 m!428237))

(declare-fun m!428239 () Bool)

(assert (=> b!292650 m!428239))

(declare-fun m!428241 () Bool)

(assert (=> b!292650 m!428241))

(declare-fun m!428243 () Bool)

(assert (=> b!292650 m!428243))

(declare-fun m!428245 () Bool)

(assert (=> b!292650 m!428245))

(declare-fun m!428247 () Bool)

(assert (=> b!292650 m!428247))

(check-sat (not start!65214) (not b!292650) (not b!292647) (not b!292648) (not b!292646))
(check-sat)
