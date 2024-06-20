; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31028 () Bool)

(assert start!31028)

(declare-fun b!156569 () Bool)

(declare-fun e!105817 () Bool)

(assert (=> b!156569 (= e!105817 false)))

(declare-fun lt!245205 () (_ BitVec 64))

(declare-datatypes ((array!7186 0))(
  ( (array!7187 (arr!4087 (Array (_ BitVec 32) (_ BitVec 8))) (size!3222 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5702 0))(
  ( (BitStream!5703 (buf!3725 array!7186) (currentByte!6852 (_ BitVec 32)) (currentBit!6847 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5702)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156569 (= lt!245205 (bitIndex!0 (size!3222 (buf!3725 bs!65)) (currentByte!6852 bs!65) (currentBit!6847 bs!65)))))

(declare-fun b!156570 () Bool)

(declare-fun e!105816 () Bool)

(declare-fun array_inv!3011 (array!7186) Bool)

(assert (=> b!156570 (= e!105816 (array_inv!3011 (buf!3725 bs!65)))))

(declare-fun b!156571 () Bool)

(declare-fun e!105818 () Bool)

(declare-fun e!105820 () Bool)

(assert (=> b!156571 (= e!105818 e!105820)))

(declare-fun res!130855 () Bool)

(assert (=> b!156571 (=> (not res!130855) (not e!105820))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!156571 (= res!130855 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun lt!245202 () BitStream!5702)

(declare-datatypes ((tuple2!14028 0))(
  ( (tuple2!14029 (_1!7458 BitStream!5702) (_2!7458 array!7186)) )
))
(declare-fun lt!245203 () tuple2!14028)

(declare-fun arr!153 () array!7186)

(declare-fun readByteArrayLoopPure!0 (BitStream!5702 array!7186 (_ BitVec 32) (_ BitVec 32)) tuple2!14028)

(declare-datatypes ((tuple2!14030 0))(
  ( (tuple2!14031 (_1!7459 BitStream!5702) (_2!7459 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5702) tuple2!14030)

(assert (=> b!156571 (= lt!245203 (readByteArrayLoopPure!0 lt!245202 (array!7187 (store (arr!4087 arr!153) from!240 (_2!7459 (readBytePure!0 bs!65))) (size!3222 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5702 (_ BitVec 32)) BitStream!5702)

(assert (=> b!156571 (= lt!245202 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245204 () tuple2!14028)

(assert (=> b!156571 (= lt!245204 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156572 () Bool)

(assert (=> b!156572 (= e!105820 e!105817)))

(declare-fun res!130858 () Bool)

(assert (=> b!156572 (=> (not res!130858) (not e!105817))))

(assert (=> b!156572 (= res!130858 (= (size!3222 (buf!3725 bs!65)) (size!3222 (buf!3725 lt!245202))))))

(declare-fun lt!245206 () tuple2!14030)

(assert (=> b!156572 (= lt!245206 (readBytePure!0 lt!245202))))

(declare-fun res!130856 () Bool)

(assert (=> start!31028 (=> (not res!130856) (not e!105818))))

(assert (=> start!31028 (= res!130856 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3222 arr!153))))))

(assert (=> start!31028 e!105818))

(assert (=> start!31028 true))

(assert (=> start!31028 (array_inv!3011 arr!153)))

(declare-fun inv!12 (BitStream!5702) Bool)

(assert (=> start!31028 (and (inv!12 bs!65) e!105816)))

(declare-fun b!156573 () Bool)

(declare-fun res!130859 () Bool)

(assert (=> b!156573 (=> (not res!130859) (not e!105818))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156573 (= res!130859 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3222 (buf!3725 bs!65))) ((_ sign_extend 32) (currentByte!6852 bs!65)) ((_ sign_extend 32) (currentBit!6847 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156574 () Bool)

(declare-fun res!130857 () Bool)

(assert (=> b!156574 (=> (not res!130857) (not e!105817))))

(assert (=> b!156574 (= res!130857 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3222 (buf!3725 lt!245202)) (currentByte!6852 lt!245202) (currentBit!6847 lt!245202))))))

(assert (= (and start!31028 res!130856) b!156573))

(assert (= (and b!156573 res!130859) b!156571))

(assert (= (and b!156571 res!130855) b!156572))

(assert (= (and b!156572 res!130858) b!156574))

(assert (= (and b!156574 res!130857) b!156569))

(assert (= start!31028 b!156570))

(declare-fun m!244137 () Bool)

(assert (=> b!156572 m!244137))

(declare-fun m!244139 () Bool)

(assert (=> b!156573 m!244139))

(declare-fun m!244141 () Bool)

(assert (=> b!156571 m!244141))

(declare-fun m!244143 () Bool)

(assert (=> b!156571 m!244143))

(declare-fun m!244145 () Bool)

(assert (=> b!156571 m!244145))

(declare-fun m!244147 () Bool)

(assert (=> b!156571 m!244147))

(declare-fun m!244149 () Bool)

(assert (=> b!156571 m!244149))

(declare-fun m!244151 () Bool)

(assert (=> b!156574 m!244151))

(declare-fun m!244153 () Bool)

(assert (=> start!31028 m!244153))

(declare-fun m!244155 () Bool)

(assert (=> start!31028 m!244155))

(declare-fun m!244157 () Bool)

(assert (=> b!156570 m!244157))

(declare-fun m!244159 () Bool)

(assert (=> b!156569 m!244159))

(push 1)

(assert (not start!31028))

(assert (not b!156574))

