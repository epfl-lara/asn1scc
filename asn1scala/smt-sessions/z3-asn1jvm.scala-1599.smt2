; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45378 () Bool)

(assert start!45378)

(declare-fun b!220118 () Bool)

(declare-fun res!185435 () Bool)

(declare-fun e!149494 () Bool)

(assert (=> b!220118 (=> (not res!185435) (not e!149494))))

(declare-datatypes ((array!10719 0))(
  ( (array!10720 (arr!5639 (Array (_ BitVec 32) (_ BitVec 8))) (size!4709 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8526 0))(
  ( (BitStream!8527 (buf!5256 array!10719) (currentByte!9859 (_ BitVec 32)) (currentBit!9854 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8526)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220118 (= res!185435 (validate_offset_bits!1 ((_ sign_extend 32) (size!4709 (buf!5256 bs!62))) ((_ sign_extend 32) (currentByte!9859 bs!62)) ((_ sign_extend 32) (currentBit!9854 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220119 () Bool)

(declare-fun res!185433 () Bool)

(assert (=> b!220119 (=> (not res!185433) (not e!149494))))

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220119 (= res!185433 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220120 () Bool)

(declare-fun e!149495 () Bool)

(declare-fun array_inv!4450 (array!10719) Bool)

(assert (=> b!220120 (= e!149495 (array_inv!4450 (buf!5256 bs!62)))))

(declare-fun b!220121 () Bool)

(declare-fun res!185432 () Bool)

(assert (=> b!220121 (=> (not res!185432) (not e!149494))))

(assert (=> b!220121 (= res!185432 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220122 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220122 (= e!149494 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4709 (buf!5256 bs!62))) ((_ sign_extend 32) (currentByte!9859 bs!62)) ((_ sign_extend 32) (currentBit!9854 bs!62)))))))

(declare-datatypes ((tuple2!18784 0))(
  ( (tuple2!18785 (_1!10050 BitStream!8526) (_2!10050 (_ BitVec 64))) )
))
(declare-fun lt!347894 () tuple2!18784)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18784)

(assert (=> b!220122 (= lt!347894 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun res!185434 () Bool)

(assert (=> start!45378 (=> (not res!185434) (not e!149494))))

(assert (=> start!45378 (= res!185434 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45378 e!149494))

(assert (=> start!45378 true))

(declare-fun inv!12 (BitStream!8526) Bool)

(assert (=> start!45378 (and (inv!12 bs!62) e!149495)))

(assert (= (and start!45378 res!185434) b!220118))

(assert (= (and b!220118 res!185435) b!220119))

(assert (= (and b!220119 res!185433) b!220121))

(assert (= (and b!220121 res!185432) b!220122))

(assert (= start!45378 b!220120))

(declare-fun m!338827 () Bool)

(assert (=> b!220119 m!338827))

(declare-fun m!338829 () Bool)

(assert (=> b!220118 m!338829))

(declare-fun m!338831 () Bool)

(assert (=> b!220122 m!338831))

(declare-fun m!338833 () Bool)

(assert (=> b!220122 m!338833))

(declare-fun m!338835 () Bool)

(assert (=> start!45378 m!338835))

(declare-fun m!338837 () Bool)

(assert (=> b!220120 m!338837))

(check-sat (not b!220120) (not start!45378) (not b!220118) (not b!220122) (not b!220119))
(check-sat)
(get-model)

(declare-fun d!74079 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74079 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4709 (buf!5256 bs!62))) ((_ sign_extend 32) (currentByte!9859 bs!62)) ((_ sign_extend 32) (currentBit!9854 bs!62))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4709 (buf!5256 bs!62))) ((_ sign_extend 32) (currentByte!9859 bs!62)) ((_ sign_extend 32) (currentBit!9854 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!18110 () Bool)

(assert (= bs!18110 d!74079))

(declare-fun m!338857 () Bool)

(assert (=> bs!18110 m!338857))

(assert (=> b!220122 d!74079))

(declare-datatypes ((tuple2!18792 0))(
  ( (tuple2!18793 (_1!10054 (_ BitVec 64)) (_2!10054 BitStream!8526)) )
))
(declare-fun lt!347906 () tuple2!18792)

(declare-fun d!74081 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18792)

(assert (=> d!74081 (= lt!347906 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74081 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18785 (_2!10054 lt!347906) (_1!10054 lt!347906)))))

(declare-fun bs!18114 () Bool)

(assert (= bs!18114 d!74081))

(declare-fun m!338863 () Bool)

(assert (=> bs!18114 m!338863))

(assert (=> b!220122 d!74081))

(declare-fun d!74089 () Bool)

(assert (=> d!74089 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4709 (buf!5256 bs!62))) ((_ sign_extend 32) (currentByte!9859 bs!62)) ((_ sign_extend 32) (currentBit!9854 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4709 (buf!5256 bs!62))) ((_ sign_extend 32) (currentByte!9859 bs!62)) ((_ sign_extend 32) (currentBit!9854 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18117 () Bool)

(assert (= bs!18117 d!74089))

(assert (=> bs!18117 m!338857))

(assert (=> b!220118 d!74089))

(declare-fun d!74093 () Bool)

(assert (=> d!74093 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220119 d!74093))

(declare-fun d!74095 () Bool)

(assert (=> d!74095 (= (array_inv!4450 (buf!5256 bs!62)) (bvsge (size!4709 (buf!5256 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220120 d!74095))

(declare-fun d!74097 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74097 (= (inv!12 bs!62) (invariant!0 (currentBit!9854 bs!62) (currentByte!9859 bs!62) (size!4709 (buf!5256 bs!62))))))

(declare-fun bs!18118 () Bool)

(assert (= bs!18118 d!74097))

(declare-fun m!338867 () Bool)

(assert (=> bs!18118 m!338867))

(assert (=> start!45378 d!74097))

(check-sat (not d!74089) (not d!74097) (not d!74081) (not d!74079))
(check-sat)
