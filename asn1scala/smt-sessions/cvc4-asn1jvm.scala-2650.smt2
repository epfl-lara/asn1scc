; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65222 () Bool)

(assert start!65222)

(declare-fun res!241748 () Bool)

(declare-fun e!208848 () Bool)

(assert (=> start!65222 (=> (not res!241748) (not e!208848))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17427 0))(
  ( (array!17428 (arr!8574 (Array (_ BitVec 32) (_ BitVec 8))) (size!7548 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17427)

(assert (=> start!65222 (= res!241748 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7548 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65222 e!208848))

(declare-datatypes ((BitStream!13106 0))(
  ( (BitStream!13107 (buf!7614 array!17427) (currentByte!14069 (_ BitVec 32)) (currentBit!14064 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13106)

(declare-fun e!208849 () Bool)

(declare-fun inv!12 (BitStream!13106) Bool)

(assert (=> start!65222 (and (inv!12 thiss!1728) e!208849)))

(assert (=> start!65222 true))

(declare-fun array_inv!7160 (array!17427) Bool)

(assert (=> start!65222 (array_inv!7160 arr!273)))

(declare-fun b!292702 () Bool)

(declare-fun res!241746 () Bool)

(assert (=> b!292702 (=> (not res!241746) (not e!208848))))

(assert (=> b!292702 (= res!241746 (bvsge from!505 to!474))))

(declare-fun b!292704 () Bool)

(assert (=> b!292704 (= e!208849 (array_inv!7160 (buf!7614 thiss!1728)))))

(declare-fun b!292703 () Bool)

(assert (=> b!292703 (= e!208848 (not true))))

(declare-fun lt!424977 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292703 (= lt!424977 (bitIndex!0 (size!7548 (buf!7614 thiss!1728)) (currentByte!14069 thiss!1728) (currentBit!14064 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17427 array!17427 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292703 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20385 0))(
  ( (Unit!20386) )
))
(declare-fun lt!424975 () Unit!20385)

(declare-fun lt!424976 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17427 array!17427 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20385)

(assert (=> b!292703 (= lt!424975 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424976 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292703 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424976)))

(assert (=> b!292703 (= lt!424976 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7548 arr!273))))))

(declare-fun lt!424974 () Unit!20385)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17427) Unit!20385)

(assert (=> b!292703 (= lt!424974 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292701 () Bool)

(declare-fun res!241747 () Bool)

(assert (=> b!292701 (=> (not res!241747) (not e!208848))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292701 (= res!241747 (validate_offset_bits!1 ((_ sign_extend 32) (size!7548 (buf!7614 thiss!1728))) ((_ sign_extend 32) (currentByte!14069 thiss!1728)) ((_ sign_extend 32) (currentBit!14064 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65222 res!241748) b!292701))

(assert (= (and b!292701 res!241747) b!292702))

(assert (= (and b!292702 res!241746) b!292703))

(assert (= start!65222 b!292704))

(declare-fun m!428305 () Bool)

(assert (=> start!65222 m!428305))

(declare-fun m!428307 () Bool)

(assert (=> start!65222 m!428307))

(declare-fun m!428309 () Bool)

(assert (=> b!292704 m!428309))

(declare-fun m!428311 () Bool)

(assert (=> b!292703 m!428311))

(declare-fun m!428313 () Bool)

(assert (=> b!292703 m!428313))

(declare-fun m!428315 () Bool)

(assert (=> b!292703 m!428315))

(declare-fun m!428317 () Bool)

(assert (=> b!292703 m!428317))

(declare-fun m!428319 () Bool)

(assert (=> b!292703 m!428319))

(declare-fun m!428321 () Bool)

(assert (=> b!292701 m!428321))

(push 1)

(assert (not start!65222))

(assert (not b!292704))

(assert (not b!292703))

(assert (not b!292701))

(check-sat)

(pop 1)

(push 1)

(check-sat)

