; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21862 () Bool)

(assert start!21862)

(declare-fun b!110324 () Bool)

(declare-fun res!91071 () Bool)

(declare-fun e!72338 () Bool)

(assert (=> b!110324 (=> (not res!91071) (not e!72338))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110324 (= res!91071 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110325 () Bool)

(declare-fun e!72336 () Bool)

(assert (=> b!110325 (= e!72336 e!72338)))

(declare-fun res!91075 () Bool)

(assert (=> b!110325 (=> (not res!91075) (not e!72338))))

(declare-datatypes ((array!5042 0))(
  ( (array!5043 (arr!2886 (Array (_ BitVec 32) (_ BitVec 8))) (size!2293 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4060 0))(
  ( (BitStream!4061 (buf!2687 array!5042) (currentByte!5241 (_ BitVec 32)) (currentBit!5236 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4060)

(declare-fun lt!167053 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110325 (= res!91075 (validate_offset_bits!1 ((_ sign_extend 32) (size!2293 (buf!2687 thiss!1305))) ((_ sign_extend 32) (currentByte!5241 thiss!1305)) ((_ sign_extend 32) (currentBit!5236 thiss!1305)) lt!167053))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!110325 (= lt!167053 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!91072 () Bool)

(assert (=> start!21862 (=> (not res!91072) (not e!72336))))

(assert (=> start!21862 (= res!91072 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21862 e!72336))

(assert (=> start!21862 true))

(declare-fun e!72337 () Bool)

(declare-fun inv!12 (BitStream!4060) Bool)

(assert (=> start!21862 (and (inv!12 thiss!1305) e!72337)))

(declare-fun b!110326 () Bool)

(declare-fun res!91073 () Bool)

(assert (=> b!110326 (=> (not res!91073) (not e!72338))))

(assert (=> b!110326 (= res!91073 (bvsge i!615 nBits!396))))

(declare-fun b!110327 () Bool)

(declare-fun e!72335 () Bool)

(assert (=> b!110327 (= e!72338 (not e!72335))))

(declare-fun res!91074 () Bool)

(assert (=> b!110327 (=> res!91074 e!72335)))

(declare-fun lt!167051 () (_ BitVec 64))

(assert (=> b!110327 (= res!91074 (not (= lt!167051 (bvadd lt!167051 lt!167053))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110327 (= lt!167051 (bitIndex!0 (size!2293 (buf!2687 thiss!1305)) (currentByte!5241 thiss!1305) (currentBit!5236 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4060 BitStream!4060) Bool)

(assert (=> b!110327 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6751 0))(
  ( (Unit!6752) )
))
(declare-fun lt!167054 () Unit!6751)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4060) Unit!6751)

(assert (=> b!110327 (= lt!167054 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110328 () Bool)

(assert (=> b!110328 (= e!72335 true)))

(declare-datatypes ((tuple2!9180 0))(
  ( (tuple2!9181 (_1!4847 BitStream!4060) (_2!4847 BitStream!4060)) )
))
(declare-fun lt!167052 () tuple2!9180)

(declare-fun reader!0 (BitStream!4060 BitStream!4060) tuple2!9180)

(assert (=> b!110328 (= lt!167052 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110329 () Bool)

(declare-fun array_inv!2095 (array!5042) Bool)

(assert (=> b!110329 (= e!72337 (array_inv!2095 (buf!2687 thiss!1305)))))

(assert (= (and start!21862 res!91072) b!110325))

(assert (= (and b!110325 res!91075) b!110324))

(assert (= (and b!110324 res!91071) b!110326))

(assert (= (and b!110326 res!91073) b!110327))

(assert (= (and b!110327 (not res!91074)) b!110328))

(assert (= start!21862 b!110329))

(declare-fun m!163901 () Bool)

(assert (=> b!110325 m!163901))

(declare-fun m!163903 () Bool)

(assert (=> b!110327 m!163903))

(declare-fun m!163905 () Bool)

(assert (=> b!110327 m!163905))

(declare-fun m!163907 () Bool)

(assert (=> b!110327 m!163907))

(declare-fun m!163909 () Bool)

(assert (=> b!110329 m!163909))

(declare-fun m!163911 () Bool)

(assert (=> start!21862 m!163911))

(declare-fun m!163913 () Bool)

(assert (=> b!110324 m!163913))

(declare-fun m!163915 () Bool)

(assert (=> b!110328 m!163915))

(push 1)

(assert (not b!110329))

(assert (not b!110327))

(assert (not b!110324))

(assert (not start!21862))

(assert (not b!110325))

(assert (not b!110328))

(check-sat)

