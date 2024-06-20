; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21872 () Bool)

(assert start!21872)

(declare-fun b!110415 () Bool)

(declare-fun res!91146 () Bool)

(declare-fun e!72412 () Bool)

(assert (=> b!110415 (=> (not res!91146) (not e!72412))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110415 (= res!91146 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110416 () Bool)

(declare-fun e!72410 () Bool)

(declare-datatypes ((array!5052 0))(
  ( (array!5053 (arr!2891 (Array (_ BitVec 32) (_ BitVec 8))) (size!2298 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4070 0))(
  ( (BitStream!4071 (buf!2692 array!5052) (currentByte!5246 (_ BitVec 32)) (currentBit!5241 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4070)

(declare-fun array_inv!2100 (array!5052) Bool)

(assert (=> b!110416 (= e!72410 (array_inv!2100 (buf!2692 thiss!1305)))))

(declare-fun b!110417 () Bool)

(declare-fun e!72411 () Bool)

(assert (=> b!110417 (= e!72411 e!72412)))

(declare-fun res!91147 () Bool)

(assert (=> b!110417 (=> (not res!91147) (not e!72412))))

(declare-fun lt!167113 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110417 (= res!91147 (validate_offset_bits!1 ((_ sign_extend 32) (size!2298 (buf!2692 thiss!1305))) ((_ sign_extend 32) (currentByte!5246 thiss!1305)) ((_ sign_extend 32) (currentBit!5241 thiss!1305)) lt!167113))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!110417 (= lt!167113 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110418 () Bool)

(declare-fun e!72413 () Bool)

(assert (=> b!110418 (= e!72413 true)))

(declare-datatypes ((tuple2!9190 0))(
  ( (tuple2!9191 (_1!4852 BitStream!4070) (_2!4852 BitStream!4070)) )
))
(declare-fun lt!167112 () tuple2!9190)

(declare-fun reader!0 (BitStream!4070 BitStream!4070) tuple2!9190)

(assert (=> b!110418 (= lt!167112 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110419 () Bool)

(assert (=> b!110419 (= e!72412 (not e!72413))))

(declare-fun res!91150 () Bool)

(assert (=> b!110419 (=> res!91150 e!72413)))

(declare-fun lt!167111 () (_ BitVec 64))

(assert (=> b!110419 (= res!91150 (not (= lt!167111 (bvadd lt!167111 lt!167113))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110419 (= lt!167111 (bitIndex!0 (size!2298 (buf!2692 thiss!1305)) (currentByte!5246 thiss!1305) (currentBit!5241 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4070 BitStream!4070) Bool)

(assert (=> b!110419 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6761 0))(
  ( (Unit!6762) )
))
(declare-fun lt!167114 () Unit!6761)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4070) Unit!6761)

(assert (=> b!110419 (= lt!167114 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun res!91149 () Bool)

(assert (=> start!21872 (=> (not res!91149) (not e!72411))))

(assert (=> start!21872 (= res!91149 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21872 e!72411))

(assert (=> start!21872 true))

(declare-fun inv!12 (BitStream!4070) Bool)

(assert (=> start!21872 (and (inv!12 thiss!1305) e!72410)))

(declare-fun b!110414 () Bool)

(declare-fun res!91148 () Bool)

(assert (=> b!110414 (=> (not res!91148) (not e!72412))))

(assert (=> b!110414 (= res!91148 (bvsge i!615 nBits!396))))

(assert (= (and start!21872 res!91149) b!110417))

(assert (= (and b!110417 res!91147) b!110415))

(assert (= (and b!110415 res!91146) b!110414))

(assert (= (and b!110414 res!91148) b!110419))

(assert (= (and b!110419 (not res!91150)) b!110418))

(assert (= start!21872 b!110416))

(declare-fun m!163981 () Bool)

(assert (=> start!21872 m!163981))

(declare-fun m!163983 () Bool)

(assert (=> b!110418 m!163983))

(declare-fun m!163985 () Bool)

(assert (=> b!110416 m!163985))

(declare-fun m!163987 () Bool)

(assert (=> b!110415 m!163987))

(declare-fun m!163989 () Bool)

(assert (=> b!110419 m!163989))

(declare-fun m!163991 () Bool)

(assert (=> b!110419 m!163991))

(declare-fun m!163993 () Bool)

(assert (=> b!110419 m!163993))

(declare-fun m!163995 () Bool)

(assert (=> b!110417 m!163995))

(push 1)

(assert (not b!110415))

(assert (not b!110416))

(assert (not b!110419))

(assert (not b!110417))

(assert (not b!110418))

(assert (not start!21872))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

