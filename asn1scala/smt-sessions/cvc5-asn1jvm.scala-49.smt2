; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1052 () Bool)

(assert start!1052)

(declare-fun b!4062 () Bool)

(declare-fun res!5475 () Bool)

(declare-fun e!2634 () Bool)

(assert (=> b!4062 (=> (not res!5475) (not e!2634))))

(declare-datatypes ((array!315 0))(
  ( (array!316 (arr!520 (Array (_ BitVec 32) (_ BitVec 8))) (size!130 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!238 0))(
  ( (BitStream!239 (buf!451 array!315) (currentByte!1430 (_ BitVec 32)) (currentBit!1425 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!238)

(declare-datatypes ((Unit!310 0))(
  ( (Unit!311) )
))
(declare-datatypes ((tuple2!424 0))(
  ( (tuple2!425 (_1!228 Unit!310) (_2!228 BitStream!238)) )
))
(declare-fun lt!5178 () tuple2!424)

(declare-fun isPrefixOf!0 (BitStream!238 BitStream!238) Bool)

(assert (=> b!4062 (= res!5475 (isPrefixOf!0 thiss!1486 (_2!228 lt!5178)))))

(declare-fun res!5474 () Bool)

(declare-fun e!2636 () Bool)

(assert (=> start!1052 (=> (not res!5474) (not e!2636))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!315)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1052 (= res!5474 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!130 srcBuffer!6))))))))

(assert (=> start!1052 e!2636))

(assert (=> start!1052 true))

(declare-fun array_inv!125 (array!315) Bool)

(assert (=> start!1052 (array_inv!125 srcBuffer!6)))

(declare-fun e!2632 () Bool)

(declare-fun inv!12 (BitStream!238) Bool)

(assert (=> start!1052 (and (inv!12 thiss!1486) e!2632)))

(declare-fun b!4063 () Bool)

(assert (=> b!4063 (= e!2634 (not true))))

(declare-datatypes ((List!30 0))(
  ( (Nil!27) (Cons!26 (h!145 Bool) (t!780 List!30)) )
))
(declare-fun lt!5176 () List!30)

(declare-datatypes ((tuple2!426 0))(
  ( (tuple2!427 (_1!229 BitStream!238) (_2!229 BitStream!238)) )
))
(declare-fun lt!5180 () tuple2!426)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!238 BitStream!238 (_ BitVec 64)) List!30)

(assert (=> b!4063 (= lt!5176 (bitStreamReadBitsIntoList!0 (_2!228 lt!5178) (_1!229 lt!5180) nBits!460))))

(declare-datatypes ((tuple2!428 0))(
  ( (tuple2!429 (_1!230 array!315) (_2!230 BitStream!238)) )
))
(declare-fun lt!5179 () tuple2!428)

(declare-fun readBits!0 (BitStream!238 (_ BitVec 64)) tuple2!428)

(assert (=> b!4063 (= lt!5179 (readBits!0 (_1!229 lt!5180) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4063 (validate_offset_bits!1 ((_ sign_extend 32) (size!130 (buf!451 (_2!228 lt!5178)))) ((_ sign_extend 32) (currentByte!1430 thiss!1486)) ((_ sign_extend 32) (currentBit!1425 thiss!1486)) nBits!460)))

(declare-fun lt!5177 () Unit!310)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!238 array!315 (_ BitVec 64)) Unit!310)

(assert (=> b!4063 (= lt!5177 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!451 (_2!228 lt!5178)) nBits!460))))

(declare-fun reader!0 (BitStream!238 BitStream!238) tuple2!426)

(assert (=> b!4063 (= lt!5180 (reader!0 thiss!1486 (_2!228 lt!5178)))))

(declare-fun b!4064 () Bool)

(declare-fun res!5471 () Bool)

(assert (=> b!4064 (=> (not res!5471) (not e!2636))))

(assert (=> b!4064 (= res!5471 (validate_offset_bits!1 ((_ sign_extend 32) (size!130 (buf!451 thiss!1486))) ((_ sign_extend 32) (currentByte!1430 thiss!1486)) ((_ sign_extend 32) (currentBit!1425 thiss!1486)) nBits!460))))

(declare-fun b!4065 () Bool)

(declare-fun res!5472 () Bool)

(assert (=> b!4065 (=> (not res!5472) (not e!2634))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4065 (= res!5472 (= (bitIndex!0 (size!130 (buf!451 (_2!228 lt!5178))) (currentByte!1430 (_2!228 lt!5178)) (currentBit!1425 (_2!228 lt!5178))) (bvadd (bitIndex!0 (size!130 (buf!451 thiss!1486)) (currentByte!1430 thiss!1486) (currentBit!1425 thiss!1486)) nBits!460)))))

(declare-fun b!4066 () Bool)

(assert (=> b!4066 (= e!2632 (array_inv!125 (buf!451 thiss!1486)))))

(declare-fun b!4067 () Bool)

(assert (=> b!4067 (= e!2636 e!2634)))

(declare-fun res!5476 () Bool)

(assert (=> b!4067 (=> (not res!5476) (not e!2634))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4067 (= res!5476 (invariant!0 (currentBit!1425 (_2!228 lt!5178)) (currentByte!1430 (_2!228 lt!5178)) (size!130 (buf!451 (_2!228 lt!5178)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!238 array!315 (_ BitVec 64) (_ BitVec 64)) tuple2!424)

(assert (=> b!4067 (= lt!5178 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4068 () Bool)

(declare-fun res!5473 () Bool)

(assert (=> b!4068 (=> (not res!5473) (not e!2634))))

(assert (=> b!4068 (= res!5473 (= (size!130 (buf!451 thiss!1486)) (size!130 (buf!451 (_2!228 lt!5178)))))))

(assert (= (and start!1052 res!5474) b!4064))

(assert (= (and b!4064 res!5471) b!4067))

(assert (= (and b!4067 res!5476) b!4068))

(assert (= (and b!4068 res!5473) b!4065))

(assert (= (and b!4065 res!5472) b!4062))

(assert (= (and b!4062 res!5475) b!4063))

(assert (= start!1052 b!4066))

(declare-fun m!4749 () Bool)

(assert (=> b!4067 m!4749))

(declare-fun m!4751 () Bool)

(assert (=> b!4067 m!4751))

(declare-fun m!4753 () Bool)

(assert (=> b!4066 m!4753))

(declare-fun m!4755 () Bool)

(assert (=> b!4065 m!4755))

(declare-fun m!4757 () Bool)

(assert (=> b!4065 m!4757))

(declare-fun m!4759 () Bool)

(assert (=> b!4063 m!4759))

(declare-fun m!4761 () Bool)

(assert (=> b!4063 m!4761))

(declare-fun m!4763 () Bool)

(assert (=> b!4063 m!4763))

(declare-fun m!4765 () Bool)

(assert (=> b!4063 m!4765))

(declare-fun m!4767 () Bool)

(assert (=> b!4063 m!4767))

(declare-fun m!4769 () Bool)

(assert (=> b!4062 m!4769))

(declare-fun m!4771 () Bool)

(assert (=> start!1052 m!4771))

(declare-fun m!4773 () Bool)

(assert (=> start!1052 m!4773))

(declare-fun m!4775 () Bool)

(assert (=> b!4064 m!4775))

(push 1)

(assert (not b!4066))

(assert (not b!4062))

(assert (not b!4067))

(assert (not b!4063))

(assert (not start!1052))

(assert (not b!4065))

(assert (not b!4064))

(check-sat)

(pop 1)

