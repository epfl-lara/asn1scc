; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65186 () Bool)

(assert start!65186)

(declare-fun res!241550 () Bool)

(declare-fun e!208615 () Bool)

(assert (=> start!65186 (=> (not res!241550) (not e!208615))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17391 0))(
  ( (array!17392 (arr!8556 (Array (_ BitVec 32) (_ BitVec 8))) (size!7530 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17391)

(assert (=> start!65186 (= res!241550 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7530 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65186 e!208615))

(declare-datatypes ((BitStream!13070 0))(
  ( (BitStream!13071 (buf!7596 array!17391) (currentByte!14051 (_ BitVec 32)) (currentBit!14046 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13070)

(declare-fun e!208614 () Bool)

(declare-fun inv!12 (BitStream!13070) Bool)

(assert (=> start!65186 (and (inv!12 thiss!1728) e!208614)))

(assert (=> start!65186 true))

(declare-fun array_inv!7142 (array!17391) Bool)

(assert (=> start!65186 (array_inv!7142 arr!273)))

(declare-fun b!292452 () Bool)

(assert (=> b!292452 (= e!208614 (array_inv!7142 (buf!7596 thiss!1728)))))

(declare-fun b!292449 () Bool)

(declare-fun res!241548 () Bool)

(assert (=> b!292449 (=> (not res!241548) (not e!208615))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292449 (= res!241548 (validate_offset_bits!1 ((_ sign_extend 32) (size!7530 (buf!7596 thiss!1728))) ((_ sign_extend 32) (currentByte!14051 thiss!1728)) ((_ sign_extend 32) (currentBit!14046 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292451 () Bool)

(assert (=> b!292451 (= e!208615 (not true))))

(declare-fun lt!424761 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292451 (= lt!424761 (bitIndex!0 (size!7530 (buf!7596 thiss!1728)) (currentByte!14051 thiss!1728) (currentBit!14046 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17391 array!17391 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292451 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20349 0))(
  ( (Unit!20350) )
))
(declare-fun lt!424758 () Unit!20349)

(declare-fun lt!424759 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17391 array!17391 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20349)

(assert (=> b!292451 (= lt!424758 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424759 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292451 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424759)))

(assert (=> b!292451 (= lt!424759 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7530 arr!273))))))

(declare-fun lt!424760 () Unit!20349)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17391) Unit!20349)

(assert (=> b!292451 (= lt!424760 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292450 () Bool)

(declare-fun res!241549 () Bool)

(assert (=> b!292450 (=> (not res!241549) (not e!208615))))

(assert (=> b!292450 (= res!241549 (bvsge from!505 to!474))))

(assert (= (and start!65186 res!241550) b!292449))

(assert (= (and b!292449 res!241548) b!292450))

(assert (= (and b!292450 res!241549) b!292451))

(assert (= start!65186 b!292452))

(declare-fun m!427969 () Bool)

(assert (=> start!65186 m!427969))

(declare-fun m!427971 () Bool)

(assert (=> start!65186 m!427971))

(declare-fun m!427973 () Bool)

(assert (=> b!292452 m!427973))

(declare-fun m!427975 () Bool)

(assert (=> b!292449 m!427975))

(declare-fun m!427977 () Bool)

(assert (=> b!292451 m!427977))

(declare-fun m!427979 () Bool)

(assert (=> b!292451 m!427979))

(declare-fun m!427981 () Bool)

(assert (=> b!292451 m!427981))

(declare-fun m!427983 () Bool)

(assert (=> b!292451 m!427983))

(declare-fun m!427985 () Bool)

(assert (=> b!292451 m!427985))

(push 1)

(assert (not start!65186))

(assert (not b!292449))

(assert (not b!292451))

(assert (not b!292452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

