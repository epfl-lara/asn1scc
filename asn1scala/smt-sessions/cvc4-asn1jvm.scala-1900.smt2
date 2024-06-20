; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49698 () Bool)

(assert start!49698)

(declare-fun b!234475 () Bool)

(declare-fun res!196101 () Bool)

(declare-fun e!162090 () Bool)

(assert (=> b!234475 (=> (not res!196101) (not e!162090))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12294 0))(
  ( (array!12295 (arr!6390 (Array (_ BitVec 32) (_ BitVec 8))) (size!5403 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9770 0))(
  ( (BitStream!9771 (buf!5878 array!12294) (currentByte!10933 (_ BitVec 32)) (currentBit!10928 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9770)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234475 (= res!196101 (validate_offset_bits!1 ((_ sign_extend 32) (size!5403 (buf!5878 bs!63))) ((_ sign_extend 32) (currentByte!10933 bs!63)) ((_ sign_extend 32) (currentBit!10928 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234476 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234476 (= e!162090 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5403 (buf!5878 bs!63))) ((_ sign_extend 32) (currentByte!10933 bs!63)) ((_ sign_extend 32) (currentBit!10928 bs!63)))))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-datatypes ((tuple2!19680 0))(
  ( (tuple2!19681 (_1!10744 BitStream!9770) (_2!10744 (_ BitVec 64))) )
))
(declare-fun lt!370038 () tuple2!19680)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19680)

(assert (=> b!234476 (= lt!370038 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!234477 () Bool)

(declare-fun res!196100 () Bool)

(assert (=> b!234477 (=> (not res!196100) (not e!162090))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234477 (= res!196100 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196098 () Bool)

(assert (=> start!49698 (=> (not res!196098) (not e!162090))))

(assert (=> start!49698 (= res!196098 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49698 e!162090))

(assert (=> start!49698 true))

(declare-fun e!162091 () Bool)

(declare-fun inv!12 (BitStream!9770) Bool)

(assert (=> start!49698 (and (inv!12 bs!63) e!162091)))

(declare-fun b!234478 () Bool)

(declare-fun array_inv!5144 (array!12294) Bool)

(assert (=> b!234478 (= e!162091 (array_inv!5144 (buf!5878 bs!63)))))

(declare-fun b!234479 () Bool)

(declare-fun res!196099 () Bool)

(assert (=> b!234479 (=> (not res!196099) (not e!162090))))

(assert (=> b!234479 (= res!196099 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(assert (= (and start!49698 res!196098) b!234475))

(assert (= (and b!234475 res!196101) b!234477))

(assert (= (and b!234477 res!196100) b!234479))

(assert (= (and b!234479 res!196099) b!234476))

(assert (= start!49698 b!234478))

(declare-fun m!357071 () Bool)

(assert (=> b!234478 m!357071))

(declare-fun m!357073 () Bool)

(assert (=> b!234479 m!357073))

(declare-fun m!357075 () Bool)

(assert (=> start!49698 m!357075))

(declare-fun m!357077 () Bool)

(assert (=> b!234477 m!357077))

(declare-fun m!357079 () Bool)

(assert (=> b!234475 m!357079))

(declare-fun m!357081 () Bool)

(assert (=> b!234476 m!357081))

(declare-fun m!357083 () Bool)

(assert (=> b!234476 m!357083))

(push 1)

(assert (not start!49698))

(assert (not b!234478))

(assert (not b!234479))

(assert (not b!234477))

(assert (not b!234476))

(assert (not b!234475))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78960 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78960 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5403 (buf!5878 bs!63))) ((_ sign_extend 32) (currentByte!10933 bs!63)) ((_ sign_extend 32) (currentBit!10928 bs!63))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5403 (buf!5878 bs!63))) ((_ sign_extend 32) (currentByte!10933 bs!63)) ((_ sign_extend 32) (currentBit!10928 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19690 () Bool)

(assert (= bs!19690 d!78960))

(declare-fun m!357085 () Bool)

(assert (=> bs!19690 m!357085))

(assert (=> b!234476 d!78960))

(declare-datatypes ((tuple2!19682 0))(
  ( (tuple2!19683 (_1!10745 (_ BitVec 64)) (_2!10745 BitStream!9770)) )
))
(declare-fun lt!370041 () tuple2!19682)

(declare-fun d!78964 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19682)

(assert (=> d!78964 (= lt!370041 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!78964 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19681 (_2!10745 lt!370041) (_1!10745 lt!370041)))))

(declare-fun bs!19693 () Bool)

(assert (= bs!19693 d!78964))

(declare-fun m!357091 () Bool)

(assert (=> bs!19693 m!357091))

(assert (=> b!234476 d!78964))

(declare-fun d!78974 () Bool)

(assert (=> d!78974 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5403 (buf!5878 bs!63))) ((_ sign_extend 32) (currentByte!10933 bs!63)) ((_ sign_extend 32) (currentBit!10928 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5403 (buf!5878 bs!63))) ((_ sign_extend 32) (currentByte!10933 bs!63)) ((_ sign_extend 32) (currentBit!10928 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19694 () Bool)

(assert (= bs!19694 d!78974))

(assert (=> bs!19694 m!357085))

(assert (=> b!234475 d!78974))

(declare-fun d!78976 () Bool)

(assert (=> d!78976 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234479 d!78976))

(declare-fun d!78980 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78980 (= (inv!12 bs!63) (invariant!0 (currentBit!10928 bs!63) (currentByte!10933 bs!63) (size!5403 (buf!5878 bs!63))))))

(declare-fun bs!19696 () Bool)

(assert (= bs!19696 d!78980))

(declare-fun m!357095 () Bool)

(assert (=> bs!19696 m!357095))

(assert (=> start!49698 d!78980))

(declare-fun d!78986 () Bool)

(assert (=> d!78986 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234477 d!78986))

(declare-fun d!78990 () Bool)

(assert (=> d!78990 (= (array_inv!5144 (buf!5878 bs!63)) (bvsge (size!5403 (buf!5878 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234478 d!78990))

(push 1)

(assert (not d!78974))

(assert (not d!78964))

(assert (not d!78960))

(assert (not d!78980))

(check-sat)

(pop 1)

(push 1)

(check-sat)

