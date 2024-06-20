; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65192 () Bool)

(assert start!65192)

(declare-fun b!292485 () Bool)

(declare-fun res!241576 () Bool)

(declare-fun e!208651 () Bool)

(assert (=> b!292485 (=> (not res!241576) (not e!208651))))

(declare-datatypes ((array!17397 0))(
  ( (array!17398 (arr!8559 (Array (_ BitVec 32) (_ BitVec 8))) (size!7533 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13076 0))(
  ( (BitStream!13077 (buf!7599 array!17397) (currentByte!14054 (_ BitVec 32)) (currentBit!14049 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13076)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292485 (= res!241576 (validate_offset_bits!1 ((_ sign_extend 32) (size!7533 (buf!7599 thiss!1728))) ((_ sign_extend 32) (currentByte!14054 thiss!1728)) ((_ sign_extend 32) (currentBit!14049 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292488 () Bool)

(declare-fun e!208650 () Bool)

(declare-fun array_inv!7145 (array!17397) Bool)

(assert (=> b!292488 (= e!208650 (array_inv!7145 (buf!7599 thiss!1728)))))

(declare-fun res!241575 () Bool)

(assert (=> start!65192 (=> (not res!241575) (not e!208651))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17397)

(assert (=> start!65192 (= res!241575 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7533 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65192 e!208651))

(declare-fun inv!12 (BitStream!13076) Bool)

(assert (=> start!65192 (and (inv!12 thiss!1728) e!208650)))

(assert (=> start!65192 true))

(assert (=> start!65192 (array_inv!7145 arr!273)))

(declare-fun b!292486 () Bool)

(declare-fun res!241577 () Bool)

(assert (=> b!292486 (=> (not res!241577) (not e!208651))))

(assert (=> b!292486 (= res!241577 (bvsge from!505 to!474))))

(declare-fun b!292487 () Bool)

(assert (=> b!292487 (= e!208651 (not true))))

(declare-fun lt!424794 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292487 (= lt!424794 (bitIndex!0 (size!7533 (buf!7599 thiss!1728)) (currentByte!14054 thiss!1728) (currentBit!14049 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17397 array!17397 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292487 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424797 () (_ BitVec 64))

(declare-datatypes ((Unit!20355 0))(
  ( (Unit!20356) )
))
(declare-fun lt!424796 () Unit!20355)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17397 array!17397 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20355)

(assert (=> b!292487 (= lt!424796 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424797 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292487 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424797)))

(assert (=> b!292487 (= lt!424797 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7533 arr!273))))))

(declare-fun lt!424795 () Unit!20355)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17397) Unit!20355)

(assert (=> b!292487 (= lt!424795 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!65192 res!241575) b!292485))

(assert (= (and b!292485 res!241576) b!292486))

(assert (= (and b!292486 res!241577) b!292487))

(assert (= start!65192 b!292488))

(declare-fun m!428023 () Bool)

(assert (=> b!292485 m!428023))

(declare-fun m!428025 () Bool)

(assert (=> b!292488 m!428025))

(declare-fun m!428027 () Bool)

(assert (=> start!65192 m!428027))

(declare-fun m!428029 () Bool)

(assert (=> start!65192 m!428029))

(declare-fun m!428031 () Bool)

(assert (=> b!292487 m!428031))

(declare-fun m!428033 () Bool)

(assert (=> b!292487 m!428033))

(declare-fun m!428035 () Bool)

(assert (=> b!292487 m!428035))

(declare-fun m!428037 () Bool)

(assert (=> b!292487 m!428037))

(declare-fun m!428039 () Bool)

(assert (=> b!292487 m!428039))

(push 1)

(assert (not b!292487))

(assert (not b!292485))

(assert (not start!65192))

(assert (not b!292488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

