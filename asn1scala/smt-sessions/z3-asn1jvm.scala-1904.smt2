; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49912 () Bool)

(assert start!49912)

(declare-fun b!234896 () Bool)

(declare-fun res!196447 () Bool)

(declare-fun e!162374 () Bool)

(assert (=> b!234896 (=> (not res!196447) (not e!162374))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234896 (= res!196447 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-datatypes ((array!12325 0))(
  ( (array!12326 (arr!6401 (Array (_ BitVec 32) (_ BitVec 8))) (size!5414 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9792 0))(
  ( (BitStream!9793 (buf!5889 array!12325) (currentByte!10974 (_ BitVec 32)) (currentBit!10969 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19764 0))(
  ( (tuple2!19765 (_1!10786 BitStream!9792) (_2!10786 Bool)) )
))
(declare-fun lt!370683 () tuple2!19764)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun lt!370680 () (_ BitVec 32))

(declare-fun e!162373 () Bool)

(declare-fun b!234897 () Bool)

(assert (=> b!234897 (= e!162373 (not (= (bvand (bvor acc!118 (ite (_2!10786 lt!370683) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 lt!370680)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234898 () Bool)

(declare-fun e!162370 () Bool)

(assert (=> b!234898 (= e!162370 e!162373)))

(declare-fun res!196448 () Bool)

(assert (=> b!234898 (=> (not res!196448) (not e!162373))))

(declare-fun lt!370682 () BitStream!9792)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234898 (= res!196448 (validate_offset_bits!1 ((_ sign_extend 32) (size!5414 (buf!5889 lt!370682))) ((_ sign_extend 32) (currentByte!10974 lt!370682)) ((_ sign_extend 32) (currentBit!10969 lt!370682)) ((_ sign_extend 32) lt!370680)))))

(assert (=> b!234898 (= lt!370680 (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun b!234899 () Bool)

(declare-fun res!196444 () Bool)

(assert (=> b!234899 (=> (not res!196444) (not e!162374))))

(assert (=> b!234899 (= res!196444 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234900 () Bool)

(assert (=> b!234900 (= e!162374 e!162370)))

(declare-fun res!196449 () Bool)

(assert (=> b!234900 (=> (not res!196449) (not e!162370))))

(assert (=> b!234900 (= res!196449 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun bs!63 () BitStream!9792)

(declare-fun withMovedBitIndex!0 (BitStream!9792 (_ BitVec 64)) BitStream!9792)

(assert (=> b!234900 (= lt!370682 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9792) tuple2!19764)

(assert (=> b!234900 (= lt!370683 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19766 0))(
  ( (tuple2!19767 (_1!10787 BitStream!9792) (_2!10787 (_ BitVec 64))) )
))
(declare-fun lt!370681 () tuple2!19766)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19766)

(assert (=> b!234900 (= lt!370681 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!234901 () Bool)

(declare-fun e!162371 () Bool)

(declare-fun array_inv!5155 (array!12325) Bool)

(assert (=> b!234901 (= e!162371 (array_inv!5155 (buf!5889 bs!63)))))

(declare-fun res!196445 () Bool)

(assert (=> start!49912 (=> (not res!196445) (not e!162374))))

(assert (=> start!49912 (= res!196445 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49912 e!162374))

(assert (=> start!49912 true))

(declare-fun inv!12 (BitStream!9792) Bool)

(assert (=> start!49912 (and (inv!12 bs!63) e!162371)))

(declare-fun b!234902 () Bool)

(declare-fun res!196446 () Bool)

(assert (=> b!234902 (=> (not res!196446) (not e!162374))))

(assert (=> b!234902 (= res!196446 (validate_offset_bits!1 ((_ sign_extend 32) (size!5414 (buf!5889 bs!63))) ((_ sign_extend 32) (currentByte!10974 bs!63)) ((_ sign_extend 32) (currentBit!10969 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(assert (= (and start!49912 res!196445) b!234902))

(assert (= (and b!234902 res!196446) b!234899))

(assert (= (and b!234899 res!196444) b!234896))

(assert (= (and b!234896 res!196447) b!234900))

(assert (= (and b!234900 res!196449) b!234898))

(assert (= (and b!234898 res!196448) b!234897))

(assert (= start!49912 b!234901))

(declare-fun m!357459 () Bool)

(assert (=> b!234898 m!357459))

(declare-fun m!357461 () Bool)

(assert (=> b!234897 m!357461))

(declare-fun m!357463 () Bool)

(assert (=> b!234896 m!357463))

(declare-fun m!357465 () Bool)

(assert (=> b!234902 m!357465))

(declare-fun m!357467 () Bool)

(assert (=> b!234899 m!357467))

(declare-fun m!357469 () Bool)

(assert (=> b!234901 m!357469))

(declare-fun m!357471 () Bool)

(assert (=> start!49912 m!357471))

(declare-fun m!357473 () Bool)

(assert (=> b!234900 m!357473))

(declare-fun m!357475 () Bool)

(assert (=> b!234900 m!357475))

(declare-fun m!357477 () Bool)

(assert (=> b!234900 m!357477))

(check-sat (not b!234898) (not b!234900) (not b!234897) (not b!234901) (not b!234896) (not b!234899) (not b!234902) (not start!49912))
(check-sat)
(get-model)

(declare-fun d!79202 () Bool)

(assert (=> d!79202 (= (array_inv!5155 (buf!5889 bs!63)) (bvsge (size!5414 (buf!5889 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234901 d!79202))

(declare-fun d!79204 () Bool)

(assert (=> d!79204 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234896 d!79204))

(declare-fun d!79206 () Bool)

(assert (=> d!79206 (= (onesLSBLong!0 lt!370680) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!370680))))))

(assert (=> b!234897 d!79206))

(declare-fun d!79208 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79208 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5414 (buf!5889 bs!63))) ((_ sign_extend 32) (currentByte!10974 bs!63)) ((_ sign_extend 32) (currentBit!10969 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5414 (buf!5889 bs!63))) ((_ sign_extend 32) (currentByte!10974 bs!63)) ((_ sign_extend 32) (currentBit!10969 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19741 () Bool)

(assert (= bs!19741 d!79208))

(declare-fun m!357499 () Bool)

(assert (=> bs!19741 m!357499))

(assert (=> b!234902 d!79208))

(declare-fun d!79210 () Bool)

(assert (=> d!79210 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5414 (buf!5889 lt!370682))) ((_ sign_extend 32) (currentByte!10974 lt!370682)) ((_ sign_extend 32) (currentBit!10969 lt!370682)) ((_ sign_extend 32) lt!370680)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5414 (buf!5889 lt!370682))) ((_ sign_extend 32) (currentByte!10974 lt!370682)) ((_ sign_extend 32) (currentBit!10969 lt!370682))) ((_ sign_extend 32) lt!370680)))))

(declare-fun bs!19742 () Bool)

(assert (= bs!19742 d!79210))

(declare-fun m!357501 () Bool)

(assert (=> bs!19742 m!357501))

(assert (=> b!234898 d!79210))

(declare-fun d!79212 () Bool)

(assert (=> d!79212 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234899 d!79212))

(declare-fun d!79214 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79214 (= (inv!12 bs!63) (invariant!0 (currentBit!10969 bs!63) (currentByte!10974 bs!63) (size!5414 (buf!5889 bs!63))))))

(declare-fun bs!19743 () Bool)

(assert (= bs!19743 d!79214))

(declare-fun m!357503 () Bool)

(assert (=> bs!19743 m!357503))

(assert (=> start!49912 d!79214))

(declare-fun d!79216 () Bool)

(declare-fun e!162392 () Bool)

(assert (=> d!79216 e!162392))

(declare-fun res!196470 () Bool)

(assert (=> d!79216 (=> (not res!196470) (not e!162392))))

(declare-fun lt!370701 () (_ BitVec 64))

(declare-fun lt!370700 () BitStream!9792)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!79216 (= res!196470 (= (bvadd lt!370701 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5414 (buf!5889 lt!370700)) (currentByte!10974 lt!370700) (currentBit!10969 lt!370700))))))

(assert (=> d!79216 (or (not (= (bvand lt!370701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370701 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79216 (= lt!370701 (bitIndex!0 (size!5414 (buf!5889 bs!63)) (currentByte!10974 bs!63) (currentBit!10969 bs!63)))))

(declare-datatypes ((Unit!17309 0))(
  ( (Unit!17310) )
))
(declare-datatypes ((tuple2!19772 0))(
  ( (tuple2!19773 (_1!10790 Unit!17309) (_2!10790 BitStream!9792)) )
))
(declare-fun moveBitIndex!0 (BitStream!9792 (_ BitVec 64)) tuple2!19772)

(assert (=> d!79216 (= lt!370700 (_2!10790 (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!9792 (_ BitVec 64)) Bool)

(assert (=> d!79216 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79216 (= (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) lt!370700)))

(declare-fun b!234926 () Bool)

(assert (=> b!234926 (= e!162392 (= (size!5414 (buf!5889 bs!63)) (size!5414 (buf!5889 lt!370700))))))

(assert (= (and d!79216 res!196470) b!234926))

(declare-fun m!357505 () Bool)

(assert (=> d!79216 m!357505))

(declare-fun m!357507 () Bool)

(assert (=> d!79216 m!357507))

(declare-fun m!357509 () Bool)

(assert (=> d!79216 m!357509))

(declare-fun m!357511 () Bool)

(assert (=> d!79216 m!357511))

(assert (=> b!234900 d!79216))

(declare-fun d!79218 () Bool)

(declare-datatypes ((tuple2!19774 0))(
  ( (tuple2!19775 (_1!10791 Bool) (_2!10791 BitStream!9792)) )
))
(declare-fun lt!370704 () tuple2!19774)

(declare-fun readBit!0 (BitStream!9792) tuple2!19774)

(assert (=> d!79218 (= lt!370704 (readBit!0 bs!63))))

(assert (=> d!79218 (= (readBitPure!0 bs!63) (tuple2!19765 (_2!10791 lt!370704) (_1!10791 lt!370704)))))

(declare-fun bs!19744 () Bool)

(assert (= bs!19744 d!79218))

(declare-fun m!357513 () Bool)

(assert (=> bs!19744 m!357513))

(assert (=> b!234900 d!79218))

(declare-datatypes ((tuple2!19776 0))(
  ( (tuple2!19777 (_1!10792 (_ BitVec 64)) (_2!10792 BitStream!9792)) )
))
(declare-fun lt!370707 () tuple2!19776)

(declare-fun d!79220 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19776)

(assert (=> d!79220 (= lt!370707 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79220 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19767 (_2!10792 lt!370707) (_1!10792 lt!370707)))))

(declare-fun bs!19745 () Bool)

(assert (= bs!19745 d!79220))

(declare-fun m!357515 () Bool)

(assert (=> bs!19745 m!357515))

(assert (=> b!234900 d!79220))

(check-sat (not d!79216) (not d!79220) (not d!79214) (not d!79208) (not d!79210) (not d!79218))
(check-sat)
