; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21848 () Bool)

(assert start!21848)

(declare-fun b!110199 () Bool)

(declare-fun e!72231 () Bool)

(assert (=> b!110199 (= e!72231 (not true))))

(declare-fun lt!166970 () (_ BitVec 64))

(declare-datatypes ((array!5028 0))(
  ( (array!5029 (arr!2879 (Array (_ BitVec 32) (_ BitVec 8))) (size!2286 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4046 0))(
  ( (BitStream!4047 (buf!2680 array!5028) (currentByte!5234 (_ BitVec 32)) (currentBit!5229 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4046)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110199 (= lt!166970 (bitIndex!0 (size!2286 (buf!2680 thiss!1305)) (currentByte!5234 thiss!1305) (currentBit!5229 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4046 BitStream!4046) Bool)

(assert (=> b!110199 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6737 0))(
  ( (Unit!6738) )
))
(declare-fun lt!166969 () Unit!6737)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4046) Unit!6737)

(assert (=> b!110199 (= lt!166969 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110200 () Bool)

(declare-fun res!90968 () Bool)

(assert (=> b!110200 (=> (not res!90968) (not e!72231))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!110200 (= res!90968 (bvsge i!615 nBits!396))))

(declare-fun b!110201 () Bool)

(declare-fun e!72232 () Bool)

(declare-fun array_inv!2088 (array!5028) Bool)

(assert (=> b!110201 (= e!72232 (array_inv!2088 (buf!2680 thiss!1305)))))

(declare-fun b!110202 () Bool)

(declare-fun res!90969 () Bool)

(assert (=> b!110202 (=> (not res!90969) (not e!72231))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110202 (= res!90969 (validate_offset_bits!1 ((_ sign_extend 32) (size!2286 (buf!2680 thiss!1305))) ((_ sign_extend 32) (currentByte!5234 thiss!1305)) ((_ sign_extend 32) (currentBit!5229 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!110203 () Bool)

(declare-fun res!90970 () Bool)

(assert (=> b!110203 (=> (not res!90970) (not e!72231))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110203 (= res!90970 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!90967 () Bool)

(assert (=> start!21848 (=> (not res!90967) (not e!72231))))

(assert (=> start!21848 (= res!90967 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21848 e!72231))

(assert (=> start!21848 true))

(declare-fun inv!12 (BitStream!4046) Bool)

(assert (=> start!21848 (and (inv!12 thiss!1305) e!72232)))

(assert (= (and start!21848 res!90967) b!110202))

(assert (= (and b!110202 res!90969) b!110203))

(assert (= (and b!110203 res!90970) b!110200))

(assert (= (and b!110200 res!90968) b!110199))

(assert (= start!21848 b!110201))

(declare-fun m!163791 () Bool)

(assert (=> start!21848 m!163791))

(declare-fun m!163793 () Bool)

(assert (=> b!110199 m!163793))

(declare-fun m!163795 () Bool)

(assert (=> b!110199 m!163795))

(declare-fun m!163797 () Bool)

(assert (=> b!110199 m!163797))

(declare-fun m!163799 () Bool)

(assert (=> b!110203 m!163799))

(declare-fun m!163801 () Bool)

(assert (=> b!110202 m!163801))

(declare-fun m!163803 () Bool)

(assert (=> b!110201 m!163803))

(push 1)

(assert (not b!110203))

(assert (not b!110201))

(assert (not b!110202))

(assert (not b!110199))

(assert (not start!21848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

