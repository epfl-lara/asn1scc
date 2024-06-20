; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21870 () Bool)

(assert start!21870)

(declare-fun b!110396 () Bool)

(declare-fun e!72394 () Bool)

(assert (=> b!110396 (= e!72394 true)))

(declare-datatypes ((array!5050 0))(
  ( (array!5051 (arr!2890 (Array (_ BitVec 32) (_ BitVec 8))) (size!2297 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4068 0))(
  ( (BitStream!4069 (buf!2691 array!5050) (currentByte!5245 (_ BitVec 32)) (currentBit!5240 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9188 0))(
  ( (tuple2!9189 (_1!4851 BitStream!4068) (_2!4851 BitStream!4068)) )
))
(declare-fun lt!167102 () tuple2!9188)

(declare-fun thiss!1305 () BitStream!4068)

(declare-fun reader!0 (BitStream!4068 BitStream!4068) tuple2!9188)

(assert (=> b!110396 (= lt!167102 (reader!0 thiss!1305 thiss!1305))))

(declare-fun res!91135 () Bool)

(declare-fun e!72398 () Bool)

(assert (=> start!21870 (=> (not res!91135) (not e!72398))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21870 (= res!91135 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21870 e!72398))

(assert (=> start!21870 true))

(declare-fun e!72396 () Bool)

(declare-fun inv!12 (BitStream!4068) Bool)

(assert (=> start!21870 (and (inv!12 thiss!1305) e!72396)))

(declare-fun b!110397 () Bool)

(declare-fun e!72395 () Bool)

(assert (=> b!110397 (= e!72398 e!72395)))

(declare-fun res!91131 () Bool)

(assert (=> b!110397 (=> (not res!91131) (not e!72395))))

(declare-fun lt!167101 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110397 (= res!91131 (validate_offset_bits!1 ((_ sign_extend 32) (size!2297 (buf!2691 thiss!1305))) ((_ sign_extend 32) (currentByte!5245 thiss!1305)) ((_ sign_extend 32) (currentBit!5240 thiss!1305)) lt!167101))))

(assert (=> b!110397 (= lt!167101 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110398 () Bool)

(declare-fun array_inv!2099 (array!5050) Bool)

(assert (=> b!110398 (= e!72396 (array_inv!2099 (buf!2691 thiss!1305)))))

(declare-fun b!110399 () Bool)

(declare-fun res!91132 () Bool)

(assert (=> b!110399 (=> (not res!91132) (not e!72395))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110399 (= res!91132 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110400 () Bool)

(declare-fun res!91134 () Bool)

(assert (=> b!110400 (=> (not res!91134) (not e!72395))))

(assert (=> b!110400 (= res!91134 (bvsge i!615 nBits!396))))

(declare-fun b!110401 () Bool)

(assert (=> b!110401 (= e!72395 (not e!72394))))

(declare-fun res!91133 () Bool)

(assert (=> b!110401 (=> res!91133 e!72394)))

(declare-fun lt!167100 () (_ BitVec 64))

(assert (=> b!110401 (= res!91133 (not (= lt!167100 (bvadd lt!167100 lt!167101))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110401 (= lt!167100 (bitIndex!0 (size!2297 (buf!2691 thiss!1305)) (currentByte!5245 thiss!1305) (currentBit!5240 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4068 BitStream!4068) Bool)

(assert (=> b!110401 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6759 0))(
  ( (Unit!6760) )
))
(declare-fun lt!167099 () Unit!6759)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4068) Unit!6759)

(assert (=> b!110401 (= lt!167099 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (= (and start!21870 res!91135) b!110397))

(assert (= (and b!110397 res!91131) b!110399))

(assert (= (and b!110399 res!91132) b!110400))

(assert (= (and b!110400 res!91134) b!110401))

(assert (= (and b!110401 (not res!91133)) b!110396))

(assert (= start!21870 b!110398))

(declare-fun m!163965 () Bool)

(assert (=> start!21870 m!163965))

(declare-fun m!163967 () Bool)

(assert (=> b!110397 m!163967))

(declare-fun m!163969 () Bool)

(assert (=> b!110401 m!163969))

(declare-fun m!163971 () Bool)

(assert (=> b!110401 m!163971))

(declare-fun m!163973 () Bool)

(assert (=> b!110401 m!163973))

(declare-fun m!163975 () Bool)

(assert (=> b!110399 m!163975))

(declare-fun m!163977 () Bool)

(assert (=> b!110398 m!163977))

(declare-fun m!163979 () Bool)

(assert (=> b!110396 m!163979))

(check-sat (not b!110396) (not b!110401) (not b!110398) (not b!110399) (not start!21870) (not b!110397))
(check-sat)
