; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49822 () Bool)

(assert start!49822)

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun e!162233 () Bool)

(declare-fun i!546 () (_ BitVec 32))

(declare-datatypes ((array!12316 0))(
  ( (array!12317 (arr!6398 (Array (_ BitVec 32) (_ BitVec 8))) (size!5411 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9786 0))(
  ( (BitStream!9787 (buf!5886 array!12316) (currentByte!10959 (_ BitVec 32)) (currentBit!10954 (_ BitVec 32))) )
))
(declare-fun lt!370335 () BitStream!9786)

(declare-fun b!234702 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234702 (= e!162233 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5411 (buf!5886 lt!370335))) ((_ sign_extend 32) (currentByte!10959 lt!370335)) ((_ sign_extend 32) (currentBit!10954 lt!370335)) ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546))))))))

(declare-fun res!196282 () Bool)

(declare-fun e!162236 () Bool)

(assert (=> start!49822 (=> (not res!196282) (not e!162236))))

(assert (=> start!49822 (= res!196282 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49822 e!162236))

(assert (=> start!49822 true))

(declare-fun bs!63 () BitStream!9786)

(declare-fun e!162235 () Bool)

(declare-fun inv!12 (BitStream!9786) Bool)

(assert (=> start!49822 (and (inv!12 bs!63) e!162235)))

(declare-fun b!234703 () Bool)

(declare-fun res!196284 () Bool)

(assert (=> b!234703 (=> (not res!196284) (not e!162236))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234703 (= res!196284 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234704 () Bool)

(assert (=> b!234704 (= e!162236 e!162233)))

(declare-fun res!196280 () Bool)

(assert (=> b!234704 (=> (not res!196280) (not e!162233))))

(assert (=> b!234704 (= res!196280 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun withMovedBitIndex!0 (BitStream!9786 (_ BitVec 64)) BitStream!9786)

(assert (=> b!234704 (= lt!370335 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!19734 0))(
  ( (tuple2!19735 (_1!10771 BitStream!9786) (_2!10771 Bool)) )
))
(declare-fun lt!370334 () tuple2!19734)

(declare-fun readBitPure!0 (BitStream!9786) tuple2!19734)

(assert (=> b!234704 (= lt!370334 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19736 0))(
  ( (tuple2!19737 (_1!10772 BitStream!9786) (_2!10772 (_ BitVec 64))) )
))
(declare-fun lt!370333 () tuple2!19736)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19736)

(assert (=> b!234704 (= lt!370333 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!234705 () Bool)

(declare-fun res!196281 () Bool)

(assert (=> b!234705 (=> (not res!196281) (not e!162236))))

(assert (=> b!234705 (= res!196281 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234706 () Bool)

(declare-fun res!196283 () Bool)

(assert (=> b!234706 (=> (not res!196283) (not e!162236))))

(assert (=> b!234706 (= res!196283 (validate_offset_bits!1 ((_ sign_extend 32) (size!5411 (buf!5886 bs!63))) ((_ sign_extend 32) (currentByte!10959 bs!63)) ((_ sign_extend 32) (currentBit!10954 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234707 () Bool)

(declare-fun array_inv!5152 (array!12316) Bool)

(assert (=> b!234707 (= e!162235 (array_inv!5152 (buf!5886 bs!63)))))

(assert (= (and start!49822 res!196282) b!234706))

(assert (= (and b!234706 res!196283) b!234703))

(assert (= (and b!234703 res!196284) b!234705))

(assert (= (and b!234705 res!196281) b!234704))

(assert (= (and b!234704 res!196280) b!234702))

(assert (= start!49822 b!234707))

(declare-fun m!357289 () Bool)

(assert (=> b!234704 m!357289))

(declare-fun m!357291 () Bool)

(assert (=> b!234704 m!357291))

(declare-fun m!357293 () Bool)

(assert (=> b!234704 m!357293))

(declare-fun m!357295 () Bool)

(assert (=> b!234706 m!357295))

(declare-fun m!357297 () Bool)

(assert (=> b!234703 m!357297))

(declare-fun m!357299 () Bool)

(assert (=> start!49822 m!357299))

(declare-fun m!357301 () Bool)

(assert (=> b!234705 m!357301))

(declare-fun m!357303 () Bool)

(assert (=> b!234707 m!357303))

(declare-fun m!357305 () Bool)

(assert (=> b!234702 m!357305))

(check-sat (not b!234704) (not b!234703) (not b!234702) (not b!234707) (not b!234705) (not b!234706) (not start!49822))
(check-sat)
(get-model)

(declare-fun d!79122 () Bool)

(assert (=> d!79122 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234703 d!79122))

(declare-fun d!79124 () Bool)

(assert (=> d!79124 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234705 d!79124))

(declare-fun d!79126 () Bool)

(declare-fun e!162257 () Bool)

(assert (=> d!79126 e!162257))

(declare-fun res!196308 () Bool)

(assert (=> d!79126 (=> (not res!196308) (not e!162257))))

(declare-fun lt!370374 () (_ BitVec 64))

(declare-fun lt!370373 () BitStream!9786)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!79126 (= res!196308 (= (bvadd lt!370374 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5411 (buf!5886 lt!370373)) (currentByte!10959 lt!370373) (currentBit!10954 lt!370373))))))

(assert (=> d!79126 (or (not (= (bvand lt!370374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370374 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79126 (= lt!370374 (bitIndex!0 (size!5411 (buf!5886 bs!63)) (currentByte!10959 bs!63) (currentBit!10954 bs!63)))))

(declare-datatypes ((Unit!17289 0))(
  ( (Unit!17290) )
))
(declare-datatypes ((tuple2!19754 0))(
  ( (tuple2!19755 (_1!10781 Unit!17289) (_2!10781 BitStream!9786)) )
))
(declare-fun moveBitIndex!0 (BitStream!9786 (_ BitVec 64)) tuple2!19754)

(assert (=> d!79126 (= lt!370373 (_2!10781 (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!9786 (_ BitVec 64)) Bool)

(assert (=> d!79126 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79126 (= (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) lt!370373)))

(declare-fun b!234734 () Bool)

(assert (=> b!234734 (= e!162257 (= (size!5411 (buf!5886 bs!63)) (size!5411 (buf!5886 lt!370373))))))

(assert (= (and d!79126 res!196308) b!234734))

(declare-fun m!357361 () Bool)

(assert (=> d!79126 m!357361))

(declare-fun m!357363 () Bool)

(assert (=> d!79126 m!357363))

(declare-fun m!357365 () Bool)

(assert (=> d!79126 m!357365))

(declare-fun m!357367 () Bool)

(assert (=> d!79126 m!357367))

(assert (=> b!234704 d!79126))

(declare-fun d!79128 () Bool)

(declare-datatypes ((tuple2!19756 0))(
  ( (tuple2!19757 (_1!10782 Bool) (_2!10782 BitStream!9786)) )
))
(declare-fun lt!370377 () tuple2!19756)

(declare-fun readBit!0 (BitStream!9786) tuple2!19756)

(assert (=> d!79128 (= lt!370377 (readBit!0 bs!63))))

(assert (=> d!79128 (= (readBitPure!0 bs!63) (tuple2!19735 (_2!10782 lt!370377) (_1!10782 lt!370377)))))

(declare-fun bs!19733 () Bool)

(assert (= bs!19733 d!79128))

(declare-fun m!357369 () Bool)

(assert (=> bs!19733 m!357369))

(assert (=> b!234704 d!79128))

(declare-fun d!79130 () Bool)

(declare-datatypes ((tuple2!19758 0))(
  ( (tuple2!19759 (_1!10783 (_ BitVec 64)) (_2!10783 BitStream!9786)) )
))
(declare-fun lt!370380 () tuple2!19758)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19758)

(assert (=> d!79130 (= lt!370380 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79130 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19737 (_2!10783 lt!370380) (_1!10783 lt!370380)))))

(declare-fun bs!19734 () Bool)

(assert (= bs!19734 d!79130))

(declare-fun m!357371 () Bool)

(assert (=> bs!19734 m!357371))

(assert (=> b!234704 d!79130))

(declare-fun d!79132 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79132 (= (inv!12 bs!63) (invariant!0 (currentBit!10954 bs!63) (currentByte!10959 bs!63) (size!5411 (buf!5886 bs!63))))))

(declare-fun bs!19735 () Bool)

(assert (= bs!19735 d!79132))

(declare-fun m!357373 () Bool)

(assert (=> bs!19735 m!357373))

(assert (=> start!49822 d!79132))

(declare-fun d!79134 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79134 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5411 (buf!5886 bs!63))) ((_ sign_extend 32) (currentByte!10959 bs!63)) ((_ sign_extend 32) (currentBit!10954 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5411 (buf!5886 bs!63))) ((_ sign_extend 32) (currentByte!10959 bs!63)) ((_ sign_extend 32) (currentBit!10954 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19736 () Bool)

(assert (= bs!19736 d!79134))

(declare-fun m!357375 () Bool)

(assert (=> bs!19736 m!357375))

(assert (=> b!234706 d!79134))

(declare-fun d!79136 () Bool)

(assert (=> d!79136 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5411 (buf!5886 lt!370335))) ((_ sign_extend 32) (currentByte!10959 lt!370335)) ((_ sign_extend 32) (currentBit!10954 lt!370335)) ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5411 (buf!5886 lt!370335))) ((_ sign_extend 32) (currentByte!10959 lt!370335)) ((_ sign_extend 32) (currentBit!10954 lt!370335))) ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))))))

(declare-fun bs!19737 () Bool)

(assert (= bs!19737 d!79136))

(declare-fun m!357377 () Bool)

(assert (=> bs!19737 m!357377))

(assert (=> b!234702 d!79136))

(declare-fun d!79138 () Bool)

(assert (=> d!79138 (= (array_inv!5152 (buf!5886 bs!63)) (bvsge (size!5411 (buf!5886 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234707 d!79138))

(check-sat (not d!79132) (not d!79136) (not d!79130) (not d!79126) (not d!79128) (not d!79134))
(check-sat)
(get-model)

(declare-fun d!79140 () Bool)

(assert (=> d!79140 (= (remainingBits!0 ((_ sign_extend 32) (size!5411 (buf!5886 lt!370335))) ((_ sign_extend 32) (currentByte!10959 lt!370335)) ((_ sign_extend 32) (currentBit!10954 lt!370335))) (bvsub (bvmul ((_ sign_extend 32) (size!5411 (buf!5886 lt!370335))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10959 lt!370335)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10954 lt!370335)))))))

(assert (=> d!79136 d!79140))

(declare-fun d!79142 () Bool)

(assert (=> d!79142 (= (remainingBits!0 ((_ sign_extend 32) (size!5411 (buf!5886 bs!63))) ((_ sign_extend 32) (currentByte!10959 bs!63)) ((_ sign_extend 32) (currentBit!10954 bs!63))) (bvsub (bvmul ((_ sign_extend 32) (size!5411 (buf!5886 bs!63))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10959 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10954 bs!63)))))))

(assert (=> d!79134 d!79142))

(declare-fun d!79144 () Bool)

(declare-fun e!162277 () Bool)

(assert (=> d!79144 e!162277))

(declare-fun res!196331 () Bool)

(assert (=> d!79144 (=> (not res!196331) (not e!162277))))

(declare-fun lt!370452 () tuple2!19758)

(assert (=> d!79144 (= res!196331 (= (buf!5886 (_2!10783 lt!370452)) (buf!5886 bs!63)))))

(declare-fun e!162275 () tuple2!19758)

(assert (=> d!79144 (= lt!370452 e!162275)))

(declare-fun c!11269 () Bool)

(assert (=> d!79144 (= c!11269 (= nBits!274 i!546))))

(assert (=> d!79144 (and (bvsle #b00000000000000000000000000000000 i!546) (bvsle i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79144 (= (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118) lt!370452)))

(declare-fun b!234760 () Bool)

(declare-fun e!162276 () Bool)

(assert (=> b!234760 (= e!162277 e!162276)))

(declare-fun res!196334 () Bool)

(assert (=> b!234760 (=> res!196334 e!162276)))

(assert (=> b!234760 (= res!196334 (bvsge i!546 nBits!274))))

(declare-fun b!234761 () Bool)

(declare-fun res!196332 () Bool)

(assert (=> b!234761 (=> (not res!196332) (not e!162277))))

(declare-fun lt!370444 () (_ BitVec 64))

(declare-fun lt!370451 () (_ BitVec 64))

(assert (=> b!234761 (= res!196332 (= (bvlshr (_1!10783 lt!370452) lt!370444) (bvlshr acc!118 lt!370451)))))

(assert (=> b!234761 (and (bvsge lt!370451 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370451 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!234761 (= lt!370451 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234761 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234761 (and (bvsge lt!370444 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370444 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!234761 (= lt!370444 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234761 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(declare-fun b!234762 () Bool)

(declare-fun lt!370445 () tuple2!19758)

(assert (=> b!234762 (= e!162275 (tuple2!19759 (_1!10783 lt!370445) (_2!10783 lt!370445)))))

(declare-fun lt!370446 () tuple2!19756)

(assert (=> b!234762 (= lt!370446 (readBit!0 bs!63))))

(assert (=> b!234762 (= lt!370445 (readNLeastSignificantBitsLoop!0 (_2!10782 lt!370446) nBits!274 (bvadd i!546 #b00000000000000000000000000000001) (bvor acc!118 (ite (_1!10782 lt!370446) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234763 () Bool)

(declare-fun res!196333 () Bool)

(assert (=> b!234763 (=> (not res!196333) (not e!162277))))

(assert (=> b!234763 (= res!196333 (= (bvand (_1!10783 lt!370452) (onesLSBLong!0 nBits!274)) (_1!10783 lt!370452)))))

(declare-fun lt!370448 () (_ BitVec 64))

(declare-fun b!234764 () Bool)

(assert (=> b!234764 (= e!162276 (= (= (bvand (bvlshr (_1!10783 lt!370452) lt!370448) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10771 (readBitPure!0 bs!63))))))

(assert (=> b!234764 (and (bvsge lt!370448 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370448 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!370449 () (_ BitVec 32))

(assert (=> b!234764 (= lt!370448 ((_ sign_extend 32) (bvsub lt!370449 i!546)))))

(assert (=> b!234764 (or (= (bvand lt!370449 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand lt!370449 #b10000000000000000000000000000000) (bvand (bvsub lt!370449 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234764 (= lt!370449 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!234764 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!234765 () Bool)

(assert (=> b!234765 (= e!162275 (tuple2!19759 acc!118 bs!63))))

(declare-fun b!234766 () Bool)

(declare-fun res!196330 () Bool)

(assert (=> b!234766 (=> (not res!196330) (not e!162277))))

(declare-fun lt!370447 () (_ BitVec 64))

(declare-fun lt!370450 () (_ BitVec 64))

(assert (=> b!234766 (= res!196330 (= (bitIndex!0 (size!5411 (buf!5886 (_2!10783 lt!370452))) (currentByte!10959 (_2!10783 lt!370452)) (currentBit!10954 (_2!10783 lt!370452))) (bvadd lt!370447 lt!370450)))))

(assert (=> b!234766 (or (not (= (bvand lt!370447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370450 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370447 lt!370450) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234766 (= lt!370450 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234766 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234766 (= lt!370447 (bitIndex!0 (size!5411 (buf!5886 bs!63)) (currentByte!10959 bs!63) (currentBit!10954 bs!63)))))

(assert (= (and d!79144 c!11269) b!234765))

(assert (= (and d!79144 (not c!11269)) b!234762))

(assert (= (and d!79144 res!196331) b!234766))

(assert (= (and b!234766 res!196330) b!234761))

(assert (= (and b!234761 res!196332) b!234763))

(assert (= (and b!234763 res!196333) b!234760))

(assert (= (and b!234760 (not res!196334)) b!234764))

(assert (=> b!234762 m!357369))

(declare-fun m!357393 () Bool)

(assert (=> b!234762 m!357393))

(assert (=> b!234763 m!357301))

(assert (=> b!234764 m!357291))

(declare-fun m!357395 () Bool)

(assert (=> b!234766 m!357395))

(assert (=> b!234766 m!357363))

(assert (=> d!79130 d!79144))

(declare-fun d!79166 () Bool)

(assert (=> d!79166 (= (invariant!0 (currentBit!10954 bs!63) (currentByte!10959 bs!63) (size!5411 (buf!5886 bs!63))) (and (bvsge (currentBit!10954 bs!63) #b00000000000000000000000000000000) (bvslt (currentBit!10954 bs!63) #b00000000000000000000000000001000) (bvsge (currentByte!10959 bs!63) #b00000000000000000000000000000000) (or (bvslt (currentByte!10959 bs!63) (size!5411 (buf!5886 bs!63))) (and (= (currentBit!10954 bs!63) #b00000000000000000000000000000000) (= (currentByte!10959 bs!63) (size!5411 (buf!5886 bs!63)))))))))

(assert (=> d!79132 d!79166))

(declare-fun d!79168 () Bool)

(declare-fun e!162295 () Bool)

(assert (=> d!79168 e!162295))

(declare-fun res!196360 () Bool)

(assert (=> d!79168 (=> (not res!196360) (not e!162295))))

(declare-fun lt!370515 () (_ BitVec 64))

(declare-fun lt!370512 () (_ BitVec 64))

(declare-fun lt!370513 () (_ BitVec 64))

(assert (=> d!79168 (= res!196360 (= lt!370512 (bvsub lt!370513 lt!370515)))))

(assert (=> d!79168 (or (= (bvand lt!370513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370515 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!370513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!370513 lt!370515) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79168 (= lt!370515 (remainingBits!0 ((_ sign_extend 32) (size!5411 (buf!5886 lt!370373))) ((_ sign_extend 32) (currentByte!10959 lt!370373)) ((_ sign_extend 32) (currentBit!10954 lt!370373))))))

(declare-fun lt!370511 () (_ BitVec 64))

(declare-fun lt!370514 () (_ BitVec 64))

(assert (=> d!79168 (= lt!370513 (bvmul lt!370511 lt!370514))))

(assert (=> d!79168 (or (= lt!370511 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!370514 (bvsdiv (bvmul lt!370511 lt!370514) lt!370511)))))

(assert (=> d!79168 (= lt!370514 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79168 (= lt!370511 ((_ sign_extend 32) (size!5411 (buf!5886 lt!370373))))))

(assert (=> d!79168 (= lt!370512 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10959 lt!370373)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10954 lt!370373))))))

(assert (=> d!79168 (invariant!0 (currentBit!10954 lt!370373) (currentByte!10959 lt!370373) (size!5411 (buf!5886 lt!370373)))))

(assert (=> d!79168 (= (bitIndex!0 (size!5411 (buf!5886 lt!370373)) (currentByte!10959 lt!370373) (currentBit!10954 lt!370373)) lt!370512)))

(declare-fun b!234798 () Bool)

(declare-fun res!196361 () Bool)

(assert (=> b!234798 (=> (not res!196361) (not e!162295))))

(assert (=> b!234798 (= res!196361 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370512))))

(declare-fun b!234799 () Bool)

(declare-fun lt!370510 () (_ BitVec 64))

(assert (=> b!234799 (= e!162295 (bvsle lt!370512 (bvmul lt!370510 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234799 (or (= lt!370510 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!370510 #b0000000000000000000000000000000000000000000000000000000000001000) lt!370510)))))

(assert (=> b!234799 (= lt!370510 ((_ sign_extend 32) (size!5411 (buf!5886 lt!370373))))))

(assert (= (and d!79168 res!196360) b!234798))

(assert (= (and b!234798 res!196361) b!234799))

(declare-fun m!357403 () Bool)

(assert (=> d!79168 m!357403))

(declare-fun m!357405 () Bool)

(assert (=> d!79168 m!357405))

(assert (=> d!79126 d!79168))

(declare-fun d!79174 () Bool)

(declare-fun e!162296 () Bool)

(assert (=> d!79174 e!162296))

(declare-fun res!196362 () Bool)

(assert (=> d!79174 (=> (not res!196362) (not e!162296))))

(declare-fun lt!370521 () (_ BitVec 64))

(declare-fun lt!370518 () (_ BitVec 64))

(declare-fun lt!370519 () (_ BitVec 64))

(assert (=> d!79174 (= res!196362 (= lt!370518 (bvsub lt!370519 lt!370521)))))

(assert (=> d!79174 (or (= (bvand lt!370519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370521 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!370519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!370519 lt!370521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79174 (= lt!370521 (remainingBits!0 ((_ sign_extend 32) (size!5411 (buf!5886 bs!63))) ((_ sign_extend 32) (currentByte!10959 bs!63)) ((_ sign_extend 32) (currentBit!10954 bs!63))))))

(declare-fun lt!370517 () (_ BitVec 64))

(declare-fun lt!370520 () (_ BitVec 64))

(assert (=> d!79174 (= lt!370519 (bvmul lt!370517 lt!370520))))

(assert (=> d!79174 (or (= lt!370517 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!370520 (bvsdiv (bvmul lt!370517 lt!370520) lt!370517)))))

(assert (=> d!79174 (= lt!370520 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79174 (= lt!370517 ((_ sign_extend 32) (size!5411 (buf!5886 bs!63))))))

(assert (=> d!79174 (= lt!370518 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10959 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10954 bs!63))))))

(assert (=> d!79174 (invariant!0 (currentBit!10954 bs!63) (currentByte!10959 bs!63) (size!5411 (buf!5886 bs!63)))))

(assert (=> d!79174 (= (bitIndex!0 (size!5411 (buf!5886 bs!63)) (currentByte!10959 bs!63) (currentBit!10954 bs!63)) lt!370518)))

(declare-fun b!234800 () Bool)

(declare-fun res!196363 () Bool)

(assert (=> b!234800 (=> (not res!196363) (not e!162296))))

(assert (=> b!234800 (= res!196363 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370518))))

(declare-fun b!234801 () Bool)

(declare-fun lt!370516 () (_ BitVec 64))

(assert (=> b!234801 (= e!162296 (bvsle lt!370518 (bvmul lt!370516 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234801 (or (= lt!370516 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!370516 #b0000000000000000000000000000000000000000000000000000000000001000) lt!370516)))))

(assert (=> b!234801 (= lt!370516 ((_ sign_extend 32) (size!5411 (buf!5886 bs!63))))))

(assert (= (and d!79174 res!196362) b!234800))

(assert (= (and b!234800 res!196363) b!234801))

(assert (=> d!79174 m!357375))

(assert (=> d!79174 m!357373))

(assert (=> d!79126 d!79174))

(declare-fun d!79176 () Bool)

(declare-fun lt!370599 () (_ BitVec 32))

(assert (=> d!79176 (= lt!370599 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!370602 () (_ BitVec 32))

(assert (=> d!79176 (= lt!370602 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!162320 () Bool)

(assert (=> d!79176 e!162320))

(declare-fun res!196395 () Bool)

(assert (=> d!79176 (=> (not res!196395) (not e!162320))))

(assert (=> d!79176 (= res!196395 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!17301 () Unit!17289)

(declare-fun Unit!17302 () Unit!17289)

(declare-fun Unit!17304 () Unit!17289)

(assert (=> d!79176 (= (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!10954 bs!63) lt!370599) #b00000000000000000000000000000000) (tuple2!19755 Unit!17301 (BitStream!9787 (buf!5886 bs!63) (bvsub (bvadd (currentByte!10959 bs!63) lt!370602) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!370599 (currentBit!10954 bs!63)))) (ite (bvsge (bvadd (currentBit!10954 bs!63) lt!370599) #b00000000000000000000000000001000) (tuple2!19755 Unit!17302 (BitStream!9787 (buf!5886 bs!63) (bvadd (currentByte!10959 bs!63) lt!370602 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!10954 bs!63) lt!370599) #b00000000000000000000000000001000))) (tuple2!19755 Unit!17304 (BitStream!9787 (buf!5886 bs!63) (bvadd (currentByte!10959 bs!63) lt!370602) (bvadd (currentBit!10954 bs!63) lt!370599))))))))

(declare-fun b!234838 () Bool)

(declare-fun e!162321 () Bool)

(assert (=> b!234838 (= e!162320 e!162321)))

(declare-fun res!196396 () Bool)

(assert (=> b!234838 (=> (not res!196396) (not e!162321))))

(declare-fun lt!370598 () (_ BitVec 64))

(declare-fun lt!370600 () tuple2!19754)

(assert (=> b!234838 (= res!196396 (= (bvadd lt!370598 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5411 (buf!5886 (_2!10781 lt!370600))) (currentByte!10959 (_2!10781 lt!370600)) (currentBit!10954 (_2!10781 lt!370600)))))))

(assert (=> b!234838 (or (not (= (bvand lt!370598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370598 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234838 (= lt!370598 (bitIndex!0 (size!5411 (buf!5886 bs!63)) (currentByte!10959 bs!63) (currentBit!10954 bs!63)))))

(declare-fun lt!370597 () (_ BitVec 32))

(declare-fun lt!370601 () (_ BitVec 32))

(declare-fun Unit!17306 () Unit!17289)

(declare-fun Unit!17307 () Unit!17289)

(declare-fun Unit!17308 () Unit!17289)

(assert (=> b!234838 (= lt!370600 (ite (bvslt (bvadd (currentBit!10954 bs!63) lt!370597) #b00000000000000000000000000000000) (tuple2!19755 Unit!17306 (BitStream!9787 (buf!5886 bs!63) (bvsub (bvadd (currentByte!10959 bs!63) lt!370601) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!370597 (currentBit!10954 bs!63)))) (ite (bvsge (bvadd (currentBit!10954 bs!63) lt!370597) #b00000000000000000000000000001000) (tuple2!19755 Unit!17307 (BitStream!9787 (buf!5886 bs!63) (bvadd (currentByte!10959 bs!63) lt!370601 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!10954 bs!63) lt!370597) #b00000000000000000000000000001000))) (tuple2!19755 Unit!17308 (BitStream!9787 (buf!5886 bs!63) (bvadd (currentByte!10959 bs!63) lt!370601) (bvadd (currentBit!10954 bs!63) lt!370597))))))))

(assert (=> b!234838 (= lt!370597 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234838 (= lt!370601 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!234839 () Bool)

(assert (=> b!234839 (= e!162321 (and (= (size!5411 (buf!5886 bs!63)) (size!5411 (buf!5886 (_2!10781 lt!370600)))) (= (buf!5886 bs!63) (buf!5886 (_2!10781 lt!370600)))))))

(assert (= (and d!79176 res!196395) b!234838))

(assert (= (and b!234838 res!196396) b!234839))

(assert (=> d!79176 m!357367))

(declare-fun m!357413 () Bool)

(assert (=> b!234838 m!357413))

(assert (=> b!234838 m!357363))

(assert (=> d!79126 d!79176))

(declare-fun d!79194 () Bool)

(declare-fun res!196407 () Bool)

(declare-fun e!162330 () Bool)

(assert (=> d!79194 (=> (not res!196407) (not e!162330))))

(assert (=> d!79194 (= res!196407 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5411 (buf!5886 bs!63)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5411 (buf!5886 bs!63)))))))))

(assert (=> d!79194 (= (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) e!162330)))

(declare-fun b!234854 () Bool)

(declare-fun lt!370617 () (_ BitVec 64))

(assert (=> b!234854 (= e!162330 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370617) (bvsle lt!370617 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5411 (buf!5886 bs!63)))))))))

(assert (=> b!234854 (= lt!370617 (bvadd (bitIndex!0 (size!5411 (buf!5886 bs!63)) (currentByte!10959 bs!63) (currentBit!10954 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!79194 res!196407) b!234854))

(assert (=> b!234854 m!357363))

(assert (=> d!79126 d!79194))

(declare-fun d!79198 () Bool)

(declare-fun e!162344 () Bool)

(assert (=> d!79198 e!162344))

(declare-fun res!196413 () Bool)

(assert (=> d!79198 (=> (not res!196413) (not e!162344))))

(declare-fun increaseBitIndex!0 (BitStream!9786) tuple2!19754)

(assert (=> d!79198 (= res!196413 (= (buf!5886 (_2!10781 (increaseBitIndex!0 bs!63))) (buf!5886 bs!63)))))

(declare-fun lt!370655 () Bool)

(assert (=> d!79198 (= lt!370655 (not (= (bvand ((_ sign_extend 24) (select (arr!6398 (buf!5886 bs!63)) (currentByte!10959 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10954 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370658 () tuple2!19756)

(assert (=> d!79198 (= lt!370658 (tuple2!19757 (not (= (bvand ((_ sign_extend 24) (select (arr!6398 (buf!5886 bs!63)) (currentByte!10959 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10954 bs!63)))) #b00000000000000000000000000000000)) (_2!10781 (increaseBitIndex!0 bs!63))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79198 (validate_offset_bit!0 ((_ sign_extend 32) (size!5411 (buf!5886 bs!63))) ((_ sign_extend 32) (currentByte!10959 bs!63)) ((_ sign_extend 32) (currentBit!10954 bs!63)))))

(assert (=> d!79198 (= (readBit!0 bs!63) lt!370658)))

(declare-fun b!234860 () Bool)

(declare-fun lt!370653 () (_ BitVec 64))

(declare-fun lt!370659 () (_ BitVec 64))

(assert (=> b!234860 (= e!162344 (= (bitIndex!0 (size!5411 (buf!5886 (_2!10781 (increaseBitIndex!0 bs!63)))) (currentByte!10959 (_2!10781 (increaseBitIndex!0 bs!63))) (currentBit!10954 (_2!10781 (increaseBitIndex!0 bs!63)))) (bvadd lt!370659 lt!370653)))))

(assert (=> b!234860 (or (not (= (bvand lt!370659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370653 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370659 lt!370653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234860 (= lt!370653 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!234860 (= lt!370659 (bitIndex!0 (size!5411 (buf!5886 bs!63)) (currentByte!10959 bs!63) (currentBit!10954 bs!63)))))

(declare-fun lt!370656 () Bool)

(assert (=> b!234860 (= lt!370656 (not (= (bvand ((_ sign_extend 24) (select (arr!6398 (buf!5886 bs!63)) (currentByte!10959 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10954 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370654 () Bool)

(assert (=> b!234860 (= lt!370654 (not (= (bvand ((_ sign_extend 24) (select (arr!6398 (buf!5886 bs!63)) (currentByte!10959 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10954 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370657 () Bool)

(assert (=> b!234860 (= lt!370657 (not (= (bvand ((_ sign_extend 24) (select (arr!6398 (buf!5886 bs!63)) (currentByte!10959 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10954 bs!63)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79198 res!196413) b!234860))

(declare-fun m!357429 () Bool)

(assert (=> d!79198 m!357429))

(declare-fun m!357431 () Bool)

(assert (=> d!79198 m!357431))

(declare-fun m!357433 () Bool)

(assert (=> d!79198 m!357433))

(declare-fun m!357435 () Bool)

(assert (=> d!79198 m!357435))

(assert (=> b!234860 m!357363))

(assert (=> b!234860 m!357429))

(declare-fun m!357437 () Bool)

(assert (=> b!234860 m!357437))

(assert (=> b!234860 m!357433))

(assert (=> b!234860 m!357431))

(assert (=> d!79128 d!79198))

(check-sat (not b!234838) (not b!234766) (not d!79198) (not d!79176) (not d!79174) (not b!234763) (not d!79168) (not b!234860) (not b!234854) (not b!234764) (not b!234762))
(check-sat)
