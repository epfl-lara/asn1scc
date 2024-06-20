; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55684 () Bool)

(assert start!55684)

(declare-fun res!216922 () Bool)

(declare-fun e!179622 () Bool)

(assert (=> start!55684 (=> (not res!216922) (not e!179622))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55684 (= res!216922 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55684 e!179622))

(assert (=> start!55684 true))

(declare-datatypes ((array!14127 0))(
  ( (array!14128 (arr!7174 (Array (_ BitVec 32) (_ BitVec 8))) (size!6187 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11296 0))(
  ( (BitStream!11297 (buf!6709 array!14127) (currentByte!12338 (_ BitVec 32)) (currentBit!12333 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11296)

(declare-fun e!179620 () Bool)

(declare-fun inv!12 (BitStream!11296) Bool)

(assert (=> start!55684 (and (inv!12 thiss!1754) e!179620)))

(declare-fun b!258945 () Bool)

(declare-fun res!216921 () Bool)

(assert (=> b!258945 (=> (not res!216921) (not e!179622))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258945 (= res!216921 (validate_offset_bits!1 ((_ sign_extend 32) (size!6187 (buf!6709 thiss!1754))) ((_ sign_extend 32) (currentByte!12338 thiss!1754)) ((_ sign_extend 32) (currentBit!12333 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258946 () Bool)

(declare-fun array_inv!5928 (array!14127) Bool)

(assert (=> b!258946 (= e!179620 (array_inv!5928 (buf!6709 thiss!1754)))))

(declare-fun b!258947 () Bool)

(declare-fun e!179621 () Bool)

(assert (=> b!258947 (= e!179621 false)))

(declare-fun lt!400799 () (_ BitVec 64))

(declare-datatypes ((tuple2!22160 0))(
  ( (tuple2!22161 (_1!12016 Bool) (_2!12016 BitStream!11296)) )
))
(declare-fun lt!400797 () tuple2!22160)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258947 (= lt!400799 (bitIndex!0 (size!6187 (buf!6709 (_2!12016 lt!400797))) (currentByte!12338 (_2!12016 lt!400797)) (currentBit!12333 (_2!12016 lt!400797))))))

(declare-fun lt!400798 () (_ BitVec 64))

(assert (=> b!258947 (= lt!400798 (bitIndex!0 (size!6187 (buf!6709 thiss!1754)) (currentByte!12338 thiss!1754) (currentBit!12333 thiss!1754)))))

(declare-fun b!258948 () Bool)

(assert (=> b!258948 (= e!179622 e!179621)))

(declare-fun res!216920 () Bool)

(assert (=> b!258948 (=> (not res!216920) (not e!179621))))

(declare-fun expected!109 () Bool)

(assert (=> b!258948 (= res!216920 (not (= (_1!12016 lt!400797) expected!109)))))

(declare-fun readBit!0 (BitStream!11296) tuple2!22160)

(assert (=> b!258948 (= lt!400797 (readBit!0 thiss!1754))))

(declare-fun b!258949 () Bool)

(declare-fun res!216919 () Bool)

(assert (=> b!258949 (=> (not res!216919) (not e!179622))))

(assert (=> b!258949 (= res!216919 (not (= from!526 nBits!535)))))

(assert (= (and start!55684 res!216922) b!258945))

(assert (= (and b!258945 res!216921) b!258949))

(assert (= (and b!258949 res!216919) b!258948))

(assert (= (and b!258948 res!216920) b!258947))

(assert (= start!55684 b!258946))

(declare-fun m!388307 () Bool)

(assert (=> b!258948 m!388307))

(declare-fun m!388309 () Bool)

(assert (=> b!258945 m!388309))

(declare-fun m!388311 () Bool)

(assert (=> b!258947 m!388311))

(declare-fun m!388313 () Bool)

(assert (=> b!258947 m!388313))

(declare-fun m!388315 () Bool)

(assert (=> b!258946 m!388315))

(declare-fun m!388317 () Bool)

(assert (=> start!55684 m!388317))

(push 1)

(assert (not b!258947))

(assert (not b!258945))

(assert (not b!258946))

(assert (not start!55684))

(assert (not b!258948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

