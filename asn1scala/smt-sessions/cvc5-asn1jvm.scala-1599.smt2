; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45376 () Bool)

(assert start!45376)

(declare-fun b!220103 () Bool)

(declare-fun res!185423 () Bool)

(declare-fun e!149486 () Bool)

(assert (=> b!220103 (=> (not res!185423) (not e!149486))))

(declare-datatypes ((array!10717 0))(
  ( (array!10718 (arr!5638 (Array (_ BitVec 32) (_ BitVec 8))) (size!4708 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8524 0))(
  ( (BitStream!8525 (buf!5255 array!10717) (currentByte!9858 (_ BitVec 32)) (currentBit!9853 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8524)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220103 (= res!185423 (validate_offset_bits!1 ((_ sign_extend 32) (size!4708 (buf!5255 bs!62))) ((_ sign_extend 32) (currentByte!9858 bs!62)) ((_ sign_extend 32) (currentBit!9853 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220104 () Bool)

(declare-fun res!185420 () Bool)

(assert (=> b!220104 (=> (not res!185420) (not e!149486))))

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220104 (= res!185420 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun res!185421 () Bool)

(assert (=> start!45376 (=> (not res!185421) (not e!149486))))

(assert (=> start!45376 (= res!185421 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45376 e!149486))

(assert (=> start!45376 true))

(declare-fun e!149485 () Bool)

(declare-fun inv!12 (BitStream!8524) Bool)

(assert (=> start!45376 (and (inv!12 bs!62) e!149485)))

(declare-fun b!220105 () Bool)

(declare-fun array_inv!4449 (array!10717) Bool)

(assert (=> b!220105 (= e!149485 (array_inv!4449 (buf!5255 bs!62)))))

(declare-fun b!220106 () Bool)

(declare-fun res!185422 () Bool)

(assert (=> b!220106 (=> (not res!185422) (not e!149486))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220106 (= res!185422 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220107 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220107 (= e!149486 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4708 (buf!5255 bs!62))) ((_ sign_extend 32) (currentByte!9858 bs!62)) ((_ sign_extend 32) (currentBit!9853 bs!62)))))))

(declare-datatypes ((tuple2!18782 0))(
  ( (tuple2!18783 (_1!10049 BitStream!8524) (_2!10049 (_ BitVec 64))) )
))
(declare-fun lt!347891 () tuple2!18782)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18782)

(assert (=> b!220107 (= lt!347891 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(assert (= (and start!45376 res!185421) b!220103))

(assert (= (and b!220103 res!185423) b!220106))

(assert (= (and b!220106 res!185422) b!220104))

(assert (= (and b!220104 res!185420) b!220107))

(assert (= start!45376 b!220105))

(declare-fun m!338815 () Bool)

(assert (=> b!220107 m!338815))

(declare-fun m!338817 () Bool)

(assert (=> b!220107 m!338817))

(declare-fun m!338819 () Bool)

(assert (=> b!220103 m!338819))

(declare-fun m!338821 () Bool)

(assert (=> start!45376 m!338821))

(declare-fun m!338823 () Bool)

(assert (=> b!220105 m!338823))

(declare-fun m!338825 () Bool)

(assert (=> b!220106 m!338825))

(push 1)

(assert (not b!220107))

(assert (not b!220103))

(assert (not b!220105))

(assert (not b!220106))

(assert (not start!45376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74063 () Bool)

(assert (=> d!74063 (= (array_inv!4449 (buf!5255 bs!62)) (bvsge (size!4708 (buf!5255 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220105 d!74063))

(declare-fun d!74065 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74065 (= (inv!12 bs!62) (invariant!0 (currentBit!9853 bs!62) (currentByte!9858 bs!62) (size!4708 (buf!5255 bs!62))))))

(declare-fun bs!18107 () Bool)

(assert (= bs!18107 d!74065))

(declare-fun m!338851 () Bool)

(assert (=> bs!18107 m!338851))

(assert (=> start!45376 d!74065))

(declare-fun d!74071 () Bool)

(assert (=> d!74071 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220106 d!74071))

(declare-fun d!74075 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74075 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4708 (buf!5255 bs!62))) ((_ sign_extend 32) (currentByte!9858 bs!62)) ((_ sign_extend 32) (currentBit!9853 bs!62))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4708 (buf!5255 bs!62))) ((_ sign_extend 32) (currentByte!9858 bs!62)) ((_ sign_extend 32) (currentBit!9853 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!18109 () Bool)

(assert (= bs!18109 d!74075))

(declare-fun m!338855 () Bool)

(assert (=> bs!18109 m!338855))

(assert (=> b!220107 d!74075))

(declare-datatypes ((tuple2!18788 0))(
  ( (tuple2!18789 (_1!10052 (_ BitVec 64)) (_2!10052 BitStream!8524)) )
))
(declare-fun lt!347903 () tuple2!18788)

(declare-fun d!74077 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18788)

(assert (=> d!74077 (= lt!347903 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74077 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18783 (_2!10052 lt!347903) (_1!10052 lt!347903)))))

(declare-fun bs!18113 () Bool)

(assert (= bs!18113 d!74077))

(declare-fun m!338861 () Bool)

(assert (=> bs!18113 m!338861))

(assert (=> b!220107 d!74077))

(declare-fun d!74087 () Bool)

(assert (=> d!74087 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4708 (buf!5255 bs!62))) ((_ sign_extend 32) (currentByte!9858 bs!62)) ((_ sign_extend 32) (currentBit!9853 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4708 (buf!5255 bs!62))) ((_ sign_extend 32) (currentByte!9858 bs!62)) ((_ sign_extend 32) (currentBit!9853 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18115 () Bool)

(assert (= bs!18115 d!74087))

(assert (=> bs!18115 m!338855))

(assert (=> b!220103 d!74087))

(push 1)

(assert (not d!74065))

(assert (not d!74077))

(assert (not d!74075))

(assert (not d!74087))

(check-sat)

(pop 1)

(push 1)

(check-sat)

