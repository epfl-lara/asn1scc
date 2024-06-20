; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49914 () Bool)

(assert start!49914)

(declare-fun res!196463 () Bool)

(declare-fun e!162386 () Bool)

(assert (=> start!49914 (=> (not res!196463) (not e!162386))))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> start!49914 (= res!196463 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49914 e!162386))

(assert (=> start!49914 true))

(declare-datatypes ((array!12327 0))(
  ( (array!12328 (arr!6402 (Array (_ BitVec 32) (_ BitVec 8))) (size!5415 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9794 0))(
  ( (BitStream!9795 (buf!5890 array!12327) (currentByte!10975 (_ BitVec 32)) (currentBit!10970 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9794)

(declare-fun e!162387 () Bool)

(declare-fun inv!12 (BitStream!9794) Bool)

(assert (=> start!49914 (and (inv!12 bs!63) e!162387)))

(declare-fun b!234917 () Bool)

(declare-fun e!162385 () Bool)

(assert (=> b!234917 (= e!162386 e!162385)))

(declare-fun res!196466 () Bool)

(assert (=> b!234917 (=> (not res!196466) (not e!162385))))

(assert (=> b!234917 (= res!196466 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun lt!370695 () BitStream!9794)

(declare-fun withMovedBitIndex!0 (BitStream!9794 (_ BitVec 64)) BitStream!9794)

(assert (=> b!234917 (= lt!370695 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!19768 0))(
  ( (tuple2!19769 (_1!10788 BitStream!9794) (_2!10788 Bool)) )
))
(declare-fun lt!370692 () tuple2!19768)

(declare-fun readBitPure!0 (BitStream!9794) tuple2!19768)

(assert (=> b!234917 (= lt!370692 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19770 0))(
  ( (tuple2!19771 (_1!10789 BitStream!9794) (_2!10789 (_ BitVec 64))) )
))
(declare-fun lt!370694 () tuple2!19770)

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19770)

(assert (=> b!234917 (= lt!370694 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!234918 () Bool)

(declare-fun array_inv!5156 (array!12327) Bool)

(assert (=> b!234918 (= e!162387 (array_inv!5156 (buf!5890 bs!63)))))

(declare-fun b!234919 () Bool)

(declare-fun lt!370693 () (_ BitVec 32))

(declare-fun e!162388 () Bool)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234919 (= e!162388 (not (= (bvand (bvor acc!118 (ite (_2!10788 lt!370692) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 lt!370693)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234920 () Bool)

(declare-fun res!196462 () Bool)

(assert (=> b!234920 (=> (not res!196462) (not e!162386))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234920 (= res!196462 (validate_offset_bits!1 ((_ sign_extend 32) (size!5415 (buf!5890 bs!63))) ((_ sign_extend 32) (currentByte!10975 bs!63)) ((_ sign_extend 32) (currentBit!10970 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234921 () Bool)

(declare-fun res!196467 () Bool)

(assert (=> b!234921 (=> (not res!196467) (not e!162386))))

(assert (=> b!234921 (= res!196467 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234922 () Bool)

(assert (=> b!234922 (= e!162385 e!162388)))

(declare-fun res!196465 () Bool)

(assert (=> b!234922 (=> (not res!196465) (not e!162388))))

(assert (=> b!234922 (= res!196465 (validate_offset_bits!1 ((_ sign_extend 32) (size!5415 (buf!5890 lt!370695))) ((_ sign_extend 32) (currentByte!10975 lt!370695)) ((_ sign_extend 32) (currentBit!10970 lt!370695)) ((_ sign_extend 32) lt!370693)))))

(assert (=> b!234922 (= lt!370693 (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun b!234923 () Bool)

(declare-fun res!196464 () Bool)

(assert (=> b!234923 (=> (not res!196464) (not e!162386))))

(assert (=> b!234923 (= res!196464 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!49914 res!196463) b!234920))

(assert (= (and b!234920 res!196462) b!234923))

(assert (= (and b!234923 res!196464) b!234921))

(assert (= (and b!234921 res!196467) b!234917))

(assert (= (and b!234917 res!196466) b!234922))

(assert (= (and b!234922 res!196465) b!234919))

(assert (= start!49914 b!234918))

(declare-fun m!357479 () Bool)

(assert (=> b!234921 m!357479))

(declare-fun m!357481 () Bool)

(assert (=> b!234920 m!357481))

(declare-fun m!357483 () Bool)

(assert (=> b!234923 m!357483))

(declare-fun m!357485 () Bool)

(assert (=> b!234918 m!357485))

(declare-fun m!357487 () Bool)

(assert (=> start!49914 m!357487))

(declare-fun m!357489 () Bool)

(assert (=> b!234922 m!357489))

(declare-fun m!357491 () Bool)

(assert (=> b!234919 m!357491))

(declare-fun m!357493 () Bool)

(assert (=> b!234917 m!357493))

(declare-fun m!357495 () Bool)

(assert (=> b!234917 m!357495))

(declare-fun m!357497 () Bool)

(assert (=> b!234917 m!357497))

(push 1)

(assert (not b!234923))

(assert (not b!234918))

(assert (not b!234922))

(assert (not b!234917))

(assert (not b!234921))

(assert (not b!234920))

(assert (not start!49914))

(assert (not b!234919))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79234 () Bool)

(declare-fun e!162398 () Bool)

(assert (=> d!79234 e!162398))

(declare-fun res!196476 () Bool)

(assert (=> d!79234 (=> (not res!196476) (not e!162398))))

(declare-fun lt!370725 () (_ BitVec 64))

(declare-fun lt!370724 () BitStream!9794)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!79234 (= res!196476 (= (bvadd lt!370725 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5415 (buf!5890 lt!370724)) (currentByte!10975 lt!370724) (currentBit!10970 lt!370724))))))

(assert (=> d!79234 (or (not (= (bvand lt!370725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370725 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79234 (= lt!370725 (bitIndex!0 (size!5415 (buf!5890 bs!63)) (currentByte!10975 bs!63) (currentBit!10970 bs!63)))))

(declare-datatypes ((Unit!17313 0))(
  ( (Unit!17314) )
))
(declare-datatypes ((tuple2!19784 0))(
  ( (tuple2!19785 (_1!10796 Unit!17313) (_2!10796 BitStream!9794)) )
))
(declare-fun moveBitIndex!0 (BitStream!9794 (_ BitVec 64)) tuple2!19784)

(assert (=> d!79234 (= lt!370724 (_2!10796 (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!9794 (_ BitVec 64)) Bool)

(assert (=> d!79234 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79234 (= (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) lt!370724)))

(declare-fun b!234932 () Bool)

(assert (=> b!234932 (= e!162398 (= (size!5415 (buf!5890 bs!63)) (size!5415 (buf!5890 lt!370724))))))

(assert (= (and d!79234 res!196476) b!234932))

(declare-fun m!357535 () Bool)

(assert (=> d!79234 m!357535))

(declare-fun m!357537 () Bool)

(assert (=> d!79234 m!357537))

(declare-fun m!357539 () Bool)

(assert (=> d!79234 m!357539))

(declare-fun m!357541 () Bool)

(assert (=> d!79234 m!357541))

(assert (=> b!234917 d!79234))

(declare-fun d!79244 () Bool)

(declare-datatypes ((tuple2!19786 0))(
  ( (tuple2!19787 (_1!10797 Bool) (_2!10797 BitStream!9794)) )
))
(declare-fun lt!370728 () tuple2!19786)

(declare-fun readBit!0 (BitStream!9794) tuple2!19786)

(assert (=> d!79244 (= lt!370728 (readBit!0 bs!63))))

(assert (=> d!79244 (= (readBitPure!0 bs!63) (tuple2!19769 (_2!10797 lt!370728) (_1!10797 lt!370728)))))

(declare-fun bs!19751 () Bool)

(assert (= bs!19751 d!79244))

(declare-fun m!357543 () Bool)

(assert (=> bs!19751 m!357543))

(assert (=> b!234917 d!79244))

(declare-fun d!79246 () Bool)

(declare-datatypes ((tuple2!19788 0))(
  ( (tuple2!19789 (_1!10798 (_ BitVec 64)) (_2!10798 BitStream!9794)) )
))
(declare-fun lt!370731 () tuple2!19788)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19788)

(assert (=> d!79246 (= lt!370731 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79246 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19771 (_2!10798 lt!370731) (_1!10798 lt!370731)))))

(declare-fun bs!19752 () Bool)

(assert (= bs!19752 d!79246))

(declare-fun m!357545 () Bool)

(assert (=> bs!19752 m!357545))

(assert (=> b!234917 d!79246))

(declare-fun d!79248 () Bool)

(assert (=> d!79248 (= (array_inv!5156 (buf!5890 bs!63)) (bvsge (size!5415 (buf!5890 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234918 d!79248))

(declare-fun d!79250 () Bool)

(assert (=> d!79250 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234923 d!79250))

(declare-fun d!79252 () Bool)

(assert (=> d!79252 (= (onesLSBLong!0 lt!370693) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!370693))))))

(assert (=> b!234919 d!79252))

(declare-fun d!79254 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79254 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5415 (buf!5890 bs!63))) ((_ sign_extend 32) (currentByte!10975 bs!63)) ((_ sign_extend 32) (currentBit!10970 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5415 (buf!5890 bs!63))) ((_ sign_extend 32) (currentByte!10975 bs!63)) ((_ sign_extend 32) (currentBit!10970 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19753 () Bool)

(assert (= bs!19753 d!79254))

(declare-fun m!357547 () Bool)

(assert (=> bs!19753 m!357547))

(assert (=> b!234920 d!79254))

(declare-fun d!79256 () Bool)

(assert (=> d!79256 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234921 d!79256))

(declare-fun d!79258 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79258 (= (inv!12 bs!63) (invariant!0 (currentBit!10970 bs!63) (currentByte!10975 bs!63) (size!5415 (buf!5890 bs!63))))))

(declare-fun bs!19754 () Bool)

(assert (= bs!19754 d!79258))

(declare-fun m!357549 () Bool)

(assert (=> bs!19754 m!357549))

(assert (=> start!49914 d!79258))

(declare-fun d!79260 () Bool)

(assert (=> d!79260 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5415 (buf!5890 lt!370695))) ((_ sign_extend 32) (currentByte!10975 lt!370695)) ((_ sign_extend 32) (currentBit!10970 lt!370695)) ((_ sign_extend 32) lt!370693)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5415 (buf!5890 lt!370695))) ((_ sign_extend 32) (currentByte!10975 lt!370695)) ((_ sign_extend 32) (currentBit!10970 lt!370695))) ((_ sign_extend 32) lt!370693)))))

(declare-fun bs!19755 () Bool)

(assert (= bs!19755 d!79260))

(declare-fun m!357551 () Bool)

(assert (=> bs!19755 m!357551))

(assert (=> b!234922 d!79260))

(push 1)

(assert (not d!79254))

(assert (not d!79234))

(assert (not d!79244))

(assert (not d!79260))

(assert (not d!79246))

(assert (not d!79258))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

