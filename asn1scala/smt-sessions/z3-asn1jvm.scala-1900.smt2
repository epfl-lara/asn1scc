; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49696 () Bool)

(assert start!49696)

(declare-fun b!234460 () Bool)

(declare-fun e!162081 () Bool)

(declare-datatypes ((array!12292 0))(
  ( (array!12293 (arr!6389 (Array (_ BitVec 32) (_ BitVec 8))) (size!5402 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9768 0))(
  ( (BitStream!9769 (buf!5877 array!12292) (currentByte!10932 (_ BitVec 32)) (currentBit!10927 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9768)

(declare-fun array_inv!5143 (array!12292) Bool)

(assert (=> b!234460 (= e!162081 (array_inv!5143 (buf!5877 bs!63)))))

(declare-fun b!234461 () Bool)

(declare-fun e!162083 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234461 (= e!162083 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5402 (buf!5877 bs!63))) ((_ sign_extend 32) (currentByte!10932 bs!63)) ((_ sign_extend 32) (currentBit!10927 bs!63)))))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-datatypes ((tuple2!19678 0))(
  ( (tuple2!19679 (_1!10743 BitStream!9768) (_2!10743 (_ BitVec 64))) )
))
(declare-fun lt!370035 () tuple2!19678)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19678)

(assert (=> b!234461 (= lt!370035 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!234462 () Bool)

(declare-fun res!196089 () Bool)

(assert (=> b!234462 (=> (not res!196089) (not e!162083))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234462 (= res!196089 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234463 () Bool)

(declare-fun res!196086 () Bool)

(assert (=> b!234463 (=> (not res!196086) (not e!162083))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234463 (= res!196086 (validate_offset_bits!1 ((_ sign_extend 32) (size!5402 (buf!5877 bs!63))) ((_ sign_extend 32) (currentByte!10932 bs!63)) ((_ sign_extend 32) (currentBit!10927 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234464 () Bool)

(declare-fun res!196087 () Bool)

(assert (=> b!234464 (=> (not res!196087) (not e!162083))))

(assert (=> b!234464 (= res!196087 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196088 () Bool)

(assert (=> start!49696 (=> (not res!196088) (not e!162083))))

(assert (=> start!49696 (= res!196088 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49696 e!162083))

(assert (=> start!49696 true))

(declare-fun inv!12 (BitStream!9768) Bool)

(assert (=> start!49696 (and (inv!12 bs!63) e!162081)))

(assert (= (and start!49696 res!196088) b!234463))

(assert (= (and b!234463 res!196086) b!234464))

(assert (= (and b!234464 res!196087) b!234462))

(assert (= (and b!234462 res!196089) b!234461))

(assert (= start!49696 b!234460))

(declare-fun m!357057 () Bool)

(assert (=> start!49696 m!357057))

(declare-fun m!357059 () Bool)

(assert (=> b!234462 m!357059))

(declare-fun m!357061 () Bool)

(assert (=> b!234463 m!357061))

(declare-fun m!357063 () Bool)

(assert (=> b!234460 m!357063))

(declare-fun m!357065 () Bool)

(assert (=> b!234464 m!357065))

(declare-fun m!357067 () Bool)

(assert (=> b!234461 m!357067))

(declare-fun m!357069 () Bool)

(assert (=> b!234461 m!357069))

(check-sat (not b!234462) (not start!49696) (not b!234464) (not b!234461) (not b!234463) (not b!234460))
(check-sat)
(get-model)

(declare-fun d!78970 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78970 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5402 (buf!5877 bs!63))) ((_ sign_extend 32) (currentByte!10932 bs!63)) ((_ sign_extend 32) (currentBit!10927 bs!63))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5402 (buf!5877 bs!63))) ((_ sign_extend 32) (currentByte!10932 bs!63)) ((_ sign_extend 32) (currentBit!10927 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19692 () Bool)

(assert (= bs!19692 d!78970))

(declare-fun m!357089 () Bool)

(assert (=> bs!19692 m!357089))

(assert (=> b!234461 d!78970))

(declare-fun d!78972 () Bool)

(declare-datatypes ((tuple2!19686 0))(
  ( (tuple2!19687 (_1!10747 (_ BitVec 64)) (_2!10747 BitStream!9768)) )
))
(declare-fun lt!370047 () tuple2!19686)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19686)

(assert (=> d!78972 (= lt!370047 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!78972 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19679 (_2!10747 lt!370047) (_1!10747 lt!370047)))))

(declare-fun bs!19697 () Bool)

(assert (= bs!19697 d!78972))

(declare-fun m!357097 () Bool)

(assert (=> bs!19697 m!357097))

(assert (=> b!234461 d!78972))

(declare-fun d!78988 () Bool)

(assert (=> d!78988 (= (array_inv!5143 (buf!5877 bs!63)) (bvsge (size!5402 (buf!5877 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234460 d!78988))

(declare-fun d!78994 () Bool)

(assert (=> d!78994 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5402 (buf!5877 bs!63))) ((_ sign_extend 32) (currentByte!10932 bs!63)) ((_ sign_extend 32) (currentBit!10927 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5402 (buf!5877 bs!63))) ((_ sign_extend 32) (currentByte!10932 bs!63)) ((_ sign_extend 32) (currentBit!10927 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19700 () Bool)

(assert (= bs!19700 d!78994))

(assert (=> bs!19700 m!357089))

(assert (=> b!234463 d!78994))

(declare-fun d!78996 () Bool)

(assert (=> d!78996 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234464 d!78996))

(declare-fun d!78998 () Bool)

(assert (=> d!78998 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234462 d!78998))

(declare-fun d!79000 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79000 (= (inv!12 bs!63) (invariant!0 (currentBit!10927 bs!63) (currentByte!10932 bs!63) (size!5402 (buf!5877 bs!63))))))

(declare-fun bs!19701 () Bool)

(assert (= bs!19701 d!79000))

(declare-fun m!357101 () Bool)

(assert (=> bs!19701 m!357101))

(assert (=> start!49696 d!79000))

(check-sat (not d!79000) (not d!78972) (not d!78970) (not d!78994))
(check-sat)
