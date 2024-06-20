; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49694 () Bool)

(assert start!49694)

(declare-fun b!234445 () Bool)

(declare-fun res!196074 () Bool)

(declare-fun e!162073 () Bool)

(assert (=> b!234445 (=> (not res!196074) (not e!162073))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234445 (= res!196074 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196076 () Bool)

(assert (=> start!49694 (=> (not res!196076) (not e!162073))))

(assert (=> start!49694 (= res!196076 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49694 e!162073))

(assert (=> start!49694 true))

(declare-datatypes ((array!12290 0))(
  ( (array!12291 (arr!6388 (Array (_ BitVec 32) (_ BitVec 8))) (size!5401 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9766 0))(
  ( (BitStream!9767 (buf!5876 array!12290) (currentByte!10931 (_ BitVec 32)) (currentBit!10926 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9766)

(declare-fun e!162072 () Bool)

(declare-fun inv!12 (BitStream!9766) Bool)

(assert (=> start!49694 (and (inv!12 bs!63) e!162072)))

(declare-fun b!234446 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234446 (= e!162073 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5401 (buf!5876 bs!63))) ((_ sign_extend 32) (currentByte!10931 bs!63)) ((_ sign_extend 32) (currentBit!10926 bs!63)))))))

(declare-datatypes ((tuple2!19676 0))(
  ( (tuple2!19677 (_1!10742 BitStream!9766) (_2!10742 (_ BitVec 64))) )
))
(declare-fun lt!370032 () tuple2!19676)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19676)

(assert (=> b!234446 (= lt!370032 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!234447 () Bool)

(declare-fun res!196077 () Bool)

(assert (=> b!234447 (=> (not res!196077) (not e!162073))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234447 (= res!196077 (validate_offset_bits!1 ((_ sign_extend 32) (size!5401 (buf!5876 bs!63))) ((_ sign_extend 32) (currentByte!10931 bs!63)) ((_ sign_extend 32) (currentBit!10926 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234448 () Bool)

(declare-fun res!196075 () Bool)

(assert (=> b!234448 (=> (not res!196075) (not e!162073))))

(assert (=> b!234448 (= res!196075 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234449 () Bool)

(declare-fun array_inv!5142 (array!12290) Bool)

(assert (=> b!234449 (= e!162072 (array_inv!5142 (buf!5876 bs!63)))))

(assert (= (and start!49694 res!196076) b!234447))

(assert (= (and b!234447 res!196077) b!234445))

(assert (= (and b!234445 res!196074) b!234448))

(assert (= (and b!234448 res!196075) b!234446))

(assert (= start!49694 b!234449))

(declare-fun m!357043 () Bool)

(assert (=> b!234449 m!357043))

(declare-fun m!357045 () Bool)

(assert (=> start!49694 m!357045))

(declare-fun m!357047 () Bool)

(assert (=> b!234446 m!357047))

(declare-fun m!357049 () Bool)

(assert (=> b!234446 m!357049))

(declare-fun m!357051 () Bool)

(assert (=> b!234448 m!357051))

(declare-fun m!357053 () Bool)

(assert (=> b!234447 m!357053))

(declare-fun m!357055 () Bool)

(assert (=> b!234445 m!357055))

(push 1)

(assert (not start!49694))

(assert (not b!234446))

(assert (not b!234445))

(assert (not b!234448))

(assert (not b!234447))

(assert (not b!234449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78962 () Bool)

(assert (=> d!78962 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234445 d!78962))

(declare-fun d!78966 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78966 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5401 (buf!5876 bs!63))) ((_ sign_extend 32) (currentByte!10931 bs!63)) ((_ sign_extend 32) (currentBit!10926 bs!63))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5401 (buf!5876 bs!63))) ((_ sign_extend 32) (currentByte!10931 bs!63)) ((_ sign_extend 32) (currentBit!10926 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19691 () Bool)

(assert (= bs!19691 d!78966))

(declare-fun m!357087 () Bool)

(assert (=> bs!19691 m!357087))

(assert (=> b!234446 d!78966))

(declare-datatypes ((tuple2!19684 0))(
  ( (tuple2!19685 (_1!10746 (_ BitVec 64)) (_2!10746 BitStream!9766)) )
))
(declare-fun lt!370044 () tuple2!19684)

(declare-fun d!78968 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19684)

(assert (=> d!78968 (= lt!370044 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!78968 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19677 (_2!10746 lt!370044) (_1!10746 lt!370044)))))

(declare-fun bs!19695 () Bool)

(assert (= bs!19695 d!78968))

(declare-fun m!357093 () Bool)

(assert (=> bs!19695 m!357093))

(assert (=> b!234446 d!78968))

(declare-fun d!78978 () Bool)

(assert (=> d!78978 (= (array_inv!5142 (buf!5876 bs!63)) (bvsge (size!5401 (buf!5876 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234449 d!78978))

(declare-fun d!78982 () Bool)

(assert (=> d!78982 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234448 d!78982))

(declare-fun d!78984 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78984 (= (inv!12 bs!63) (invariant!0 (currentBit!10926 bs!63) (currentByte!10931 bs!63) (size!5401 (buf!5876 bs!63))))))

(declare-fun bs!19698 () Bool)

(assert (= bs!19698 d!78984))

(declare-fun m!357099 () Bool)

(assert (=> bs!19698 m!357099))

(assert (=> start!49694 d!78984))

(declare-fun d!78992 () Bool)

(assert (=> d!78992 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5401 (buf!5876 bs!63))) ((_ sign_extend 32) (currentByte!10931 bs!63)) ((_ sign_extend 32) (currentBit!10926 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5401 (buf!5876 bs!63))) ((_ sign_extend 32) (currentByte!10931 bs!63)) ((_ sign_extend 32) (currentBit!10926 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19699 () Bool)

(assert (= bs!19699 d!78992))

(assert (=> bs!19699 m!357087))

(assert (=> b!234447 d!78992))

(push 1)

(assert (not d!78984))

(assert (not d!78992))

(assert (not d!78968))

(assert (not d!78966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

