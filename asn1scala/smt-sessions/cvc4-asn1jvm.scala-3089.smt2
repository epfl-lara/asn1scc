; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71126 () Bool)

(assert start!71126)

(declare-fun b!321037 () Bool)

(declare-fun res!263683 () Bool)

(declare-fun e!231173 () Bool)

(assert (=> b!321037 (=> (not res!263683) (not e!231173))))

(declare-datatypes ((array!20299 0))(
  ( (array!20300 (arr!9939 (Array (_ BitVec 32) (_ BitVec 8))) (size!8847 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13856 0))(
  ( (BitStream!13857 (buf!7989 array!20299) (currentByte!14736 (_ BitVec 32)) (currentBit!14731 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13856)

(declare-fun nBits!542 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321037 (= res!263683 (validate_offset_bits!1 ((_ sign_extend 32) (size!8847 (buf!7989 thiss!1780))) ((_ sign_extend 32) (currentByte!14736 thiss!1780)) ((_ sign_extend 32) (currentBit!14731 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun b!321040 () Bool)

(declare-fun e!231172 () Bool)

(declare-fun array_inv!8399 (array!20299) Bool)

(assert (=> b!321040 (= e!231172 (array_inv!8399 (buf!7989 thiss!1780)))))

(declare-fun b!321038 () Bool)

(declare-fun res!263682 () Bool)

(assert (=> b!321038 (=> (not res!263682) (not e!231173))))

(declare-datatypes ((tuple2!23472 0))(
  ( (tuple2!23473 (_1!13365 (_ BitVec 64)) (_2!13365 BitStream!13856)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!13856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23472)

(assert (=> b!321038 (= res!263682 (= (buf!7989 (_2!13365 (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))) (buf!7989 thiss!1780)))))

(declare-fun b!321039 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321039 (= e!231173 (not (invariant!0 (currentBit!14731 thiss!1780) (currentByte!14736 thiss!1780) (size!8847 (buf!7989 thiss!1780)))))))

(declare-fun res!263681 () Bool)

(assert (=> start!71126 (=> (not res!263681) (not e!231173))))

(assert (=> start!71126 (= res!263681 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71126 e!231173))

(assert (=> start!71126 true))

(declare-fun inv!12 (BitStream!13856) Bool)

(assert (=> start!71126 (and (inv!12 thiss!1780) e!231172)))

(assert (= (and start!71126 res!263681) b!321037))

(assert (= (and b!321037 res!263683) b!321038))

(assert (= (and b!321038 res!263682) b!321039))

(assert (= start!71126 b!321040))

(declare-fun m!459395 () Bool)

(assert (=> b!321038 m!459395))

(declare-fun m!459397 () Bool)

(assert (=> b!321039 m!459397))

(declare-fun m!459399 () Bool)

(assert (=> start!71126 m!459399))

(declare-fun m!459401 () Bool)

(assert (=> b!321037 m!459401))

(declare-fun m!459403 () Bool)

(assert (=> b!321040 m!459403))

(push 1)

(assert (not start!71126))

(assert (not b!321040))

(assert (not b!321037))

(assert (not b!321038))

(assert (not b!321039))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105158 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105158 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8847 (buf!7989 thiss!1780))) ((_ sign_extend 32) (currentByte!14736 thiss!1780)) ((_ sign_extend 32) (currentBit!14731 thiss!1780)) ((_ sign_extend 32) nBits!542)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8847 (buf!7989 thiss!1780))) ((_ sign_extend 32) (currentByte!14736 thiss!1780)) ((_ sign_extend 32) (currentBit!14731 thiss!1780))) ((_ sign_extend 32) nBits!542)))))

(declare-fun bs!27652 () Bool)

(assert (= bs!27652 d!105158))

(declare-fun m!459407 () Bool)

(assert (=> bs!27652 m!459407))

(assert (=> b!321037 d!105158))

(declare-fun b!321090 () Bool)

(declare-fun e!231196 () Bool)

(declare-fun e!231197 () Bool)

(assert (=> b!321090 (= e!231196 e!231197)))

(declare-fun res!263722 () Bool)

(assert (=> b!321090 (=> res!263722 e!231197)))

(assert (=> b!321090 (= res!263722 (not (bvslt #b00000000000000000000000000000000 nBits!542)))))

(declare-fun b!321091 () Bool)

(declare-fun e!231198 () tuple2!23472)

(assert (=> b!321091 (= e!231198 (tuple2!23473 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1780))))

(declare-fun b!321092 () Bool)

(declare-fun res!263721 () Bool)

(assert (=> b!321092 (=> (not res!263721) (not e!231196))))

(declare-fun lt!444372 () (_ BitVec 64))

(declare-fun lt!444374 () (_ BitVec 64))

(declare-fun lt!444373 () tuple2!23472)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321092 (= res!263721 (= (bitIndex!0 (size!8847 (buf!7989 (_2!13365 lt!444373))) (currentByte!14736 (_2!13365 lt!444373)) (currentBit!14731 (_2!13365 lt!444373))) (bvadd lt!444372 lt!444374)))))

(assert (=> b!321092 (or (not (= (bvand lt!444372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444374 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444372 lt!444374) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!321092 (= lt!444374 ((_ sign_extend 32) (bvsub nBits!542 #b00000000000000000000000000000000)))))

