; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36726 () Bool)

(assert start!36726)

(declare-fun lt!261670 () (_ BitVec 32))

(declare-datatypes ((array!8759 0))(
  ( (array!8760 (arr!4808 (Array (_ BitVec 32) (_ BitVec 8))) (size!3887 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6930 0))(
  ( (BitStream!6931 (buf!4339 array!8759) (currentByte!8215 (_ BitVec 32)) (currentBit!8210 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6930)

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((Unit!11711 0))(
  ( (Unit!11712) )
))
(declare-datatypes ((tuple3!956 0))(
  ( (tuple3!957 (_1!7923 Unit!11711) (_2!7923 (_ BitVec 8)) (_3!604 BitStream!6930)) )
))
(declare-fun e!116996 () tuple3!956)

(declare-fun b!168397 () Bool)

(declare-fun Unit!11713 () Unit!11711)

(assert (=> b!168397 (= e!116996 (tuple3!957 Unit!11713 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4808 (buf!4339 thiss!1894)) (currentByte!8215 thiss!1894))) lt!261670))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4808 (buf!4339 thiss!1894)) (bvadd #b00000000000000000000000000000001 (currentByte!8215 thiss!1894)))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!261670))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (BitStream!6931 (buf!4339 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8215 thiss!1894)) lt!261670)))))

(assert (=> b!168397 (= lt!261670 (bvsub (bvadd (currentBit!8210 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168398 () Bool)

(declare-fun e!116995 () Bool)

(declare-fun lt!261669 () tuple3!956)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168398 (= e!116995 (not (invariant!0 (currentBit!8210 (_3!604 lt!261669)) (currentByte!8215 (_3!604 lt!261669)) (size!3887 (buf!4339 (_3!604 lt!261669))))))))

(declare-fun res!140146 () Bool)

(declare-fun e!116993 () Bool)

(assert (=> start!36726 (=> (not res!140146) (not e!116993))))

(assert (=> start!36726 (= res!140146 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36726 e!116993))

(assert (=> start!36726 true))

(declare-fun e!116997 () Bool)

(declare-fun inv!12 (BitStream!6930) Bool)

(assert (=> start!36726 (and (inv!12 thiss!1894) e!116997)))

(declare-fun b!168399 () Bool)

(declare-fun array_inv!3628 (array!8759) Bool)

(assert (=> b!168399 (= e!116997 (array_inv!3628 (buf!4339 thiss!1894)))))

(declare-fun b!168400 () Bool)

(assert (=> b!168400 (= e!116993 e!116995)))

(declare-fun res!140147 () Bool)

(assert (=> b!168400 (=> (not res!140147) (not e!116995))))

(assert (=> b!168400 (= res!140147 (= (buf!4339 (_3!604 lt!261669)) (buf!4339 thiss!1894)))))

(assert (=> b!168400 (= lt!261669 e!116996)))

(declare-fun c!8693 () Bool)

(assert (=> b!168400 (= c!8693 (bvsle (bvadd (currentBit!8210 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168401 () Bool)

(declare-fun res!140145 () Bool)

(assert (=> b!168401 (=> (not res!140145) (not e!116993))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168401 (= res!140145 (validate_offset_bits!1 ((_ sign_extend 32) (size!3887 (buf!4339 thiss!1894))) ((_ sign_extend 32) (currentByte!8215 thiss!1894)) ((_ sign_extend 32) (currentBit!8210 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168402 () Bool)

(declare-datatypes ((tuple2!14638 0))(
  ( (tuple2!14639 (_1!7924 Unit!11711) (_2!7924 BitStream!6930)) )
))
(declare-fun lt!261668 () tuple2!14638)

(assert (=> b!168402 (= e!116996 (tuple3!957 (_1!7924 lt!261668) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4808 (buf!4339 thiss!1894)) (currentByte!8215 thiss!1894))) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8210 thiss!1894) nBits!600))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (_2!7924 lt!261668)))))

(declare-fun moveBitIndex!0 (BitStream!6930 (_ BitVec 64)) tuple2!14638)

(assert (=> b!168402 (= lt!261668 (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(assert (= (and start!36726 res!140146) b!168401))

(assert (= (and b!168401 res!140145) b!168400))

(assert (= (and b!168400 c!8693) b!168402))

(assert (= (and b!168400 (not c!8693)) b!168397))

(assert (= (and b!168400 res!140147) b!168398))

(assert (= start!36726 b!168399))

(declare-fun m!267997 () Bool)

(assert (=> b!168397 m!267997))

(declare-fun m!267999 () Bool)

(assert (=> b!168397 m!267999))

(declare-fun m!268001 () Bool)

(assert (=> b!168397 m!268001))

(declare-fun m!268003 () Bool)

(assert (=> start!36726 m!268003))

(declare-fun m!268005 () Bool)

(assert (=> b!168401 m!268005))

(declare-fun m!268007 () Bool)

(assert (=> b!168398 m!268007))

(declare-fun m!268009 () Bool)

(assert (=> b!168399 m!268009))

(assert (=> b!168402 m!267997))

(assert (=> b!168402 m!268001))

(declare-fun m!268011 () Bool)

(assert (=> b!168402 m!268011))

(check-sat (not b!168402) (not start!36726) (not b!168399) (not b!168398) (not b!168401))
(check-sat)
(get-model)

(declare-fun d!59305 () Bool)

(assert (=> d!59305 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8210 thiss!1894) (currentByte!8215 thiss!1894) (size!3887 (buf!4339 thiss!1894))))))

(declare-fun bs!14697 () Bool)

(assert (= bs!14697 d!59305))

(declare-fun m!268035 () Bool)

(assert (=> bs!14697 m!268035))

(assert (=> start!36726 d!59305))

(declare-fun d!59311 () Bool)

(assert (=> d!59311 (= (invariant!0 (currentBit!8210 (_3!604 lt!261669)) (currentByte!8215 (_3!604 lt!261669)) (size!3887 (buf!4339 (_3!604 lt!261669)))) (and (bvsge (currentBit!8210 (_3!604 lt!261669)) #b00000000000000000000000000000000) (bvslt (currentBit!8210 (_3!604 lt!261669)) #b00000000000000000000000000001000) (bvsge (currentByte!8215 (_3!604 lt!261669)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8215 (_3!604 lt!261669)) (size!3887 (buf!4339 (_3!604 lt!261669)))) (and (= (currentBit!8210 (_3!604 lt!261669)) #b00000000000000000000000000000000) (= (currentByte!8215 (_3!604 lt!261669)) (size!3887 (buf!4339 (_3!604 lt!261669))))))))))

(assert (=> b!168398 d!59311))

(declare-fun d!59313 () Bool)

(assert (=> d!59313 (= (array_inv!3628 (buf!4339 thiss!1894)) (bvsge (size!3887 (buf!4339 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168399 d!59313))

(declare-fun d!59315 () Bool)

(declare-fun lt!261729 () (_ BitVec 32))

(assert (=> d!59315 (= lt!261729 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261731 () (_ BitVec 32))

(assert (=> d!59315 (= lt!261731 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!117030 () Bool)

(assert (=> d!59315 e!117030))

(declare-fun res!140174 () Bool)

(assert (=> d!59315 (=> (not res!140174) (not e!117030))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6930 (_ BitVec 64)) Bool)

(assert (=> d!59315 (= res!140174 (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun Unit!11723 () Unit!11711)

(declare-fun Unit!11724 () Unit!11711)

(declare-fun Unit!11725 () Unit!11711)

(assert (=> d!59315 (= (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)) (ite (bvslt (bvadd (currentBit!8210 thiss!1894) lt!261729) #b00000000000000000000000000000000) (tuple2!14639 Unit!11723 (BitStream!6931 (buf!4339 thiss!1894) (bvsub (bvadd (currentByte!8215 thiss!1894) lt!261731) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261729 (currentBit!8210 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8210 thiss!1894) lt!261729) #b00000000000000000000000000001000) (tuple2!14639 Unit!11724 (BitStream!6931 (buf!4339 thiss!1894) (bvadd (currentByte!8215 thiss!1894) lt!261731 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8210 thiss!1894) lt!261729) #b00000000000000000000000000001000))) (tuple2!14639 Unit!11725 (BitStream!6931 (buf!4339 thiss!1894) (bvadd (currentByte!8215 thiss!1894) lt!261731) (bvadd (currentBit!8210 thiss!1894) lt!261729))))))))

(declare-fun b!168437 () Bool)

(declare-fun e!117029 () Bool)

(assert (=> b!168437 (= e!117030 e!117029)))

(declare-fun res!140173 () Bool)

(assert (=> b!168437 (=> (not res!140173) (not e!117029))))

(declare-fun lt!261732 () tuple2!14638)

(declare-fun lt!261728 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!168437 (= res!140173 (= (bvadd lt!261728 ((_ sign_extend 32) nBits!600)) (bitIndex!0 (size!3887 (buf!4339 (_2!7924 lt!261732))) (currentByte!8215 (_2!7924 lt!261732)) (currentBit!8210 (_2!7924 lt!261732)))))))

(assert (=> b!168437 (or (not (= (bvand lt!261728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261728 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!168437 (= lt!261728 (bitIndex!0 (size!3887 (buf!4339 thiss!1894)) (currentByte!8215 thiss!1894) (currentBit!8210 thiss!1894)))))

(declare-fun lt!261730 () (_ BitVec 32))

(declare-fun lt!261733 () (_ BitVec 32))

(declare-fun Unit!11729 () Unit!11711)

(declare-fun Unit!11730 () Unit!11711)

(declare-fun Unit!11731 () Unit!11711)

(assert (=> b!168437 (= lt!261732 (ite (bvslt (bvadd (currentBit!8210 thiss!1894) lt!261733) #b00000000000000000000000000000000) (tuple2!14639 Unit!11729 (BitStream!6931 (buf!4339 thiss!1894) (bvsub (bvadd (currentByte!8215 thiss!1894) lt!261730) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261733 (currentBit!8210 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8210 thiss!1894) lt!261733) #b00000000000000000000000000001000) (tuple2!14639 Unit!11730 (BitStream!6931 (buf!4339 thiss!1894) (bvadd (currentByte!8215 thiss!1894) lt!261730 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8210 thiss!1894) lt!261733) #b00000000000000000000000000001000))) (tuple2!14639 Unit!11731 (BitStream!6931 (buf!4339 thiss!1894) (bvadd (currentByte!8215 thiss!1894) lt!261730) (bvadd (currentBit!8210 thiss!1894) lt!261733))))))))

(assert (=> b!168437 (= lt!261733 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168437 (= lt!261730 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!168438 () Bool)

(assert (=> b!168438 (= e!117029 (and (= (size!3887 (buf!4339 thiss!1894)) (size!3887 (buf!4339 (_2!7924 lt!261732)))) (= (buf!4339 thiss!1894) (buf!4339 (_2!7924 lt!261732)))))))

(assert (= (and d!59315 res!140174) b!168437))

(assert (= (and b!168437 res!140173) b!168438))

(declare-fun m!268049 () Bool)

(assert (=> d!59315 m!268049))

(declare-fun m!268051 () Bool)

(assert (=> b!168437 m!268051))

(declare-fun m!268053 () Bool)

(assert (=> b!168437 m!268053))

(assert (=> b!168402 d!59315))

(declare-fun d!59329 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59329 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3887 (buf!4339 thiss!1894))) ((_ sign_extend 32) (currentByte!8215 thiss!1894)) ((_ sign_extend 32) (currentBit!8210 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3887 (buf!4339 thiss!1894))) ((_ sign_extend 32) (currentByte!8215 thiss!1894)) ((_ sign_extend 32) (currentBit!8210 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14698 () Bool)

(assert (= bs!14698 d!59329))

(declare-fun m!268055 () Bool)

(assert (=> bs!14698 m!268055))

(assert (=> b!168401 d!59329))

(check-sat (not b!168437) (not d!59305) (not d!59315) (not d!59329))
(check-sat)
(get-model)

(declare-fun d!59335 () Bool)

(declare-fun e!117035 () Bool)

(assert (=> d!59335 e!117035))

(declare-fun res!140181 () Bool)

(assert (=> d!59335 (=> (not res!140181) (not e!117035))))

(declare-fun lt!261751 () (_ BitVec 64))

(declare-fun lt!261753 () (_ BitVec 64))

(declare-fun lt!261748 () (_ BitVec 64))

(assert (=> d!59335 (= res!140181 (= lt!261753 (bvsub lt!261748 lt!261751)))))

(assert (=> d!59335 (or (= (bvand lt!261748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261751 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261748 lt!261751) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59335 (= lt!261751 (remainingBits!0 ((_ sign_extend 32) (size!3887 (buf!4339 (_2!7924 lt!261732)))) ((_ sign_extend 32) (currentByte!8215 (_2!7924 lt!261732))) ((_ sign_extend 32) (currentBit!8210 (_2!7924 lt!261732)))))))

(declare-fun lt!261750 () (_ BitVec 64))

(declare-fun lt!261752 () (_ BitVec 64))

(assert (=> d!59335 (= lt!261748 (bvmul lt!261750 lt!261752))))

(assert (=> d!59335 (or (= lt!261750 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261752 (bvsdiv (bvmul lt!261750 lt!261752) lt!261750)))))

(assert (=> d!59335 (= lt!261752 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59335 (= lt!261750 ((_ sign_extend 32) (size!3887 (buf!4339 (_2!7924 lt!261732)))))))

(assert (=> d!59335 (= lt!261753 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8215 (_2!7924 lt!261732))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8210 (_2!7924 lt!261732)))))))

(assert (=> d!59335 (invariant!0 (currentBit!8210 (_2!7924 lt!261732)) (currentByte!8215 (_2!7924 lt!261732)) (size!3887 (buf!4339 (_2!7924 lt!261732))))))

(assert (=> d!59335 (= (bitIndex!0 (size!3887 (buf!4339 (_2!7924 lt!261732))) (currentByte!8215 (_2!7924 lt!261732)) (currentBit!8210 (_2!7924 lt!261732))) lt!261753)))

(declare-fun b!168446 () Bool)

(declare-fun res!140182 () Bool)

(assert (=> b!168446 (=> (not res!140182) (not e!117035))))

(assert (=> b!168446 (= res!140182 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261753))))

(declare-fun b!168447 () Bool)

(declare-fun lt!261749 () (_ BitVec 64))

(assert (=> b!168447 (= e!117035 (bvsle lt!261753 (bvmul lt!261749 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168447 (or (= lt!261749 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261749 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261749)))))

(assert (=> b!168447 (= lt!261749 ((_ sign_extend 32) (size!3887 (buf!4339 (_2!7924 lt!261732)))))))

(assert (= (and d!59335 res!140181) b!168446))

(assert (= (and b!168446 res!140182) b!168447))

(declare-fun m!268059 () Bool)

(assert (=> d!59335 m!268059))

(declare-fun m!268061 () Bool)

(assert (=> d!59335 m!268061))

(assert (=> b!168437 d!59335))

(declare-fun d!59341 () Bool)

(declare-fun e!117037 () Bool)

(assert (=> d!59341 e!117037))

(declare-fun res!140184 () Bool)

(assert (=> d!59341 (=> (not res!140184) (not e!117037))))

(declare-fun lt!261755 () (_ BitVec 64))

(declare-fun lt!261758 () (_ BitVec 64))

(declare-fun lt!261760 () (_ BitVec 64))

(assert (=> d!59341 (= res!140184 (= lt!261760 (bvsub lt!261755 lt!261758)))))

(assert (=> d!59341 (or (= (bvand lt!261755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261758 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261755 lt!261758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59341 (= lt!261758 (remainingBits!0 ((_ sign_extend 32) (size!3887 (buf!4339 thiss!1894))) ((_ sign_extend 32) (currentByte!8215 thiss!1894)) ((_ sign_extend 32) (currentBit!8210 thiss!1894))))))

(declare-fun lt!261757 () (_ BitVec 64))

(declare-fun lt!261759 () (_ BitVec 64))

(assert (=> d!59341 (= lt!261755 (bvmul lt!261757 lt!261759))))

(assert (=> d!59341 (or (= lt!261757 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261759 (bvsdiv (bvmul lt!261757 lt!261759) lt!261757)))))

(assert (=> d!59341 (= lt!261759 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59341 (= lt!261757 ((_ sign_extend 32) (size!3887 (buf!4339 thiss!1894))))))

(assert (=> d!59341 (= lt!261760 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8215 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8210 thiss!1894))))))

(assert (=> d!59341 (invariant!0 (currentBit!8210 thiss!1894) (currentByte!8215 thiss!1894) (size!3887 (buf!4339 thiss!1894)))))

(assert (=> d!59341 (= (bitIndex!0 (size!3887 (buf!4339 thiss!1894)) (currentByte!8215 thiss!1894) (currentBit!8210 thiss!1894)) lt!261760)))

(declare-fun b!168449 () Bool)

(declare-fun res!140185 () Bool)

(assert (=> b!168449 (=> (not res!140185) (not e!117037))))

(assert (=> b!168449 (= res!140185 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261760))))

(declare-fun b!168450 () Bool)

(declare-fun lt!261756 () (_ BitVec 64))

(assert (=> b!168450 (= e!117037 (bvsle lt!261760 (bvmul lt!261756 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168450 (or (= lt!261756 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261756 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261756)))))

(assert (=> b!168450 (= lt!261756 ((_ sign_extend 32) (size!3887 (buf!4339 thiss!1894))))))

(assert (= (and d!59341 res!140184) b!168449))

(assert (= (and b!168449 res!140185) b!168450))

(assert (=> d!59341 m!268055))

(assert (=> d!59341 m!268035))

(assert (=> b!168437 d!59341))

(declare-fun d!59345 () Bool)

(assert (=> d!59345 (= (invariant!0 (currentBit!8210 thiss!1894) (currentByte!8215 thiss!1894) (size!3887 (buf!4339 thiss!1894))) (and (bvsge (currentBit!8210 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8210 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8215 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8215 thiss!1894) (size!3887 (buf!4339 thiss!1894))) (and (= (currentBit!8210 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8215 thiss!1894) (size!3887 (buf!4339 thiss!1894)))))))))

(assert (=> d!59305 d!59345))

(declare-fun d!59347 () Bool)

(declare-fun res!140188 () Bool)

(declare-fun e!117040 () Bool)

(assert (=> d!59347 (=> (not res!140188) (not e!117040))))

(assert (=> d!59347 (= res!140188 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3887 (buf!4339 thiss!1894)))) ((_ sign_extend 32) nBits!600)) (bvsle ((_ sign_extend 32) nBits!600) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3887 (buf!4339 thiss!1894)))))))))

(assert (=> d!59347 (= (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)) e!117040)))

(declare-fun b!168454 () Bool)

(declare-fun lt!261763 () (_ BitVec 64))

(assert (=> b!168454 (= e!117040 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261763) (bvsle lt!261763 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3887 (buf!4339 thiss!1894)))))))))

(assert (=> b!168454 (= lt!261763 (bvadd (bitIndex!0 (size!3887 (buf!4339 thiss!1894)) (currentByte!8215 thiss!1894) (currentBit!8210 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(assert (= (and d!59347 res!140188) b!168454))

(assert (=> b!168454 m!268053))

(assert (=> d!59315 d!59347))

(declare-fun d!59351 () Bool)

(assert (=> d!59351 (= (remainingBits!0 ((_ sign_extend 32) (size!3887 (buf!4339 thiss!1894))) ((_ sign_extend 32) (currentByte!8215 thiss!1894)) ((_ sign_extend 32) (currentBit!8210 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3887 (buf!4339 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8215 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8210 thiss!1894)))))))

(assert (=> d!59329 d!59351))

(check-sat (not d!59335) (not d!59341) (not b!168454))
(check-sat)
