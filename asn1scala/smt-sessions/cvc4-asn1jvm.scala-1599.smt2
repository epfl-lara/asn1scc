; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45380 () Bool)

(assert start!45380)

(declare-fun b!220133 () Bool)

(declare-fun e!149503 () Bool)

(declare-datatypes ((array!10721 0))(
  ( (array!10722 (arr!5640 (Array (_ BitVec 32) (_ BitVec 8))) (size!4710 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8528 0))(
  ( (BitStream!8529 (buf!5257 array!10721) (currentByte!9860 (_ BitVec 32)) (currentBit!9855 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8528)

(declare-fun array_inv!4451 (array!10721) Bool)

(assert (=> b!220133 (= e!149503 (array_inv!4451 (buf!5257 bs!62)))))

(declare-fun b!220134 () Bool)

(declare-fun e!149504 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220134 (= e!149504 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4710 (buf!5257 bs!62))) ((_ sign_extend 32) (currentByte!9860 bs!62)) ((_ sign_extend 32) (currentBit!9855 bs!62)))))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((tuple2!18786 0))(
  ( (tuple2!18787 (_1!10051 BitStream!8528) (_2!10051 (_ BitVec 64))) )
))
(declare-fun lt!347897 () tuple2!18786)

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18786)

(assert (=> b!220134 (= lt!347897 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220136 () Bool)

(declare-fun res!185446 () Bool)

(assert (=> b!220136 (=> (not res!185446) (not e!149504))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220136 (= res!185446 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220137 () Bool)

(declare-fun res!185445 () Bool)

(assert (=> b!220137 (=> (not res!185445) (not e!149504))))

(assert (=> b!220137 (= res!185445 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun res!185444 () Bool)

(assert (=> start!45380 (=> (not res!185444) (not e!149504))))

(assert (=> start!45380 (= res!185444 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45380 e!149504))

(assert (=> start!45380 true))

(declare-fun inv!12 (BitStream!8528) Bool)

(assert (=> start!45380 (and (inv!12 bs!62) e!149503)))

(declare-fun b!220135 () Bool)

(declare-fun res!185447 () Bool)

(assert (=> b!220135 (=> (not res!185447) (not e!149504))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220135 (= res!185447 (validate_offset_bits!1 ((_ sign_extend 32) (size!4710 (buf!5257 bs!62))) ((_ sign_extend 32) (currentByte!9860 bs!62)) ((_ sign_extend 32) (currentBit!9855 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(assert (= (and start!45380 res!185444) b!220135))

(assert (= (and b!220135 res!185447) b!220136))

(assert (= (and b!220136 res!185446) b!220137))

(assert (= (and b!220137 res!185445) b!220134))

(assert (= start!45380 b!220133))

(declare-fun m!338839 () Bool)

(assert (=> b!220134 m!338839))

(declare-fun m!338841 () Bool)

(assert (=> b!220134 m!338841))

(declare-fun m!338843 () Bool)

(assert (=> b!220135 m!338843))

(declare-fun m!338845 () Bool)

(assert (=> b!220136 m!338845))

(declare-fun m!338847 () Bool)

(assert (=> start!45380 m!338847))

(declare-fun m!338849 () Bool)

(assert (=> b!220133 m!338849))

(push 1)

(assert (not b!220136))

(assert (not b!220133))

(assert (not start!45380))

(assert (not b!220135))

(assert (not b!220134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74067 () Bool)

(assert (=> d!74067 (= (array_inv!4451 (buf!5257 bs!62)) (bvsge (size!4710 (buf!5257 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220133 d!74067))

(declare-fun d!74069 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74069 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4710 (buf!5257 bs!62))) ((_ sign_extend 32) (currentByte!9860 bs!62)) ((_ sign_extend 32) (currentBit!9855 bs!62))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4710 (buf!5257 bs!62))) ((_ sign_extend 32) (currentByte!9860 bs!62)) ((_ sign_extend 32) (currentBit!9855 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!18108 () Bool)

(assert (= bs!18108 d!74069))

(declare-fun m!338853 () Bool)

(assert (=> bs!18108 m!338853))

(assert (=> b!220134 d!74069))

(declare-fun d!74073 () Bool)

(declare-datatypes ((tuple2!18790 0))(
  ( (tuple2!18791 (_1!10053 (_ BitVec 64)) (_2!10053 BitStream!8528)) )
))
(declare-fun lt!347900 () tuple2!18790)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18790)

(assert (=> d!74073 (= lt!347900 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74073 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18787 (_2!10053 lt!347900) (_1!10053 lt!347900)))))

(declare-fun bs!18111 () Bool)

(assert (= bs!18111 d!74073))

(declare-fun m!338859 () Bool)

(assert (=> bs!18111 m!338859))

(assert (=> b!220134 d!74073))

(declare-fun d!74083 () Bool)

(assert (=> d!74083 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4710 (buf!5257 bs!62))) ((_ sign_extend 32) (currentByte!9860 bs!62)) ((_ sign_extend 32) (currentBit!9855 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4710 (buf!5257 bs!62))) ((_ sign_extend 32) (currentByte!9860 bs!62)) ((_ sign_extend 32) (currentBit!9855 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18112 () Bool)

(assert (= bs!18112 d!74083))

(assert (=> bs!18112 m!338853))

(assert (=> b!220135 d!74083))

(declare-fun d!74085 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74085 (= (inv!12 bs!62) (invariant!0 (currentBit!9855 bs!62) (currentByte!9860 bs!62) (size!4710 (buf!5257 bs!62))))))

(declare-fun bs!18116 () Bool)

(assert (= bs!18116 d!74085))

(declare-fun m!338865 () Bool)

(assert (=> bs!18116 m!338865))

(assert (=> start!45380 d!74085))

(declare-fun d!74091 () Bool)

(assert (=> d!74091 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220136 d!74091))

(push 1)

(assert (not d!74083))

(assert (not d!74085))

(assert (not d!74073))

(assert (not d!74069))

(check-sat)

(pop 1)

(push 1)

(check-sat)

