; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49962 () Bool)

(assert start!49962)

(declare-fun b!234997 () Bool)

(declare-fun res!196535 () Bool)

(declare-fun e!162452 () Bool)

(assert (=> b!234997 (=> (not res!196535) (not e!162452))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12336 0))(
  ( (array!12337 (arr!6405 (Array (_ BitVec 32) (_ BitVec 8))) (size!5418 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9800 0))(
  ( (BitStream!9801 (buf!5893 array!12336) (currentByte!10981 (_ BitVec 32)) (currentBit!10976 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9800)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234997 (= res!196535 (validate_offset_bits!1 ((_ sign_extend 32) (size!5418 (buf!5893 bs!63))) ((_ sign_extend 32) (currentByte!10981 bs!63)) ((_ sign_extend 32) (currentBit!10976 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234998 () Bool)

(declare-fun e!162448 () Bool)

(declare-fun array_inv!5159 (array!12336) Bool)

(assert (=> b!234998 (= e!162448 (array_inv!5159 (buf!5893 bs!63)))))

(declare-fun b!234999 () Bool)

(declare-fun res!196533 () Bool)

(declare-fun e!162449 () Bool)

(assert (=> b!234999 (=> (not res!196533) (not e!162449))))

(declare-fun lt!370783 () (_ BitVec 64))

(declare-fun lt!370781 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234999 (= res!196533 (= (bvand lt!370783 (onesLSBLong!0 lt!370781)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196537 () Bool)

(assert (=> start!49962 (=> (not res!196537) (not e!162452))))

(assert (=> start!49962 (= res!196537 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49962 e!162452))

(assert (=> start!49962 true))

(declare-fun inv!12 (BitStream!9800) Bool)

(assert (=> start!49962 (and (inv!12 bs!63) e!162448)))

(declare-fun b!235000 () Bool)

(declare-fun lt!370782 () (_ BitVec 64))

(assert (=> b!235000 (= e!162449 (not (= (bvand lt!370783 lt!370782) lt!370783)))))

(declare-fun b!235001 () Bool)

(declare-fun e!162451 () Bool)

(assert (=> b!235001 (= e!162451 e!162449)))

(declare-fun res!196539 () Bool)

(assert (=> b!235001 (=> (not res!196539) (not e!162449))))

(declare-fun lt!370784 () BitStream!9800)

(assert (=> b!235001 (= res!196539 (validate_offset_bits!1 ((_ sign_extend 32) (size!5418 (buf!5893 lt!370784))) ((_ sign_extend 32) (currentByte!10981 lt!370784)) ((_ sign_extend 32) (currentBit!10976 lt!370784)) ((_ sign_extend 32) lt!370781)))))

(assert (=> b!235001 (= lt!370781 (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun b!235002 () Bool)

(declare-fun res!196538 () Bool)

(assert (=> b!235002 (=> (not res!196538) (not e!162452))))

(declare-fun acc!118 () (_ BitVec 64))

(assert (=> b!235002 (= res!196538 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235003 () Bool)

(declare-fun e!162447 () Bool)

(assert (=> b!235003 (= e!162447 e!162451)))

(declare-fun res!196534 () Bool)

(assert (=> b!235003 (=> (not res!196534) (not e!162451))))

(assert (=> b!235003 (= res!196534 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-datatypes ((tuple2!19798 0))(
  ( (tuple2!19799 (_1!10803 BitStream!9800) (_2!10803 Bool)) )
))
(declare-fun lt!370780 () tuple2!19798)

(assert (=> b!235003 (= lt!370783 (bvor acc!118 (ite (_2!10803 lt!370780) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun withMovedBitIndex!0 (BitStream!9800 (_ BitVec 64)) BitStream!9800)

(assert (=> b!235003 (= lt!370784 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9800) tuple2!19798)

(assert (=> b!235003 (= lt!370780 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19800 0))(
  ( (tuple2!19801 (_1!10804 BitStream!9800) (_2!10804 (_ BitVec 64))) )
))
(declare-fun lt!370785 () tuple2!19800)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19800)

(assert (=> b!235003 (= lt!370785 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235004 () Bool)

(assert (=> b!235004 (= e!162452 e!162447)))

(declare-fun res!196536 () Bool)

(assert (=> b!235004 (=> (not res!196536) (not e!162447))))

(assert (=> b!235004 (= res!196536 (= (bvand acc!118 lt!370782) acc!118))))

(assert (=> b!235004 (= lt!370782 (onesLSBLong!0 nBits!274))))

(assert (= (and start!49962 res!196537) b!234997))

(assert (= (and b!234997 res!196535) b!235002))

(assert (= (and b!235002 res!196538) b!235004))

(assert (= (and b!235004 res!196536) b!235003))

(assert (= (and b!235003 res!196534) b!235001))

(assert (= (and b!235001 res!196539) b!234999))

(assert (= (and b!234999 res!196533) b!235000))

(assert (= start!49962 b!234998))

(declare-fun m!357593 () Bool)

(assert (=> b!235004 m!357593))

(declare-fun m!357595 () Bool)

(assert (=> b!235002 m!357595))

(declare-fun m!357597 () Bool)

(assert (=> b!234999 m!357597))

(declare-fun m!357599 () Bool)

(assert (=> b!234998 m!357599))

(declare-fun m!357601 () Bool)

(assert (=> b!235003 m!357601))

(declare-fun m!357603 () Bool)

(assert (=> b!235003 m!357603))

(declare-fun m!357605 () Bool)

(assert (=> b!235003 m!357605))

(declare-fun m!357607 () Bool)

(assert (=> b!235001 m!357607))

(declare-fun m!357609 () Bool)

(assert (=> b!234997 m!357609))

(declare-fun m!357611 () Bool)

(assert (=> start!49962 m!357611))

(push 1)

(assert (not b!235004))

(assert (not b!235001))

(assert (not b!235002))

(assert (not b!234998))

(assert (not start!49962))

(assert (not b!234997))

(assert (not b!234999))

(assert (not b!235003))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79300 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79300 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5418 (buf!5893 lt!370784))) ((_ sign_extend 32) (currentByte!10981 lt!370784)) ((_ sign_extend 32) (currentBit!10976 lt!370784)) ((_ sign_extend 32) lt!370781)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5418 (buf!5893 lt!370784))) ((_ sign_extend 32) (currentByte!10981 lt!370784)) ((_ sign_extend 32) (currentBit!10976 lt!370784))) ((_ sign_extend 32) lt!370781)))))

(declare-fun bs!19769 () Bool)

(assert (= bs!19769 d!79300))

(declare-fun m!357649 () Bool)

(assert (=> bs!19769 m!357649))

(assert (=> b!235001 d!79300))

(declare-fun d!79306 () Bool)

(assert (=> d!79306 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!235002 d!79306))

(declare-fun d!79308 () Bool)

(assert (=> d!79308 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5418 (buf!5893 bs!63))) ((_ sign_extend 32) (currentByte!10981 bs!63)) ((_ sign_extend 32) (currentBit!10976 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5418 (buf!5893 bs!63))) ((_ sign_extend 32) (currentByte!10981 bs!63)) ((_ sign_extend 32) (currentBit!10976 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19770 () Bool)

(assert (= bs!19770 d!79308))

(declare-fun m!357651 () Bool)

(assert (=> bs!19770 m!357651))

(assert (=> b!234997 d!79308))

(declare-fun d!79310 () Bool)

(assert (=> d!79310 (= (array_inv!5159 (buf!5893 bs!63)) (bvsge (size!5418 (buf!5893 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234998 d!79310))

(declare-fun d!79312 () Bool)

(declare-fun e!162461 () Bool)

(assert (=> d!79312 e!162461))

(declare-fun res!196548 () Bool)

(assert (=> d!79312 (=> (not res!196548) (not e!162461))))

(declare-fun lt!370815 () (_ BitVec 64))

(declare-fun lt!370814 () BitStream!9800)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!79312 (= res!196548 (= (bvadd lt!370815 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5418 (buf!5893 lt!370814)) (currentByte!10981 lt!370814) (currentBit!10976 lt!370814))))))

(assert (=> d!79312 (or (not (= (bvand lt!370815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370815 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79312 (= lt!370815 (bitIndex!0 (size!5418 (buf!5893 bs!63)) (currentByte!10981 bs!63) (currentBit!10976 bs!63)))))

(declare-datatypes ((Unit!17319 0))(
  ( (Unit!17320) )
))
(declare-datatypes ((tuple2!19814 0))(
  ( (tuple2!19815 (_1!10811 Unit!17319) (_2!10811 BitStream!9800)) )
))
(declare-fun moveBitIndex!0 (BitStream!9800 (_ BitVec 64)) tuple2!19814)

(assert (=> d!79312 (= lt!370814 (_2!10811 (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!9800 (_ BitVec 64)) Bool)

(assert (=> d!79312 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79312 (= (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) lt!370814)))

(declare-fun b!235013 () Bool)

(assert (=> b!235013 (= e!162461 (= (size!5418 (buf!5893 bs!63)) (size!5418 (buf!5893 lt!370814))))))

(assert (= (and d!79312 res!196548) b!235013))

(declare-fun m!357653 () Bool)

(assert (=> d!79312 m!357653))

(declare-fun m!357655 () Bool)

(assert (=> d!79312 m!357655))

(declare-fun m!357657 () Bool)

(assert (=> d!79312 m!357657))

(declare-fun m!357659 () Bool)

(assert (=> d!79312 m!357659))

(assert (=> b!235003 d!79312))

(declare-fun d!79314 () Bool)

(declare-datatypes ((tuple2!19816 0))(
  ( (tuple2!19817 (_1!10812 Bool) (_2!10812 BitStream!9800)) )
))
(declare-fun lt!370818 () tuple2!19816)

(declare-fun readBit!0 (BitStream!9800) tuple2!19816)

(assert (=> d!79314 (= lt!370818 (readBit!0 bs!63))))

(assert (=> d!79314 (= (readBitPure!0 bs!63) (tuple2!19799 (_2!10812 lt!370818) (_1!10812 lt!370818)))))

(declare-fun bs!19771 () Bool)

(assert (= bs!19771 d!79314))

(declare-fun m!357661 () Bool)

(assert (=> bs!19771 m!357661))

(assert (=> b!235003 d!79314))

(declare-fun d!79316 () Bool)

(declare-datatypes ((tuple2!19818 0))(
  ( (tuple2!19819 (_1!10813 (_ BitVec 64)) (_2!10813 BitStream!9800)) )
))
(declare-fun lt!370821 () tuple2!19818)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19818)

(assert (=> d!79316 (= lt!370821 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79316 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19801 (_2!10813 lt!370821) (_1!10813 lt!370821)))))

(declare-fun bs!19772 () Bool)

(assert (= bs!19772 d!79316))

(declare-fun m!357663 () Bool)

(assert (=> bs!19772 m!357663))

(assert (=> b!235003 d!79316))

(declare-fun d!79318 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79318 (= (inv!12 bs!63) (invariant!0 (currentBit!10976 bs!63) (currentByte!10981 bs!63) (size!5418 (buf!5893 bs!63))))))

(declare-fun bs!19773 () Bool)

(assert (= bs!19773 d!79318))

(declare-fun m!357665 () Bool)

(assert (=> bs!19773 m!357665))

(assert (=> start!49962 d!79318))

(declare-fun d!79320 () Bool)

(assert (=> d!79320 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!235004 d!79320))

(declare-fun d!79322 () Bool)

(assert (=> d!79322 (= (onesLSBLong!0 lt!370781) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!370781))))))

(assert (=> b!234999 d!79322))

(push 1)

(assert (not d!79316))

(assert (not d!79312))

(assert (not d!79318))

(assert (not d!79300))

(assert (not d!79314))

(assert (not d!79308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

