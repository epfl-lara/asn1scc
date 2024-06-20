; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65216 () Bool)

(assert start!65216)

(declare-fun res!241719 () Bool)

(declare-fun e!208814 () Bool)

(assert (=> start!65216 (=> (not res!241719) (not e!208814))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17421 0))(
  ( (array!17422 (arr!8571 (Array (_ BitVec 32) (_ BitVec 8))) (size!7545 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17421)

(assert (=> start!65216 (= res!241719 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7545 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65216 e!208814))

(declare-datatypes ((BitStream!13100 0))(
  ( (BitStream!13101 (buf!7611 array!17421) (currentByte!14066 (_ BitVec 32)) (currentBit!14061 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13100)

(declare-fun e!208815 () Bool)

(declare-fun inv!12 (BitStream!13100) Bool)

(assert (=> start!65216 (and (inv!12 thiss!1728) e!208815)))

(assert (=> start!65216 true))

(declare-fun array_inv!7157 (array!17421) Bool)

(assert (=> start!65216 (array_inv!7157 arr!273)))

(declare-fun b!292663 () Bool)

(declare-fun e!208813 () Bool)

(assert (=> b!292663 (= e!208814 (not e!208813))))

(declare-fun res!241720 () Bool)

(assert (=> b!292663 (=> res!241720 e!208813)))

(declare-fun lt!424938 () (_ BitVec 64))

(assert (=> b!292663 (= res!241720 (not (= (bvsub (bvadd lt!424938 to!474) from!505) lt!424938)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292663 (= lt!424938 (bitIndex!0 (size!7545 (buf!7611 thiss!1728)) (currentByte!14066 thiss!1728) (currentBit!14061 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17421 array!17421 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292663 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20379 0))(
  ( (Unit!20380) )
))
(declare-fun lt!424941 () Unit!20379)

(declare-fun lt!424939 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17421 array!17421 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20379)

(assert (=> b!292663 (= lt!424941 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424939 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292663 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424939)))

(assert (=> b!292663 (= lt!424939 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7545 arr!273))))))

(declare-fun lt!424940 () Unit!20379)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17421) Unit!20379)

(assert (=> b!292663 (= lt!424940 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292664 () Bool)

(declare-fun res!241717 () Bool)

(assert (=> b!292664 (=> (not res!241717) (not e!208814))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292664 (= res!241717 (validate_offset_bits!1 ((_ sign_extend 32) (size!7545 (buf!7611 thiss!1728))) ((_ sign_extend 32) (currentByte!14066 thiss!1728)) ((_ sign_extend 32) (currentBit!14061 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292665 () Bool)

(assert (=> b!292665 (= e!208815 (array_inv!7157 (buf!7611 thiss!1728)))))

(declare-fun b!292666 () Bool)

(declare-fun res!241718 () Bool)

(assert (=> b!292666 (=> res!241718 e!208813)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292666 (= res!241718 (not (invariant!0 (currentBit!14061 thiss!1728) (currentByte!14066 thiss!1728) (size!7545 (buf!7611 thiss!1728)))))))

(declare-fun b!292667 () Bool)

(assert (=> b!292667 (= e!208813 (or (bvsge from!505 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!474 from!505))) (bvsle (bvadd from!505 (bvsub to!474 from!505)) lt!424939)))))

(declare-fun b!292668 () Bool)

(declare-fun res!241721 () Bool)

(assert (=> b!292668 (=> (not res!241721) (not e!208814))))

(assert (=> b!292668 (= res!241721 (bvsge from!505 to!474))))

(assert (= (and start!65216 res!241719) b!292664))

(assert (= (and b!292664 res!241717) b!292668))

(assert (= (and b!292668 res!241721) b!292663))

(assert (= (and b!292663 (not res!241720)) b!292666))

(assert (= (and b!292666 (not res!241718)) b!292667))

(assert (= start!65216 b!292665))

(declare-fun m!428249 () Bool)

(assert (=> b!292664 m!428249))

(declare-fun m!428251 () Bool)

(assert (=> b!292666 m!428251))

(declare-fun m!428253 () Bool)

(assert (=> b!292663 m!428253))

(declare-fun m!428255 () Bool)

(assert (=> b!292663 m!428255))

(declare-fun m!428257 () Bool)

(assert (=> b!292663 m!428257))

(declare-fun m!428259 () Bool)

(assert (=> b!292663 m!428259))

(declare-fun m!428261 () Bool)

(assert (=> b!292663 m!428261))

(declare-fun m!428263 () Bool)

(assert (=> b!292665 m!428263))

(declare-fun m!428265 () Bool)

(assert (=> start!65216 m!428265))

(declare-fun m!428267 () Bool)

(assert (=> start!65216 m!428267))

(push 1)

(assert (not b!292665))

(assert (not b!292664))

(assert (not start!65216))

(assert (not b!292666))

(assert (not b!292663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

