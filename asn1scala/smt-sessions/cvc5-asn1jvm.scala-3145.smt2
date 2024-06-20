; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72200 () Bool)

(assert start!72200)

(declare-fun b!323740 () Bool)

(declare-fun e!233223 () Bool)

(declare-fun e!233219 () Bool)

(assert (=> b!323740 (= e!233223 e!233219)))

(declare-fun res!265763 () Bool)

(assert (=> b!323740 (=> res!265763 e!233219)))

(declare-datatypes ((array!20692 0))(
  ( (array!20693 (arr!10099 (Array (_ BitVec 32) (_ BitVec 8))) (size!9007 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14176 0))(
  ( (BitStream!14177 (buf!8149 array!20692) (currentByte!15026 (_ BitVec 32)) (currentBit!15021 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23720 0))(
  ( (tuple2!23721 (_1!13489 (_ BitVec 64)) (_2!13489 BitStream!14176)) )
))
(declare-fun lt!446187 () tuple2!23720)

(declare-fun thiss!1793 () BitStream!14176)

(assert (=> b!323740 (= res!265763 (not (= (buf!8149 (_2!13489 lt!446187)) (buf!8149 thiss!1793))))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(declare-datatypes ((tuple2!23722 0))(
  ( (tuple2!23723 (_1!13490 Bool) (_2!13490 BitStream!14176)) )
))
(declare-fun lt!446189 () tuple2!23722)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23720)

(assert (=> b!323740 (= lt!446187 (readNBitsLSBFirstsLoop!0 (_2!13490 lt!446189) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13490 lt!446189) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14176) tuple2!23722)

(assert (=> b!323740 (= lt!446189 (readBit!0 thiss!1793))))

(declare-fun b!323742 () Bool)

(declare-fun res!265767 () Bool)

(assert (=> b!323742 (=> (not res!265767) (not e!233223))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323742 (= res!265767 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!233221 () Bool)

(declare-fun b!323743 () Bool)

(declare-datatypes ((tuple2!23724 0))(
  ( (tuple2!23725 (_1!13491 BitStream!14176) (_2!13491 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!14176) tuple2!23724)

(assert (=> b!323743 (= e!233221 (not (= (= (bvand (bvlshr (_1!13489 lt!446187) ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13491 (readBitPure!0 thiss!1793)))))))

(declare-fun b!323744 () Bool)

(declare-fun res!265768 () Bool)

(assert (=> b!323744 (=> (not res!265768) (not e!233223))))

(assert (=> b!323744 (= res!265768 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323745 () Bool)

(declare-fun res!265765 () Bool)

(declare-fun e!233220 () Bool)

(assert (=> b!323745 (=> res!265765 e!233220)))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323745 (= res!265765 (not (= (bvand (_1!13489 lt!446187) (onesLSBLong!0 nBits!548)) (_1!13489 lt!446187))))))

(declare-fun b!323746 () Bool)

(declare-fun e!233217 () Bool)

(declare-fun array_inv!8559 (array!20692) Bool)

(assert (=> b!323746 (= e!233217 (array_inv!8559 (buf!8149 thiss!1793)))))

(declare-fun b!323747 () Bool)

(declare-fun e!233222 () Bool)

(assert (=> b!323747 (= e!233222 e!233223)))

(declare-fun res!265771 () Bool)

(assert (=> b!323747 (=> (not res!265771) (not e!233223))))

(declare-fun lt!446186 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323747 (= res!265771 (validate_offset_bits!1 ((_ sign_extend 32) (size!9007 (buf!8149 thiss!1793))) ((_ sign_extend 32) (currentByte!15026 thiss!1793)) ((_ sign_extend 32) (currentBit!15021 thiss!1793)) lt!446186))))

(assert (=> b!323747 (= lt!446186 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!323748 () Bool)

(assert (=> b!323748 (= e!233220 e!233221)))

(declare-fun res!265769 () Bool)

(assert (=> b!323748 (=> (not res!265769) (not e!233221))))

(assert (=> b!323748 (= res!265769 (bvslt i!743 nBits!548))))

(declare-fun b!323749 () Bool)

(declare-fun res!265766 () Bool)

(assert (=> b!323749 (=> res!265766 e!233219)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323749 (= res!265766 (not (= (bitIndex!0 (size!9007 (buf!8149 (_2!13489 lt!446187))) (currentByte!15026 (_2!13489 lt!446187)) (currentBit!15021 (_2!13489 lt!446187))) (bvadd (bitIndex!0 (size!9007 (buf!8149 thiss!1793)) (currentByte!15026 thiss!1793) (currentBit!15021 thiss!1793)) lt!446186))))))

(declare-fun res!265770 () Bool)

(assert (=> start!72200 (=> (not res!265770) (not e!233222))))

(assert (=> start!72200 (= res!265770 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72200 e!233222))

(assert (=> start!72200 true))

(declare-fun inv!12 (BitStream!14176) Bool)

(assert (=> start!72200 (and (inv!12 thiss!1793) e!233217)))

(declare-fun b!323741 () Bool)

(assert (=> b!323741 (= e!233219 e!233220)))

(declare-fun res!265764 () Bool)

(assert (=> b!323741 (=> res!265764 e!233220)))

(declare-fun lt!446188 () (_ BitVec 64))

(assert (=> b!323741 (= res!265764 (not (= (bvand (_1!13489 lt!446187) lt!446188) (bvand acc!161 lt!446188))))))

(assert (=> b!323741 (= lt!446188 (onesLSBLong!0 i!743))))

(assert (= (and start!72200 res!265770) b!323747))

(assert (= (and b!323747 res!265771) b!323742))

(assert (= (and b!323742 res!265767) b!323744))

(assert (= (and b!323744 res!265768) b!323740))

(assert (= (and b!323740 (not res!265763)) b!323749))

(assert (= (and b!323749 (not res!265766)) b!323741))

(assert (= (and b!323741 (not res!265764)) b!323745))

(assert (= (and b!323745 (not res!265765)) b!323748))

(assert (= (and b!323748 res!265769) b!323743))

(assert (= start!72200 b!323746))

(declare-fun m!461745 () Bool)

(assert (=> b!323742 m!461745))

(declare-fun m!461747 () Bool)

(assert (=> b!323743 m!461747))

(declare-fun m!461749 () Bool)

(assert (=> b!323747 m!461749))

(declare-fun m!461751 () Bool)

(assert (=> b!323741 m!461751))

(declare-fun m!461753 () Bool)

(assert (=> b!323746 m!461753))

(declare-fun m!461755 () Bool)

(assert (=> b!323749 m!461755))

(declare-fun m!461757 () Bool)

(assert (=> b!323749 m!461757))

(declare-fun m!461759 () Bool)

(assert (=> b!323745 m!461759))

(declare-fun m!461761 () Bool)

(assert (=> start!72200 m!461761))

(declare-fun m!461763 () Bool)

(assert (=> b!323740 m!461763))

(declare-fun m!461765 () Bool)

(assert (=> b!323740 m!461765))

(push 1)

(assert (not b!323745))

(assert (not b!323747))

(assert (not b!323746))

(assert (not b!323740))

(assert (not b!323743))

(assert (not start!72200))

(assert (not b!323749))

(assert (not b!323742))

(assert (not b!323741))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106122 () Bool)

(assert (=> d!106122 (= (onesLSBLong!0 i!743) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!743))))))

(assert (=> b!323741 d!106122))

(declare-fun d!106124 () Bool)

(assert (=> d!106124 (= (array_inv!8559 (buf!8149 thiss!1793)) (bvsge (size!9007 (buf!8149 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!323746 d!106124))

(declare-fun b!323853 () Bool)

(declare-fun e!233285 () Bool)

(declare-fun e!233287 () Bool)

(assert (=> b!323853 (= e!233285 e!233287)))

(declare-fun res!265860 () Bool)

(assert (=> b!323853 (=> res!265860 e!233287)))

(assert (=> b!323853 (= res!265860 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-fun d!106126 () Bool)

(assert (=> d!106126 e!233285))

(declare-fun res!265861 () Bool)

(assert (=> d!106126 (=> (not res!265861) (not e!233285))))

(declare-fun lt!446268 () tuple2!23720)

(assert (=> d!106126 (= res!265861 (= (buf!8149 (_2!13489 lt!446268)) (buf!8149 (_2!13490 lt!446189))))))

(declare-fun e!233286 () tuple2!23720)

(assert (=> d!106126 (= lt!446268 e!233286)))

(declare-fun c!15457 () Bool)

(assert (=> d!106126 (= c!15457 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (=> d!106126 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!106126 (= (readNBitsLSBFirstsLoop!0 (_2!13490 lt!446189) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13490 lt!446189) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!446268)))

(declare-fun b!323854 () Bool)

(declare-fun res!265862 () Bool)

(assert (=> b!323854 (=> (not res!265862) (not e!233285))))

(assert (=> b!323854 (= res!265862 (= (bvand (_1!13489 lt!446268) (onesLSBLong!0 nBits!548)) (_1!13489 lt!446268)))))

(declare-fun lt!446272 () (_ BitVec 64))

(declare-fun b!323855 () Bool)

(assert (=> b!323855 (= e!233287 (= (= (bvand (bvlshr (_1!13489 lt!446268) lt!446272) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13491 (readBitPure!0 (_2!13490 lt!446189)))))))

(assert (=> b!323855 (and (bvsge lt!446272 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!446272 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!323855 (= lt!446272 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743)))))

(declare-fun b!323856 () Bool)

(declare-fun res!265863 () Bool)

(assert (=> b!323856 (=> (not res!265863) (not e!233285))))

(declare-fun lt!446269 () (_ BitVec 64))

(declare-fun lt!446270 () (_ BitVec 64))

(assert (=> b!323856 (= res!265863 (= (bitIndex!0 (size!9007 (buf!8149 (_2!13489 lt!446268))) (currentByte!15026 (_2!13489 lt!446268)) (currentBit!15021 (_2!13489 lt!446268))) (bvadd lt!446270 lt!446269)))))

(assert (=> b!323856 (or (not (= (bvand lt!446270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446269 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446270 lt!446269) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323856 (= lt!446269 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))

(assert (=> b!323856 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) #b10000000000000000000000000000000)))))

(assert (=> b!323856 (= lt!446270 (bitIndex!0 (size!9007 (buf!8149 (_2!13490 lt!446189))) (currentByte!15026 (_2!13490 lt!446189)) (currentBit!15021 (_2!13490 lt!446189))))))

(declare-fun b!323857 () Bool)

(assert (=> b!323857 (= e!233286 (tuple2!23721 (bvor acc!161 (ite (_1!13490 lt!446189) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13490 lt!446189)))))

(declare-fun b!323858 () Bool)

(declare-fun lt!446273 () tuple2!23720)

(assert (=> b!323858 (= e!233286 (tuple2!23721 (_1!13489 lt!446273) (_2!13489 lt!446273)))))

(declare-fun lt!446271 () tuple2!23722)

(assert (=> b!323858 (= lt!446271 (readBit!0 (_2!13490 lt!446189)))))

(assert (=> b!323858 (= lt!446273 (readNBitsLSBFirstsLoop!0 (_2!13490 lt!446271) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13490 lt!446189) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13490 lt!446271) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!323859 () Bool)

(declare-fun res!265859 () Bool)

(assert (=> b!323859 (=> (not res!265859) (not e!233285))))

(assert (=> b!323859 (= res!265859 (= (bvand (_1!13489 lt!446268) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743))) (bvand (bvor acc!161 (ite (_1!13490 lt!446189) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)))))))

(assert (= (and d!106126 c!15457) b!323857))

(assert (= (and d!106126 (not c!15457)) b!323858))

(assert (= (and d!106126 res!265861) b!323856))

(assert (= (and b!323856 res!265863) b!323859))

(assert (= (and b!323859 res!265859) b!323854))

(assert (= (and b!323854 res!265862) b!323853))

(assert (= (and b!323853 (not res!265860)) b!323855))

(declare-fun m!461833 () Bool)

(assert (=> b!323856 m!461833))

(declare-fun m!461835 () Bool)

(assert (=> b!323856 m!461835))

(declare-fun m!461837 () Bool)

(assert (=> b!323855 m!461837))

(assert (=> b!323854 m!461759))

(declare-fun m!461839 () Bool)

(assert (=> b!323858 m!461839))

(declare-fun m!461841 () Bool)

(assert (=> b!323858 m!461841))

(declare-fun m!461843 () Bool)

(assert (=> b!323859 m!461843))

(assert (=> b!323740 d!106126))

(declare-fun d!106136 () Bool)

(declare-fun e!233305 () Bool)

(assert (=> d!106136 e!233305))

(declare-fun res!265877 () Bool)

(assert (=> d!106136 (=> (not res!265877) (not e!233305))))

(declare-datatypes ((Unit!22046 0))(
  ( (Unit!22047) )
))
(declare-datatypes ((tuple2!23740 0))(
  ( (tuple2!23741 (_1!13499 Unit!22046) (_2!13499 BitStream!14176)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14176) tuple2!23740)

(assert (=> d!106136 (= res!265877 (= (buf!8149 (_2!13499 (increaseBitIndex!0 thiss!1793))) (buf!8149 thiss!1793)))))

(declare-fun lt!446341 () Bool)

(assert (=> d!106136 (= lt!446341 (not (= (bvand ((_ sign_extend 24) (select (arr!10099 (buf!8149 thiss!1793)) (currentByte!15026 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15021 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446336 () tuple2!23722)

(assert (=> d!106136 (= lt!446336 (tuple2!23723 (not (= (bvand ((_ sign_extend 24) (select (arr!10099 (buf!8149 thiss!1793)) (currentByte!15026 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15021 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13499 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!106136 (validate_offset_bit!0 ((_ sign_extend 32) (size!9007 (buf!8149 thiss!1793))) ((_ sign_extend 32) (currentByte!15026 thiss!1793)) ((_ sign_extend 32) (currentBit!15021 thiss!1793)))))

(assert (=> d!106136 (= (readBit!0 thiss!1793) lt!446336)))

(declare-fun lt!446342 () (_ BitVec 64))

(declare-fun lt!446337 () (_ BitVec 64))

(declare-fun b!323873 () Bool)

(assert (=> b!323873 (= e!233305 (= (bitIndex!0 (size!9007 (buf!8149 (_2!13499 (increaseBitIndex!0 thiss!1793)))) (currentByte!15026 (_2!13499 (increaseBitIndex!0 thiss!1793))) (currentBit!15021 (_2!13499 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!446342 lt!446337)))))

(assert (=> b!323873 (or (not (= (bvand lt!446342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446337 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446342 lt!446337) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323873 (= lt!446337 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!323873 (= lt!446342 (bitIndex!0 (size!9007 (buf!8149 thiss!1793)) (currentByte!15026 thiss!1793) (currentBit!15021 thiss!1793)))))

(declare-fun lt!446340 () Bool)

(assert (=> b!323873 (= lt!446340 (not (= (bvand ((_ sign_extend 24) (select (arr!10099 (buf!8149 thiss!1793)) (currentByte!15026 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15021 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446339 () Bool)

(assert (=> b!323873 (= lt!446339 (not (= (bvand ((_ sign_extend 24) (select (arr!10099 (buf!8149 thiss!1793)) (currentByte!15026 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15021 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446338 () Bool)

(assert (=> b!323873 (= lt!446338 (not (= (bvand ((_ sign_extend 24) (select (arr!10099 (buf!8149 thiss!1793)) (currentByte!15026 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15021 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!106136 res!265877) b!323873))

(declare-fun m!461861 () Bool)

(assert (=> d!106136 m!461861))

(declare-fun m!461863 () Bool)

(assert (=> d!106136 m!461863))

(declare-fun m!461865 () Bool)

(assert (=> d!106136 m!461865))

(declare-fun m!461867 () Bool)

(assert (=> d!106136 m!461867))

(declare-fun m!461869 () Bool)

(assert (=> b!323873 m!461869))

(assert (=> b!323873 m!461863))

(assert (=> b!323873 m!461865))

(assert (=> b!323873 m!461757))

(assert (=> b!323873 m!461861))

(assert (=> b!323740 d!106136))

(declare-fun d!106156 () Bool)

(assert (=> d!106156 (= (onesLSBLong!0 nBits!548) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!548))))))

(assert (=> b!323745 d!106156))

(declare-fun d!106158 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106158 (= (inv!12 thiss!1793) (invariant!0 (currentBit!15021 thiss!1793) (currentByte!15026 thiss!1793) (size!9007 (buf!8149 thiss!1793))))))

(declare-fun bs!27965 () Bool)

(assert (= bs!27965 d!106158))

(declare-fun m!461871 () Bool)

(assert (=> bs!27965 m!461871))

(assert (=> start!72200 d!106158))

(declare-fun d!106160 () Bool)

(declare-fun e!233314 () Bool)

(assert (=> d!106160 e!233314))

(declare-fun res!265892 () Bool)

(assert (=> d!106160 (=> (not res!265892) (not e!233314))))

(declare-fun lt!446370 () (_ BitVec 64))

(declare-fun lt!446373 () (_ BitVec 64))

(declare-fun lt!446375 () (_ BitVec 64))

(assert (=> d!106160 (= res!265892 (= lt!446370 (bvsub lt!446373 lt!446375)))))

(assert (=> d!106160 (or (= (bvand lt!446373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446375 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446373 lt!446375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106160 (= lt!446375 (remainingBits!0 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13489 lt!446187)))) ((_ sign_extend 32) (currentByte!15026 (_2!13489 lt!446187))) ((_ sign_extend 32) (currentBit!15021 (_2!13489 lt!446187)))))))

(declare-fun lt!446374 () (_ BitVec 64))

(declare-fun lt!446372 () (_ BitVec 64))

(assert (=> d!106160 (= lt!446373 (bvmul lt!446374 lt!446372))))

(assert (=> d!106160 (or (= lt!446374 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446372 (bvsdiv (bvmul lt!446374 lt!446372) lt!446374)))))

(assert (=> d!106160 (= lt!446372 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106160 (= lt!446374 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13489 lt!446187)))))))

(assert (=> d!106160 (= lt!446370 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15026 (_2!13489 lt!446187))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15021 (_2!13489 lt!446187)))))))

(assert (=> d!106160 (invariant!0 (currentBit!15021 (_2!13489 lt!446187)) (currentByte!15026 (_2!13489 lt!446187)) (size!9007 (buf!8149 (_2!13489 lt!446187))))))

(assert (=> d!106160 (= (bitIndex!0 (size!9007 (buf!8149 (_2!13489 lt!446187))) (currentByte!15026 (_2!13489 lt!446187)) (currentBit!15021 (_2!13489 lt!446187))) lt!446370)))

(declare-fun b!323892 () Bool)

(declare-fun res!265893 () Bool)

(assert (=> b!323892 (=> (not res!265893) (not e!233314))))

(assert (=> b!323892 (= res!265893 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446370))))

(declare-fun b!323893 () Bool)

(declare-fun lt!446371 () (_ BitVec 64))

(assert (=> b!323893 (= e!233314 (bvsle lt!446370 (bvmul lt!446371 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323893 (or (= lt!446371 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446371 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446371)))))

(assert (=> b!323893 (= lt!446371 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13489 lt!446187)))))))

(assert (= (and d!106160 res!265892) b!323892))

(assert (= (and b!323892 res!265893) b!323893))

(declare-fun m!461873 () Bool)

(assert (=> d!106160 m!461873))

(declare-fun m!461875 () Bool)

(assert (=> d!106160 m!461875))

(assert (=> b!323749 d!106160))

(declare-fun d!106162 () Bool)

(declare-fun e!233315 () Bool)

(assert (=> d!106162 e!233315))

(declare-fun res!265894 () Bool)

(assert (=> d!106162 (=> (not res!265894) (not e!233315))))

(declare-fun lt!446376 () (_ BitVec 64))

(declare-fun lt!446379 () (_ BitVec 64))

(declare-fun lt!446381 () (_ BitVec 64))

(assert (=> d!106162 (= res!265894 (= lt!446376 (bvsub lt!446379 lt!446381)))))

(assert (=> d!106162 (or (= (bvand lt!446379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446381 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446379 lt!446381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106162 (= lt!446381 (remainingBits!0 ((_ sign_extend 32) (size!9007 (buf!8149 thiss!1793))) ((_ sign_extend 32) (currentByte!15026 thiss!1793)) ((_ sign_extend 32) (currentBit!15021 thiss!1793))))))

(declare-fun lt!446380 () (_ BitVec 64))

(declare-fun lt!446378 () (_ BitVec 64))

(assert (=> d!106162 (= lt!446379 (bvmul lt!446380 lt!446378))))

(assert (=> d!106162 (or (= lt!446380 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446378 (bvsdiv (bvmul lt!446380 lt!446378) lt!446380)))))

(assert (=> d!106162 (= lt!446378 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106162 (= lt!446380 ((_ sign_extend 32) (size!9007 (buf!8149 thiss!1793))))))

(assert (=> d!106162 (= lt!446376 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15026 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15021 thiss!1793))))))

(assert (=> d!106162 (invariant!0 (currentBit!15021 thiss!1793) (currentByte!15026 thiss!1793) (size!9007 (buf!8149 thiss!1793)))))

(assert (=> d!106162 (= (bitIndex!0 (size!9007 (buf!8149 thiss!1793)) (currentByte!15026 thiss!1793) (currentBit!15021 thiss!1793)) lt!446376)))

(declare-fun b!323894 () Bool)

(declare-fun res!265895 () Bool)

(assert (=> b!323894 (=> (not res!265895) (not e!233315))))

(assert (=> b!323894 (= res!265895 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446376))))

(declare-fun b!323895 () Bool)

(declare-fun lt!446377 () (_ BitVec 64))

(assert (=> b!323895 (= e!233315 (bvsle lt!446376 (bvmul lt!446377 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323895 (or (= lt!446377 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446377 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446377)))))

(assert (=> b!323895 (= lt!446377 ((_ sign_extend 32) (size!9007 (buf!8149 thiss!1793))))))

(assert (= (and d!106162 res!265894) b!323894))

(assert (= (and b!323894 res!265895) b!323895))

(declare-fun m!461877 () Bool)

(assert (=> d!106162 m!461877))

(assert (=> d!106162 m!461871))

(assert (=> b!323749 d!106162))

(declare-fun d!106164 () Bool)

(declare-fun lt!446390 () tuple2!23722)

(assert (=> d!106164 (= lt!446390 (readBit!0 thiss!1793))))

(assert (=> d!106164 (= (readBitPure!0 thiss!1793) (tuple2!23725 (_2!13490 lt!446390) (_1!13490 lt!446390)))))

(declare-fun bs!27967 () Bool)

(assert (= bs!27967 d!106164))

(assert (=> bs!27967 m!461765))

(assert (=> b!323743 d!106164))

(declare-fun d!106166 () Bool)

(assert (=> d!106166 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!323742 d!106166))

(declare-fun d!106170 () Bool)

(assert (=> d!106170 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!9007 (buf!8149 thiss!1793))) ((_ sign_extend 32) (currentByte!15026 thiss!1793)) ((_ sign_extend 32) (currentBit!15021 thiss!1793)) lt!446186) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9007 (buf!8149 thiss!1793))) ((_ sign_extend 32) (currentByte!15026 thiss!1793)) ((_ sign_extend 32) (currentBit!15021 thiss!1793))) lt!446186))))

(declare-fun bs!27968 () Bool)

(assert (= bs!27968 d!106170))

(assert (=> bs!27968 m!461877))

(assert (=> b!323747 d!106170))

(push 1)

(assert (not b!323855))

(assert (not b!323859))

(assert (not b!323858))

(assert (not d!106164))

(assert (not d!106170))

(assert (not d!106160))

(assert (not b!323854))

(assert (not d!106162))

(assert (not b!323873))

(assert (not d!106158))

(assert (not b!323856))

(assert (not d!106136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106226 () Bool)

(assert (=> d!106226 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)))))))

(assert (=> b!323859 d!106226))

(declare-fun d!106228 () Bool)

(declare-fun e!233346 () Bool)

(assert (=> d!106228 e!233346))

(declare-fun res!265940 () Bool)

(assert (=> d!106228 (=> (not res!265940) (not e!233346))))

(assert (=> d!106228 (= res!265940 (= (buf!8149 (_2!13499 (increaseBitIndex!0 (_2!13490 lt!446189)))) (buf!8149 (_2!13490 lt!446189))))))

(declare-fun lt!446511 () Bool)

(assert (=> d!106228 (= lt!446511 (not (= (bvand ((_ sign_extend 24) (select (arr!10099 (buf!8149 (_2!13490 lt!446189))) (currentByte!15026 (_2!13490 lt!446189)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15021 (_2!13490 lt!446189))))) #b00000000000000000000000000000000)))))

(declare-fun lt!446506 () tuple2!23722)

(assert (=> d!106228 (= lt!446506 (tuple2!23723 (not (= (bvand ((_ sign_extend 24) (select (arr!10099 (buf!8149 (_2!13490 lt!446189))) (currentByte!15026 (_2!13490 lt!446189)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15021 (_2!13490 lt!446189))))) #b00000000000000000000000000000000)) (_2!13499 (increaseBitIndex!0 (_2!13490 lt!446189)))))))

(assert (=> d!106228 (validate_offset_bit!0 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13490 lt!446189)))) ((_ sign_extend 32) (currentByte!15026 (_2!13490 lt!446189))) ((_ sign_extend 32) (currentBit!15021 (_2!13490 lt!446189))))))

(assert (=> d!106228 (= (readBit!0 (_2!13490 lt!446189)) lt!446506)))

(declare-fun lt!446512 () (_ BitVec 64))

(declare-fun b!323946 () Bool)

(declare-fun lt!446507 () (_ BitVec 64))

(assert (=> b!323946 (= e!233346 (= (bitIndex!0 (size!9007 (buf!8149 (_2!13499 (increaseBitIndex!0 (_2!13490 lt!446189))))) (currentByte!15026 (_2!13499 (increaseBitIndex!0 (_2!13490 lt!446189)))) (currentBit!15021 (_2!13499 (increaseBitIndex!0 (_2!13490 lt!446189))))) (bvadd lt!446512 lt!446507)))))

(assert (=> b!323946 (or (not (= (bvand lt!446512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446507 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446512 lt!446507) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323946 (= lt!446507 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!323946 (= lt!446512 (bitIndex!0 (size!9007 (buf!8149 (_2!13490 lt!446189))) (currentByte!15026 (_2!13490 lt!446189)) (currentBit!15021 (_2!13490 lt!446189))))))

(declare-fun lt!446510 () Bool)

(assert (=> b!323946 (= lt!446510 (not (= (bvand ((_ sign_extend 24) (select (arr!10099 (buf!8149 (_2!13490 lt!446189))) (currentByte!15026 (_2!13490 lt!446189)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15021 (_2!13490 lt!446189))))) #b00000000000000000000000000000000)))))

(declare-fun lt!446509 () Bool)

(assert (=> b!323946 (= lt!446509 (not (= (bvand ((_ sign_extend 24) (select (arr!10099 (buf!8149 (_2!13490 lt!446189))) (currentByte!15026 (_2!13490 lt!446189)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15021 (_2!13490 lt!446189))))) #b00000000000000000000000000000000)))))

(declare-fun lt!446508 () Bool)

(assert (=> b!323946 (= lt!446508 (not (= (bvand ((_ sign_extend 24) (select (arr!10099 (buf!8149 (_2!13490 lt!446189))) (currentByte!15026 (_2!13490 lt!446189)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15021 (_2!13490 lt!446189))))) #b00000000000000000000000000000000)))))

(assert (= (and d!106228 res!265940) b!323946))

(declare-fun m!461977 () Bool)

(assert (=> d!106228 m!461977))

(declare-fun m!461979 () Bool)

(assert (=> d!106228 m!461979))

(declare-fun m!461981 () Bool)

(assert (=> d!106228 m!461981))

(declare-fun m!461983 () Bool)

(assert (=> d!106228 m!461983))

(declare-fun m!461985 () Bool)

(assert (=> b!323946 m!461985))

(assert (=> b!323946 m!461979))

(assert (=> b!323946 m!461981))

(assert (=> b!323946 m!461835))

(assert (=> b!323946 m!461977))

(assert (=> b!323858 d!106228))

(declare-fun b!323947 () Bool)

(declare-fun e!233347 () Bool)

(declare-fun e!233349 () Bool)

(assert (=> b!323947 (= e!233347 e!233349)))

(declare-fun res!265942 () Bool)

(assert (=> b!323947 (=> res!265942 e!233349)))

(assert (=> b!323947 (= res!265942 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) nBits!548)))))

(declare-fun d!106230 () Bool)

(assert (=> d!106230 e!233347))

(declare-fun res!265943 () Bool)

(assert (=> d!106230 (=> (not res!265943) (not e!233347))))

(declare-fun lt!446513 () tuple2!23720)

(assert (=> d!106230 (= res!265943 (= (buf!8149 (_2!13489 lt!446513)) (buf!8149 (_2!13490 lt!446271))))))

(declare-fun e!233348 () tuple2!23720)

(assert (=> d!106230 (= lt!446513 e!233348)))

(declare-fun c!15463 () Bool)

(assert (=> d!106230 (= c!15463 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)))))

(assert (=> d!106230 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!106230 (= (readNBitsLSBFirstsLoop!0 (_2!13490 lt!446271) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13490 lt!446189) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13490 lt!446271) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!446513)))

(declare-fun b!323948 () Bool)

(declare-fun res!265944 () Bool)

(assert (=> b!323948 (=> (not res!265944) (not e!233347))))

(assert (=> b!323948 (= res!265944 (= (bvand (_1!13489 lt!446513) (onesLSBLong!0 nBits!548)) (_1!13489 lt!446513)))))

(declare-fun b!323949 () Bool)

(declare-fun lt!446517 () (_ BitVec 64))

(assert (=> b!323949 (= e!233349 (= (= (bvand (bvlshr (_1!13489 lt!446513) lt!446517) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13491 (readBitPure!0 (_2!13490 lt!446271)))))))

(assert (=> b!323949 (and (bvsge lt!446517 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!446517 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!323949 (= lt!446517 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)))))

(declare-fun b!323950 () Bool)

(declare-fun res!265945 () Bool)

(assert (=> b!323950 (=> (not res!265945) (not e!233347))))

(declare-fun lt!446515 () (_ BitVec 64))

(declare-fun lt!446514 () (_ BitVec 64))

(assert (=> b!323950 (= res!265945 (= (bitIndex!0 (size!9007 (buf!8149 (_2!13489 lt!446513))) (currentByte!15026 (_2!13489 lt!446513)) (currentBit!15021 (_2!13489 lt!446513))) (bvadd lt!446515 lt!446514)))))

(assert (=> b!323950 (or (not (= (bvand lt!446515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446514 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446515 lt!446514) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323950 (= lt!446514 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001))))))

(assert (=> b!323950 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!323950 (= lt!446515 (bitIndex!0 (size!9007 (buf!8149 (_2!13490 lt!446271))) (currentByte!15026 (_2!13490 lt!446271)) (currentBit!15021 (_2!13490 lt!446271))))))

(declare-fun b!323951 () Bool)

(assert (=> b!323951 (= e!233348 (tuple2!23721 (bvor (bvor acc!161 (ite (_1!13490 lt!446189) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13490 lt!446271) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13490 lt!446271)))))

(declare-fun b!323952 () Bool)

(declare-fun lt!446518 () tuple2!23720)

(assert (=> b!323952 (= e!233348 (tuple2!23721 (_1!13489 lt!446518) (_2!13489 lt!446518)))))

(declare-fun lt!446516 () tuple2!23722)

(assert (=> b!323952 (= lt!446516 (readBit!0 (_2!13490 lt!446271)))))

(assert (=> b!323952 (= lt!446518 (readNBitsLSBFirstsLoop!0 (_2!13490 lt!446516) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor (bvor acc!161 (ite (_1!13490 lt!446189) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13490 lt!446271) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13490 lt!446516) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!323953 () Bool)

(declare-fun res!265941 () Bool)

(assert (=> b!323953 (=> (not res!265941) (not e!233347))))

(assert (=> b!323953 (= res!265941 (= (bvand (_1!13489 lt!446513) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001))) (bvand (bvor (bvor acc!161 (ite (_1!13490 lt!446189) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13490 lt!446271) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)))))))

(assert (= (and d!106230 c!15463) b!323951))

(assert (= (and d!106230 (not c!15463)) b!323952))

(assert (= (and d!106230 res!265943) b!323950))

(assert (= (and b!323950 res!265945) b!323953))

(assert (= (and b!323953 res!265941) b!323948))

(assert (= (and b!323948 res!265944) b!323947))

(assert (= (and b!323947 (not res!265942)) b!323949))

(declare-fun m!461987 () Bool)

(assert (=> b!323950 m!461987))

(declare-fun m!461989 () Bool)

(assert (=> b!323950 m!461989))

(declare-fun m!461991 () Bool)

(assert (=> b!323949 m!461991))

(assert (=> b!323948 m!461759))

(declare-fun m!461993 () Bool)

(assert (=> b!323952 m!461993))

(declare-fun m!461995 () Bool)

(assert (=> b!323952 m!461995))

(declare-fun m!461997 () Bool)

(assert (=> b!323953 m!461997))

(assert (=> b!323858 d!106230))

(declare-fun d!106232 () Bool)

(declare-fun e!233350 () Bool)

(assert (=> d!106232 e!233350))

(declare-fun res!265946 () Bool)

(assert (=> d!106232 (=> (not res!265946) (not e!233350))))

(declare-fun lt!446522 () (_ BitVec 64))

(declare-fun lt!446524 () (_ BitVec 64))

(declare-fun lt!446519 () (_ BitVec 64))

(assert (=> d!106232 (= res!265946 (= lt!446519 (bvsub lt!446522 lt!446524)))))

(assert (=> d!106232 (or (= (bvand lt!446522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446524 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446522 lt!446524) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106232 (= lt!446524 (remainingBits!0 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13499 (increaseBitIndex!0 thiss!1793))))) ((_ sign_extend 32) (currentByte!15026 (_2!13499 (increaseBitIndex!0 thiss!1793)))) ((_ sign_extend 32) (currentBit!15021 (_2!13499 (increaseBitIndex!0 thiss!1793))))))))

(declare-fun lt!446523 () (_ BitVec 64))

(declare-fun lt!446521 () (_ BitVec 64))

(assert (=> d!106232 (= lt!446522 (bvmul lt!446523 lt!446521))))

(assert (=> d!106232 (or (= lt!446523 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446521 (bvsdiv (bvmul lt!446523 lt!446521) lt!446523)))))

(assert (=> d!106232 (= lt!446521 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106232 (= lt!446523 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13499 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!106232 (= lt!446519 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15026 (_2!13499 (increaseBitIndex!0 thiss!1793)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15021 (_2!13499 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!106232 (invariant!0 (currentBit!15021 (_2!13499 (increaseBitIndex!0 thiss!1793))) (currentByte!15026 (_2!13499 (increaseBitIndex!0 thiss!1793))) (size!9007 (buf!8149 (_2!13499 (increaseBitIndex!0 thiss!1793)))))))

(assert (=> d!106232 (= (bitIndex!0 (size!9007 (buf!8149 (_2!13499 (increaseBitIndex!0 thiss!1793)))) (currentByte!15026 (_2!13499 (increaseBitIndex!0 thiss!1793))) (currentBit!15021 (_2!13499 (increaseBitIndex!0 thiss!1793)))) lt!446519)))

(declare-fun b!323954 () Bool)

(declare-fun res!265947 () Bool)

(assert (=> b!323954 (=> (not res!265947) (not e!233350))))

(assert (=> b!323954 (= res!265947 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446519))))

(declare-fun b!323955 () Bool)

(declare-fun lt!446520 () (_ BitVec 64))

(assert (=> b!323955 (= e!233350 (bvsle lt!446519 (bvmul lt!446520 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323955 (or (= lt!446520 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446520 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446520)))))

(assert (=> b!323955 (= lt!446520 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13499 (increaseBitIndex!0 thiss!1793))))))))

(assert (= (and d!106232 res!265946) b!323954))

(assert (= (and b!323954 res!265947) b!323955))

(declare-fun m!461999 () Bool)

(assert (=> d!106232 m!461999))

(declare-fun m!462001 () Bool)

(assert (=> d!106232 m!462001))

(assert (=> b!323873 d!106232))

(declare-fun d!106234 () Bool)

(declare-fun e!233353 () Bool)

(assert (=> d!106234 e!233353))

(declare-fun res!265953 () Bool)

(assert (=> d!106234 (=> (not res!265953) (not e!233353))))

(declare-fun lt!446539 () (_ BitVec 64))

(declare-fun lt!446537 () tuple2!23740)

(declare-fun lt!446535 () (_ BitVec 64))

(assert (=> d!106234 (= res!265953 (= (bvadd lt!446535 lt!446539) (bitIndex!0 (size!9007 (buf!8149 (_2!13499 lt!446537))) (currentByte!15026 (_2!13499 lt!446537)) (currentBit!15021 (_2!13499 lt!446537)))))))

(assert (=> d!106234 (or (not (= (bvand lt!446535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446539 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446535 lt!446539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106234 (= lt!446539 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106234 (= lt!446535 (bitIndex!0 (size!9007 (buf!8149 thiss!1793)) (currentByte!15026 thiss!1793) (currentBit!15021 thiss!1793)))))

(declare-fun Unit!22054 () Unit!22046)

(declare-fun Unit!22055 () Unit!22046)

(assert (=> d!106234 (= lt!446537 (ite (bvslt (currentBit!15021 thiss!1793) #b00000000000000000000000000000111) (tuple2!23741 Unit!22054 (BitStream!14177 (buf!8149 thiss!1793) (currentByte!15026 thiss!1793) (bvadd (currentBit!15021 thiss!1793) #b00000000000000000000000000000001))) (tuple2!23741 Unit!22055 (BitStream!14177 (buf!8149 thiss!1793) (bvadd (currentByte!15026 thiss!1793) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!106234 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9007 (buf!8149 thiss!1793))) ((_ sign_extend 32) (currentByte!15026 thiss!1793)) ((_ sign_extend 32) (currentBit!15021 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!106234 (= (increaseBitIndex!0 thiss!1793) lt!446537)))

(declare-fun b!323960 () Bool)

(declare-fun res!265952 () Bool)

(assert (=> b!323960 (=> (not res!265952) (not e!233353))))

(declare-fun lt!446536 () (_ BitVec 64))

(declare-fun lt!446538 () (_ BitVec 64))

(assert (=> b!323960 (= res!265952 (= (bvsub lt!446536 lt!446538) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!323960 (or (= (bvand lt!446536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446538 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446536 lt!446538) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323960 (= lt!446538 (remainingBits!0 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13499 lt!446537)))) ((_ sign_extend 32) (currentByte!15026 (_2!13499 lt!446537))) ((_ sign_extend 32) (currentBit!15021 (_2!13499 lt!446537)))))))

(assert (=> b!323960 (= lt!446536 (remainingBits!0 ((_ sign_extend 32) (size!9007 (buf!8149 thiss!1793))) ((_ sign_extend 32) (currentByte!15026 thiss!1793)) ((_ sign_extend 32) (currentBit!15021 thiss!1793))))))

(declare-fun b!323961 () Bool)

(assert (=> b!323961 (= e!233353 (= (size!9007 (buf!8149 thiss!1793)) (size!9007 (buf!8149 (_2!13499 lt!446537)))))))

(assert (= (and d!106234 res!265953) b!323960))

(assert (= (and b!323960 res!265952) b!323961))

(declare-fun m!462003 () Bool)

(assert (=> d!106234 m!462003))

(assert (=> d!106234 m!461757))

(assert (=> d!106234 m!461877))

(declare-fun m!462005 () Bool)

(assert (=> b!323960 m!462005))

(assert (=> b!323960 m!461877))

(assert (=> b!323873 d!106234))

(assert (=> b!323873 d!106162))

(assert (=> d!106164 d!106136))

(declare-fun d!106236 () Bool)

(declare-fun e!233354 () Bool)

(assert (=> d!106236 e!233354))

(declare-fun res!265954 () Bool)

(assert (=> d!106236 (=> (not res!265954) (not e!233354))))

(declare-fun lt!446545 () (_ BitVec 64))

(declare-fun lt!446540 () (_ BitVec 64))

(declare-fun lt!446543 () (_ BitVec 64))

(assert (=> d!106236 (= res!265954 (= lt!446540 (bvsub lt!446543 lt!446545)))))

(assert (=> d!106236 (or (= (bvand lt!446543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446545 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446543 lt!446545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106236 (= lt!446545 (remainingBits!0 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13489 lt!446268)))) ((_ sign_extend 32) (currentByte!15026 (_2!13489 lt!446268))) ((_ sign_extend 32) (currentBit!15021 (_2!13489 lt!446268)))))))

(declare-fun lt!446544 () (_ BitVec 64))

(declare-fun lt!446542 () (_ BitVec 64))

(assert (=> d!106236 (= lt!446543 (bvmul lt!446544 lt!446542))))

(assert (=> d!106236 (or (= lt!446544 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446542 (bvsdiv (bvmul lt!446544 lt!446542) lt!446544)))))

(assert (=> d!106236 (= lt!446542 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106236 (= lt!446544 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13489 lt!446268)))))))

(assert (=> d!106236 (= lt!446540 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15026 (_2!13489 lt!446268))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15021 (_2!13489 lt!446268)))))))

(assert (=> d!106236 (invariant!0 (currentBit!15021 (_2!13489 lt!446268)) (currentByte!15026 (_2!13489 lt!446268)) (size!9007 (buf!8149 (_2!13489 lt!446268))))))

(assert (=> d!106236 (= (bitIndex!0 (size!9007 (buf!8149 (_2!13489 lt!446268))) (currentByte!15026 (_2!13489 lt!446268)) (currentBit!15021 (_2!13489 lt!446268))) lt!446540)))

(declare-fun b!323962 () Bool)

(declare-fun res!265955 () Bool)

(assert (=> b!323962 (=> (not res!265955) (not e!233354))))

(assert (=> b!323962 (= res!265955 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446540))))

(declare-fun b!323963 () Bool)

(declare-fun lt!446541 () (_ BitVec 64))

(assert (=> b!323963 (= e!233354 (bvsle lt!446540 (bvmul lt!446541 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323963 (or (= lt!446541 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446541 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446541)))))

(assert (=> b!323963 (= lt!446541 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13489 lt!446268)))))))

(assert (= (and d!106236 res!265954) b!323962))

(assert (= (and b!323962 res!265955) b!323963))

(declare-fun m!462007 () Bool)

(assert (=> d!106236 m!462007))

(declare-fun m!462009 () Bool)

(assert (=> d!106236 m!462009))

(assert (=> b!323856 d!106236))

(declare-fun d!106238 () Bool)

(declare-fun e!233355 () Bool)

(assert (=> d!106238 e!233355))

(declare-fun res!265956 () Bool)

(assert (=> d!106238 (=> (not res!265956) (not e!233355))))

(declare-fun lt!446549 () (_ BitVec 64))

(declare-fun lt!446551 () (_ BitVec 64))

(declare-fun lt!446546 () (_ BitVec 64))

(assert (=> d!106238 (= res!265956 (= lt!446546 (bvsub lt!446549 lt!446551)))))

(assert (=> d!106238 (or (= (bvand lt!446549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446551 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446549 lt!446551) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106238 (= lt!446551 (remainingBits!0 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13490 lt!446189)))) ((_ sign_extend 32) (currentByte!15026 (_2!13490 lt!446189))) ((_ sign_extend 32) (currentBit!15021 (_2!13490 lt!446189)))))))

(declare-fun lt!446550 () (_ BitVec 64))

(declare-fun lt!446548 () (_ BitVec 64))

(assert (=> d!106238 (= lt!446549 (bvmul lt!446550 lt!446548))))

(assert (=> d!106238 (or (= lt!446550 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446548 (bvsdiv (bvmul lt!446550 lt!446548) lt!446550)))))

(assert (=> d!106238 (= lt!446548 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106238 (= lt!446550 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13490 lt!446189)))))))

(assert (=> d!106238 (= lt!446546 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15026 (_2!13490 lt!446189))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15021 (_2!13490 lt!446189)))))))

(assert (=> d!106238 (invariant!0 (currentBit!15021 (_2!13490 lt!446189)) (currentByte!15026 (_2!13490 lt!446189)) (size!9007 (buf!8149 (_2!13490 lt!446189))))))

(assert (=> d!106238 (= (bitIndex!0 (size!9007 (buf!8149 (_2!13490 lt!446189))) (currentByte!15026 (_2!13490 lt!446189)) (currentBit!15021 (_2!13490 lt!446189))) lt!446546)))

(declare-fun b!323964 () Bool)

(declare-fun res!265957 () Bool)

(assert (=> b!323964 (=> (not res!265957) (not e!233355))))

(assert (=> b!323964 (= res!265957 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446546))))

(declare-fun b!323965 () Bool)

(declare-fun lt!446547 () (_ BitVec 64))

(assert (=> b!323965 (= e!233355 (bvsle lt!446546 (bvmul lt!446547 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323965 (or (= lt!446547 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446547 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446547)))))

(assert (=> b!323965 (= lt!446547 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13490 lt!446189)))))))

(assert (= (and d!106238 res!265956) b!323964))

(assert (= (and b!323964 res!265957) b!323965))

(declare-fun m!462011 () Bool)

(assert (=> d!106238 m!462011))

(declare-fun m!462013 () Bool)

(assert (=> d!106238 m!462013))

(assert (=> b!323856 d!106238))

(declare-fun d!106240 () Bool)

(declare-fun lt!446552 () tuple2!23722)

(assert (=> d!106240 (= lt!446552 (readBit!0 (_2!13490 lt!446189)))))

(assert (=> d!106240 (= (readBitPure!0 (_2!13490 lt!446189)) (tuple2!23725 (_2!13490 lt!446552) (_1!13490 lt!446552)))))

(declare-fun bs!27973 () Bool)

(assert (= bs!27973 d!106240))

(assert (=> bs!27973 m!461839))

(assert (=> b!323855 d!106240))

(assert (=> b!323854 d!106156))

(declare-fun d!106242 () Bool)

(assert (=> d!106242 (= (remainingBits!0 ((_ sign_extend 32) (size!9007 (buf!8149 thiss!1793))) ((_ sign_extend 32) (currentByte!15026 thiss!1793)) ((_ sign_extend 32) (currentBit!15021 thiss!1793))) (bvsub (bvmul ((_ sign_extend 32) (size!9007 (buf!8149 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15026 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15021 thiss!1793)))))))

(assert (=> d!106170 d!106242))

(assert (=> d!106162 d!106242))

(declare-fun d!106244 () Bool)

(assert (=> d!106244 (= (invariant!0 (currentBit!15021 thiss!1793) (currentByte!15026 thiss!1793) (size!9007 (buf!8149 thiss!1793))) (and (bvsge (currentBit!15021 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!15021 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!15026 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!15026 thiss!1793) (size!9007 (buf!8149 thiss!1793))) (and (= (currentBit!15021 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!15026 thiss!1793) (size!9007 (buf!8149 thiss!1793)))))))))

(assert (=> d!106162 d!106244))

(declare-fun d!106246 () Bool)

(assert (=> d!106246 (= (remainingBits!0 ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13489 lt!446187)))) ((_ sign_extend 32) (currentByte!15026 (_2!13489 lt!446187))) ((_ sign_extend 32) (currentBit!15021 (_2!13489 lt!446187)))) (bvsub (bvmul ((_ sign_extend 32) (size!9007 (buf!8149 (_2!13489 lt!446187)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15026 (_2!13489 lt!446187))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15021 (_2!13489 lt!446187))))))))

(assert (=> d!106160 d!106246))

(declare-fun d!106248 () Bool)

(assert (=> d!106248 (= (invariant!0 (currentBit!15021 (_2!13489 lt!446187)) (currentByte!15026 (_2!13489 lt!446187)) (size!9007 (buf!8149 (_2!13489 lt!446187)))) (and (bvsge (currentBit!15021 (_2!13489 lt!446187)) #b00000000000000000000000000000000) (bvslt (currentBit!15021 (_2!13489 lt!446187)) #b00000000000000000000000000001000) (bvsge (currentByte!15026 (_2!13489 lt!446187)) #b00000000000000000000000000000000) (or (bvslt (currentByte!15026 (_2!13489 lt!446187)) (size!9007 (buf!8149 (_2!13489 lt!446187)))) (and (= (currentBit!15021 (_2!13489 lt!446187)) #b00000000000000000000000000000000) (= (currentByte!15026 (_2!13489 lt!446187)) (size!9007 (buf!8149 (_2!13489 lt!446187))))))))))

(assert (=> d!106160 d!106248))

(assert (=> d!106136 d!106234))

(declare-fun d!106250 () Bool)

(assert (=> d!106250 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9007 (buf!8149 thiss!1793))) ((_ sign_extend 32) (currentByte!15026 thiss!1793)) ((_ sign_extend 32) (currentBit!15021 thiss!1793))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9007 (buf!8149 thiss!1793))) ((_ sign_extend 32) (currentByte!15026 thiss!1793)) ((_ sign_extend 32) (currentBit!15021 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27974 () Bool)

(assert (= bs!27974 d!106250))

(assert (=> bs!27974 m!461877))

(assert (=> d!106136 d!106250))

(assert (=> d!106158 d!106244))

(push 1)

(assert (not b!323953))

(assert (not d!106232))

(assert (not b!323960))

(assert (not d!106236))

(assert (not b!323946))

(assert (not b!323949))

(assert (not b!323950))

(assert (not d!106238))

(assert (not d!106250))

(assert (not d!106234))

(assert (not b!323952))

(assert (not d!106240))

(assert (not b!323948))

(assert (not d!106228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

