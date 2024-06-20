; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52296 () Bool)

(assert start!52296)

(declare-fun b!240771 () Bool)

(declare-fun res!200998 () Bool)

(declare-fun e!166865 () Bool)

(assert (=> b!240771 (=> (not res!200998) (not e!166865))))

(declare-datatypes ((array!13176 0))(
  ( (array!13177 (arr!6758 (Array (_ BitVec 32) (_ BitVec 8))) (size!5771 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10464 0))(
  ( (BitStream!10465 (buf!6234 array!13176) (currentByte!11591 (_ BitVec 32)) (currentBit!11586 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10464)

(declare-datatypes ((Unit!17640 0))(
  ( (Unit!17641) )
))
(declare-datatypes ((tuple2!20466 0))(
  ( (tuple2!20467 (_1!11155 Unit!17640) (_2!11155 BitStream!10464)) )
))
(declare-fun lt!376115 () tuple2!20466)

(declare-fun isPrefixOf!0 (BitStream!10464 BitStream!10464) Bool)

(assert (=> b!240771 (= res!200998 (isPrefixOf!0 thiss!982 (_2!11155 lt!376115)))))

(declare-fun b!240772 () Bool)

(declare-datatypes ((tuple2!20468 0))(
  ( (tuple2!20469 (_1!11156 BitStream!10464) (_2!11156 Bool)) )
))
(declare-fun lt!376116 () tuple2!20468)

(declare-datatypes ((tuple2!20470 0))(
  ( (tuple2!20471 (_1!11157 BitStream!10464) (_2!11157 BitStream!10464)) )
))
(declare-fun lt!376111 () tuple2!20470)

(assert (=> b!240772 (= e!166865 (not (or (not (_2!11156 lt!376116)) (not (= (_1!11156 lt!376116) (_2!11157 lt!376111))))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10464 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20468)

(assert (=> b!240772 (= lt!376116 (checkBitsLoopPure!0 (_1!11157 lt!376111) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240772 (validate_offset_bits!1 ((_ sign_extend 32) (size!5771 (buf!6234 (_2!11155 lt!376115)))) ((_ sign_extend 32) (currentByte!11591 thiss!982)) ((_ sign_extend 32) (currentBit!11586 thiss!982)) nBits!288)))

(declare-fun lt!376112 () Unit!17640)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10464 array!13176 (_ BitVec 64)) Unit!17640)

(assert (=> b!240772 (= lt!376112 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6234 (_2!11155 lt!376115)) nBits!288))))

(declare-fun reader!0 (BitStream!10464 BitStream!10464) tuple2!20470)

(assert (=> b!240772 (= lt!376111 (reader!0 thiss!982 (_2!11155 lt!376115)))))

(declare-fun b!240774 () Bool)

(declare-fun res!201000 () Bool)

(declare-fun e!166863 () Bool)

(assert (=> b!240774 (=> (not res!201000) (not e!166863))))

(assert (=> b!240774 (= res!201000 (validate_offset_bits!1 ((_ sign_extend 32) (size!5771 (buf!6234 thiss!982))) ((_ sign_extend 32) (currentByte!11591 thiss!982)) ((_ sign_extend 32) (currentBit!11586 thiss!982)) nBits!288))))

(declare-fun b!240775 () Bool)

(declare-fun lt!376114 () (_ BitVec 64))

(declare-fun lt!376113 () (_ BitVec 64))

(assert (=> b!240775 (= e!166863 (not (or (not (= lt!376113 (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!376113 (bvand (bvadd lt!376114 nBits!288) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!240775 (= lt!376113 (bvand lt!376114 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240775 (= lt!376114 (bitIndex!0 (size!5771 (buf!6234 thiss!982)) (currentByte!11591 thiss!982) (currentBit!11586 thiss!982)))))

(assert (=> b!240775 e!166865))

(declare-fun res!200999 () Bool)

(assert (=> b!240775 (=> (not res!200999) (not e!166865))))

(assert (=> b!240775 (= res!200999 (= (size!5771 (buf!6234 thiss!982)) (size!5771 (buf!6234 (_2!11155 lt!376115)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10464 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20466)

(assert (=> b!240775 (= lt!376115 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240776 () Bool)

(declare-fun e!166862 () Bool)

(declare-fun array_inv!5512 (array!13176) Bool)

(assert (=> b!240776 (= e!166862 (array_inv!5512 (buf!6234 thiss!982)))))

(declare-fun res!200997 () Bool)

(assert (=> start!52296 (=> (not res!200997) (not e!166863))))

(assert (=> start!52296 (= res!200997 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52296 e!166863))

(assert (=> start!52296 true))

(declare-fun inv!12 (BitStream!10464) Bool)

(assert (=> start!52296 (and (inv!12 thiss!982) e!166862)))

(declare-fun b!240773 () Bool)

(declare-fun res!200996 () Bool)

(assert (=> b!240773 (=> (not res!200996) (not e!166865))))

(assert (=> b!240773 (= res!200996 (= (bitIndex!0 (size!5771 (buf!6234 (_2!11155 lt!376115))) (currentByte!11591 (_2!11155 lt!376115)) (currentBit!11586 (_2!11155 lt!376115))) (bvadd (bitIndex!0 (size!5771 (buf!6234 thiss!982)) (currentByte!11591 thiss!982) (currentBit!11586 thiss!982)) nBits!288)))))

(assert (= (and start!52296 res!200997) b!240774))

(assert (= (and b!240774 res!201000) b!240775))

(assert (= (and b!240775 res!200999) b!240773))

(assert (= (and b!240773 res!200996) b!240771))

(assert (= (and b!240771 res!200998) b!240772))

(assert (= start!52296 b!240776))

(declare-fun m!363361 () Bool)

(assert (=> b!240776 m!363361))

(declare-fun m!363363 () Bool)

(assert (=> b!240775 m!363363))

(declare-fun m!363365 () Bool)

(assert (=> b!240775 m!363365))

(declare-fun m!363367 () Bool)

(assert (=> b!240771 m!363367))

(declare-fun m!363369 () Bool)

(assert (=> b!240772 m!363369))

(declare-fun m!363371 () Bool)

(assert (=> b!240772 m!363371))

(declare-fun m!363373 () Bool)

(assert (=> b!240772 m!363373))

(declare-fun m!363375 () Bool)

(assert (=> b!240772 m!363375))

(declare-fun m!363377 () Bool)

(assert (=> start!52296 m!363377))

(declare-fun m!363379 () Bool)

(assert (=> b!240774 m!363379))

(declare-fun m!363381 () Bool)

(assert (=> b!240773 m!363381))

(assert (=> b!240773 m!363363))

(check-sat (not b!240771) (not b!240774) (not b!240773) (not b!240775) (not b!240772) (not start!52296) (not b!240776))
(check-sat)
(get-model)

(declare-datatypes ((tuple2!20478 0))(
  ( (tuple2!20479 (_1!11161 Bool) (_2!11161 BitStream!10464)) )
))
(declare-fun lt!376173 () tuple2!20478)

(declare-fun d!81398 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10464 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20478)

(assert (=> d!81398 (= lt!376173 (checkBitsLoop!0 (_1!11157 lt!376111) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81398 (= (checkBitsLoopPure!0 (_1!11157 lt!376111) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!20469 (_2!11161 lt!376173) (_1!11161 lt!376173)))))

(declare-fun bs!20537 () Bool)

(assert (= bs!20537 d!81398))

(declare-fun m!363413 () Bool)

(assert (=> bs!20537 m!363413))

(assert (=> b!240772 d!81398))

(declare-fun d!81402 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81402 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5771 (buf!6234 (_2!11155 lt!376115)))) ((_ sign_extend 32) (currentByte!11591 thiss!982)) ((_ sign_extend 32) (currentBit!11586 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5771 (buf!6234 (_2!11155 lt!376115)))) ((_ sign_extend 32) (currentByte!11591 thiss!982)) ((_ sign_extend 32) (currentBit!11586 thiss!982))) nBits!288))))

(declare-fun bs!20538 () Bool)

(assert (= bs!20538 d!81402))

(declare-fun m!363415 () Bool)

(assert (=> bs!20538 m!363415))

(assert (=> b!240772 d!81402))

(declare-fun d!81404 () Bool)

(assert (=> d!81404 (validate_offset_bits!1 ((_ sign_extend 32) (size!5771 (buf!6234 (_2!11155 lt!376115)))) ((_ sign_extend 32) (currentByte!11591 thiss!982)) ((_ sign_extend 32) (currentBit!11586 thiss!982)) nBits!288)))

(declare-fun lt!376176 () Unit!17640)

(declare-fun choose!9 (BitStream!10464 array!13176 (_ BitVec 64) BitStream!10464) Unit!17640)

(assert (=> d!81404 (= lt!376176 (choose!9 thiss!982 (buf!6234 (_2!11155 lt!376115)) nBits!288 (BitStream!10465 (buf!6234 (_2!11155 lt!376115)) (currentByte!11591 thiss!982) (currentBit!11586 thiss!982))))))

(assert (=> d!81404 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6234 (_2!11155 lt!376115)) nBits!288) lt!376176)))

(declare-fun bs!20539 () Bool)

(assert (= bs!20539 d!81404))

(assert (=> bs!20539 m!363371))

(declare-fun m!363417 () Bool)

(assert (=> bs!20539 m!363417))

(assert (=> b!240772 d!81404))

(declare-fun b!240825 () Bool)

(declare-fun e!166892 () Unit!17640)

(declare-fun lt!376246 () Unit!17640)

(assert (=> b!240825 (= e!166892 lt!376246)))

(declare-fun lt!376241 () (_ BitVec 64))

(assert (=> b!240825 (= lt!376241 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376249 () (_ BitVec 64))

(assert (=> b!240825 (= lt!376249 (bitIndex!0 (size!5771 (buf!6234 thiss!982)) (currentByte!11591 thiss!982) (currentBit!11586 thiss!982)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13176 array!13176 (_ BitVec 64) (_ BitVec 64)) Unit!17640)

(assert (=> b!240825 (= lt!376246 (arrayBitRangesEqSymmetric!0 (buf!6234 thiss!982) (buf!6234 (_2!11155 lt!376115)) lt!376241 lt!376249))))

(declare-fun arrayBitRangesEq!0 (array!13176 array!13176 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240825 (arrayBitRangesEq!0 (buf!6234 (_2!11155 lt!376115)) (buf!6234 thiss!982) lt!376241 lt!376249)))

(declare-fun b!240826 () Bool)

(declare-fun lt!376244 () (_ BitVec 64))

(declare-fun lt!376242 () (_ BitVec 64))

(declare-fun e!166893 () Bool)

(declare-fun lt!376233 () tuple2!20470)

(declare-fun withMovedBitIndex!0 (BitStream!10464 (_ BitVec 64)) BitStream!10464)

(assert (=> b!240826 (= e!166893 (= (_1!11157 lt!376233) (withMovedBitIndex!0 (_2!11157 lt!376233) (bvsub lt!376242 lt!376244))))))

(assert (=> b!240826 (or (= (bvand lt!376242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376244 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!376242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!376242 lt!376244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240826 (= lt!376244 (bitIndex!0 (size!5771 (buf!6234 (_2!11155 lt!376115))) (currentByte!11591 (_2!11155 lt!376115)) (currentBit!11586 (_2!11155 lt!376115))))))

(assert (=> b!240826 (= lt!376242 (bitIndex!0 (size!5771 (buf!6234 thiss!982)) (currentByte!11591 thiss!982) (currentBit!11586 thiss!982)))))

(declare-fun b!240827 () Bool)

(declare-fun Unit!17644 () Unit!17640)

(assert (=> b!240827 (= e!166892 Unit!17644)))

(declare-fun d!81406 () Bool)

(assert (=> d!81406 e!166893))

(declare-fun res!201044 () Bool)

(assert (=> d!81406 (=> (not res!201044) (not e!166893))))

(assert (=> d!81406 (= res!201044 (isPrefixOf!0 (_1!11157 lt!376233) (_2!11157 lt!376233)))))

(declare-fun lt!376251 () BitStream!10464)

(assert (=> d!81406 (= lt!376233 (tuple2!20471 lt!376251 (_2!11155 lt!376115)))))

(declare-fun lt!376235 () Unit!17640)

(declare-fun lt!376248 () Unit!17640)

(assert (=> d!81406 (= lt!376235 lt!376248)))

(assert (=> d!81406 (isPrefixOf!0 lt!376251 (_2!11155 lt!376115))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10464 BitStream!10464 BitStream!10464) Unit!17640)

(assert (=> d!81406 (= lt!376248 (lemmaIsPrefixTransitive!0 lt!376251 (_2!11155 lt!376115) (_2!11155 lt!376115)))))

(declare-fun lt!376250 () Unit!17640)

(declare-fun lt!376234 () Unit!17640)

(assert (=> d!81406 (= lt!376250 lt!376234)))

(assert (=> d!81406 (isPrefixOf!0 lt!376251 (_2!11155 lt!376115))))

(assert (=> d!81406 (= lt!376234 (lemmaIsPrefixTransitive!0 lt!376251 thiss!982 (_2!11155 lt!376115)))))

(declare-fun lt!376239 () Unit!17640)

(assert (=> d!81406 (= lt!376239 e!166892)))

(declare-fun c!11434 () Bool)

(assert (=> d!81406 (= c!11434 (not (= (size!5771 (buf!6234 thiss!982)) #b00000000000000000000000000000000)))))

(declare-fun lt!376247 () Unit!17640)

(declare-fun lt!376238 () Unit!17640)

(assert (=> d!81406 (= lt!376247 lt!376238)))

(assert (=> d!81406 (isPrefixOf!0 (_2!11155 lt!376115) (_2!11155 lt!376115))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10464) Unit!17640)

(assert (=> d!81406 (= lt!376238 (lemmaIsPrefixRefl!0 (_2!11155 lt!376115)))))

(declare-fun lt!376243 () Unit!17640)

(declare-fun lt!376245 () Unit!17640)

(assert (=> d!81406 (= lt!376243 lt!376245)))

(assert (=> d!81406 (= lt!376245 (lemmaIsPrefixRefl!0 (_2!11155 lt!376115)))))

(declare-fun lt!376236 () Unit!17640)

(declare-fun lt!376240 () Unit!17640)

(assert (=> d!81406 (= lt!376236 lt!376240)))

(assert (=> d!81406 (isPrefixOf!0 lt!376251 lt!376251)))

(assert (=> d!81406 (= lt!376240 (lemmaIsPrefixRefl!0 lt!376251))))

(declare-fun lt!376252 () Unit!17640)

(declare-fun lt!376237 () Unit!17640)

(assert (=> d!81406 (= lt!376252 lt!376237)))

(assert (=> d!81406 (isPrefixOf!0 thiss!982 thiss!982)))

(assert (=> d!81406 (= lt!376237 (lemmaIsPrefixRefl!0 thiss!982))))

(assert (=> d!81406 (= lt!376251 (BitStream!10465 (buf!6234 (_2!11155 lt!376115)) (currentByte!11591 thiss!982) (currentBit!11586 thiss!982)))))

(assert (=> d!81406 (isPrefixOf!0 thiss!982 (_2!11155 lt!376115))))

(assert (=> d!81406 (= (reader!0 thiss!982 (_2!11155 lt!376115)) lt!376233)))

(declare-fun b!240828 () Bool)

(declare-fun res!201042 () Bool)

(assert (=> b!240828 (=> (not res!201042) (not e!166893))))

(assert (=> b!240828 (= res!201042 (isPrefixOf!0 (_2!11157 lt!376233) (_2!11155 lt!376115)))))

(declare-fun b!240829 () Bool)

(declare-fun res!201043 () Bool)

(assert (=> b!240829 (=> (not res!201043) (not e!166893))))

(assert (=> b!240829 (= res!201043 (isPrefixOf!0 (_1!11157 lt!376233) thiss!982))))

(assert (= (and d!81406 c!11434) b!240825))

(assert (= (and d!81406 (not c!11434)) b!240827))

(assert (= (and d!81406 res!201044) b!240829))

(assert (= (and b!240829 res!201043) b!240828))

(assert (= (and b!240828 res!201042) b!240826))

(assert (=> b!240825 m!363363))

(declare-fun m!363419 () Bool)

(assert (=> b!240825 m!363419))

(declare-fun m!363421 () Bool)

(assert (=> b!240825 m!363421))

(declare-fun m!363423 () Bool)

(assert (=> b!240828 m!363423))

(declare-fun m!363425 () Bool)

(assert (=> d!81406 m!363425))

(declare-fun m!363427 () Bool)

(assert (=> d!81406 m!363427))

(declare-fun m!363429 () Bool)

(assert (=> d!81406 m!363429))

(declare-fun m!363431 () Bool)

(assert (=> d!81406 m!363431))

(declare-fun m!363433 () Bool)

(assert (=> d!81406 m!363433))

(assert (=> d!81406 m!363367))

(declare-fun m!363435 () Bool)

(assert (=> d!81406 m!363435))

(declare-fun m!363437 () Bool)

(assert (=> d!81406 m!363437))

(declare-fun m!363439 () Bool)

(assert (=> d!81406 m!363439))

(declare-fun m!363441 () Bool)

(assert (=> d!81406 m!363441))

(declare-fun m!363443 () Bool)

(assert (=> d!81406 m!363443))

(declare-fun m!363445 () Bool)

(assert (=> b!240829 m!363445))

(declare-fun m!363447 () Bool)

(assert (=> b!240826 m!363447))

(assert (=> b!240826 m!363381))

(assert (=> b!240826 m!363363))

(assert (=> b!240772 d!81406))

(declare-fun d!81408 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81408 (= (inv!12 thiss!982) (invariant!0 (currentBit!11586 thiss!982) (currentByte!11591 thiss!982) (size!5771 (buf!6234 thiss!982))))))

(declare-fun bs!20540 () Bool)

(assert (= bs!20540 d!81408))

(declare-fun m!363449 () Bool)

(assert (=> bs!20540 m!363449))

(assert (=> start!52296 d!81408))

(declare-fun d!81410 () Bool)

(declare-fun e!166906 () Bool)

(assert (=> d!81410 e!166906))

(declare-fun res!201070 () Bool)

(assert (=> d!81410 (=> (not res!201070) (not e!166906))))

(declare-fun lt!376319 () (_ BitVec 64))

(declare-fun lt!376318 () (_ BitVec 64))

(declare-fun lt!376317 () (_ BitVec 64))

(assert (=> d!81410 (= res!201070 (= lt!376318 (bvsub lt!376319 lt!376317)))))

(assert (=> d!81410 (or (= (bvand lt!376319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376317 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!376319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!376319 lt!376317) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81410 (= lt!376317 (remainingBits!0 ((_ sign_extend 32) (size!5771 (buf!6234 (_2!11155 lt!376115)))) ((_ sign_extend 32) (currentByte!11591 (_2!11155 lt!376115))) ((_ sign_extend 32) (currentBit!11586 (_2!11155 lt!376115)))))))

(declare-fun lt!376320 () (_ BitVec 64))

(declare-fun lt!376316 () (_ BitVec 64))

(assert (=> d!81410 (= lt!376319 (bvmul lt!376320 lt!376316))))

(assert (=> d!81410 (or (= lt!376320 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!376316 (bvsdiv (bvmul lt!376320 lt!376316) lt!376320)))))

(assert (=> d!81410 (= lt!376316 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81410 (= lt!376320 ((_ sign_extend 32) (size!5771 (buf!6234 (_2!11155 lt!376115)))))))

(assert (=> d!81410 (= lt!376318 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11591 (_2!11155 lt!376115))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11586 (_2!11155 lt!376115)))))))

(assert (=> d!81410 (invariant!0 (currentBit!11586 (_2!11155 lt!376115)) (currentByte!11591 (_2!11155 lt!376115)) (size!5771 (buf!6234 (_2!11155 lt!376115))))))

(assert (=> d!81410 (= (bitIndex!0 (size!5771 (buf!6234 (_2!11155 lt!376115))) (currentByte!11591 (_2!11155 lt!376115)) (currentBit!11586 (_2!11155 lt!376115))) lt!376318)))

(declare-fun b!240854 () Bool)

(declare-fun res!201069 () Bool)

(assert (=> b!240854 (=> (not res!201069) (not e!166906))))

(assert (=> b!240854 (= res!201069 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!376318))))

(declare-fun b!240855 () Bool)

(declare-fun lt!376315 () (_ BitVec 64))

(assert (=> b!240855 (= e!166906 (bvsle lt!376318 (bvmul lt!376315 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240855 (or (= lt!376315 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!376315 #b0000000000000000000000000000000000000000000000000000000000001000) lt!376315)))))

(assert (=> b!240855 (= lt!376315 ((_ sign_extend 32) (size!5771 (buf!6234 (_2!11155 lt!376115)))))))

(assert (= (and d!81410 res!201070) b!240854))

(assert (= (and b!240854 res!201069) b!240855))

(declare-fun m!363497 () Bool)

(assert (=> d!81410 m!363497))

(declare-fun m!363499 () Bool)

(assert (=> d!81410 m!363499))

(assert (=> b!240773 d!81410))

(declare-fun d!81426 () Bool)

(declare-fun e!166907 () Bool)

(assert (=> d!81426 e!166907))

(declare-fun res!201072 () Bool)

(assert (=> d!81426 (=> (not res!201072) (not e!166907))))

(declare-fun lt!376325 () (_ BitVec 64))

(declare-fun lt!376323 () (_ BitVec 64))

(declare-fun lt!376324 () (_ BitVec 64))

(assert (=> d!81426 (= res!201072 (= lt!376324 (bvsub lt!376325 lt!376323)))))

(assert (=> d!81426 (or (= (bvand lt!376325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376323 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!376325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!376325 lt!376323) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81426 (= lt!376323 (remainingBits!0 ((_ sign_extend 32) (size!5771 (buf!6234 thiss!982))) ((_ sign_extend 32) (currentByte!11591 thiss!982)) ((_ sign_extend 32) (currentBit!11586 thiss!982))))))

(declare-fun lt!376326 () (_ BitVec 64))

(declare-fun lt!376322 () (_ BitVec 64))

(assert (=> d!81426 (= lt!376325 (bvmul lt!376326 lt!376322))))

(assert (=> d!81426 (or (= lt!376326 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!376322 (bvsdiv (bvmul lt!376326 lt!376322) lt!376326)))))

(assert (=> d!81426 (= lt!376322 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81426 (= lt!376326 ((_ sign_extend 32) (size!5771 (buf!6234 thiss!982))))))

(assert (=> d!81426 (= lt!376324 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11591 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11586 thiss!982))))))

(assert (=> d!81426 (invariant!0 (currentBit!11586 thiss!982) (currentByte!11591 thiss!982) (size!5771 (buf!6234 thiss!982)))))

(assert (=> d!81426 (= (bitIndex!0 (size!5771 (buf!6234 thiss!982)) (currentByte!11591 thiss!982) (currentBit!11586 thiss!982)) lt!376324)))

(declare-fun b!240856 () Bool)

(declare-fun res!201071 () Bool)

(assert (=> b!240856 (=> (not res!201071) (not e!166907))))

(assert (=> b!240856 (= res!201071 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!376324))))

(declare-fun b!240857 () Bool)

(declare-fun lt!376321 () (_ BitVec 64))

(assert (=> b!240857 (= e!166907 (bvsle lt!376324 (bvmul lt!376321 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240857 (or (= lt!376321 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!376321 #b0000000000000000000000000000000000000000000000000000000000001000) lt!376321)))))

(assert (=> b!240857 (= lt!376321 ((_ sign_extend 32) (size!5771 (buf!6234 thiss!982))))))

(assert (= (and d!81426 res!201072) b!240856))

(assert (= (and b!240856 res!201071) b!240857))

(declare-fun m!363501 () Bool)

(assert (=> d!81426 m!363501))

(assert (=> d!81426 m!363449))

(assert (=> b!240773 d!81426))

(assert (=> b!240775 d!81426))

(declare-fun b!240917 () Bool)

(declare-fun e!166936 () Bool)

(declare-fun lt!376475 () (_ BitVec 64))

(assert (=> b!240917 (= e!166936 (validate_offset_bits!1 ((_ sign_extend 32) (size!5771 (buf!6234 thiss!982))) ((_ sign_extend 32) (currentByte!11591 thiss!982)) ((_ sign_extend 32) (currentBit!11586 thiss!982)) lt!376475))))

(declare-fun b!240914 () Bool)

(declare-fun res!201119 () Bool)

(declare-fun e!166937 () Bool)

(assert (=> b!240914 (=> (not res!201119) (not e!166937))))

(declare-fun lt!376474 () tuple2!20466)

(declare-fun lt!376470 () (_ BitVec 64))

(declare-fun lt!376472 () (_ BitVec 64))

(assert (=> b!240914 (= res!201119 (= (bitIndex!0 (size!5771 (buf!6234 (_2!11155 lt!376474))) (currentByte!11591 (_2!11155 lt!376474)) (currentBit!11586 (_2!11155 lt!376474))) (bvadd lt!376470 lt!376472)))))

(assert (=> b!240914 (or (not (= (bvand lt!376470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376472 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!376470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!376470 lt!376472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240914 (= lt!376472 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240914 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240914 (= lt!376470 (bitIndex!0 (size!5771 (buf!6234 thiss!982)) (currentByte!11591 thiss!982) (currentBit!11586 thiss!982)))))

(declare-fun b!240916 () Bool)

(declare-fun lt!376469 () tuple2!20468)

(declare-fun lt!376476 () tuple2!20470)

(assert (=> b!240916 (= e!166937 (and (_2!11156 lt!376469) (= (_1!11156 lt!376469) (_2!11157 lt!376476))))))

(assert (=> b!240916 (= lt!376469 (checkBitsLoopPure!0 (_1!11157 lt!376476) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!376471 () Unit!17640)

(declare-fun lt!376473 () Unit!17640)

(assert (=> b!240916 (= lt!376471 lt!376473)))

(assert (=> b!240916 (validate_offset_bits!1 ((_ sign_extend 32) (size!5771 (buf!6234 (_2!11155 lt!376474)))) ((_ sign_extend 32) (currentByte!11591 thiss!982)) ((_ sign_extend 32) (currentBit!11586 thiss!982)) lt!376475)))

(assert (=> b!240916 (= lt!376473 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6234 (_2!11155 lt!376474)) lt!376475))))

(assert (=> b!240916 e!166936))

(declare-fun res!201120 () Bool)

(assert (=> b!240916 (=> (not res!201120) (not e!166936))))

(assert (=> b!240916 (= res!201120 (and (= (size!5771 (buf!6234 thiss!982)) (size!5771 (buf!6234 (_2!11155 lt!376474)))) (bvsge lt!376475 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240916 (= lt!376475 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240916 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240916 (= lt!376476 (reader!0 thiss!982 (_2!11155 lt!376474)))))

(declare-fun b!240915 () Bool)

(declare-fun res!201118 () Bool)

(assert (=> b!240915 (=> (not res!201118) (not e!166937))))

(assert (=> b!240915 (= res!201118 (isPrefixOf!0 thiss!982 (_2!11155 lt!376474)))))

(declare-fun d!81428 () Bool)

(assert (=> d!81428 e!166937))

(declare-fun res!201117 () Bool)

(assert (=> d!81428 (=> (not res!201117) (not e!166937))))

(assert (=> d!81428 (= res!201117 (= (size!5771 (buf!6234 thiss!982)) (size!5771 (buf!6234 (_2!11155 lt!376474)))))))

(declare-fun choose!51 (BitStream!10464 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20466)

(assert (=> d!81428 (= lt!376474 (choose!51 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81428 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81428 (= (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) lt!376474)))

(assert (= (and d!81428 res!201117) b!240914))

(assert (= (and b!240914 res!201119) b!240915))

(assert (= (and b!240915 res!201118) b!240916))

(assert (= (and b!240916 res!201120) b!240917))

(declare-fun m!363573 () Bool)

(assert (=> d!81428 m!363573))

(declare-fun m!363575 () Bool)

(assert (=> b!240917 m!363575))

(declare-fun m!363577 () Bool)

(assert (=> b!240915 m!363577))

(declare-fun m!363579 () Bool)

(assert (=> b!240914 m!363579))

(assert (=> b!240914 m!363363))

(declare-fun m!363581 () Bool)

(assert (=> b!240916 m!363581))

(declare-fun m!363583 () Bool)

(assert (=> b!240916 m!363583))

(declare-fun m!363585 () Bool)

(assert (=> b!240916 m!363585))

(declare-fun m!363587 () Bool)

(assert (=> b!240916 m!363587))

(assert (=> b!240775 d!81428))

(declare-fun d!81450 () Bool)

(assert (=> d!81450 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5771 (buf!6234 thiss!982))) ((_ sign_extend 32) (currentByte!11591 thiss!982)) ((_ sign_extend 32) (currentBit!11586 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5771 (buf!6234 thiss!982))) ((_ sign_extend 32) (currentByte!11591 thiss!982)) ((_ sign_extend 32) (currentBit!11586 thiss!982))) nBits!288))))

(declare-fun bs!20551 () Bool)

(assert (= bs!20551 d!81450))

(assert (=> bs!20551 m!363501))

(assert (=> b!240774 d!81450))

(declare-fun d!81452 () Bool)

(declare-fun res!201127 () Bool)

(declare-fun e!166942 () Bool)

(assert (=> d!81452 (=> (not res!201127) (not e!166942))))

(assert (=> d!81452 (= res!201127 (= (size!5771 (buf!6234 thiss!982)) (size!5771 (buf!6234 (_2!11155 lt!376115)))))))

(assert (=> d!81452 (= (isPrefixOf!0 thiss!982 (_2!11155 lt!376115)) e!166942)))

(declare-fun b!240924 () Bool)

(declare-fun res!201128 () Bool)

(assert (=> b!240924 (=> (not res!201128) (not e!166942))))

(assert (=> b!240924 (= res!201128 (bvsle (bitIndex!0 (size!5771 (buf!6234 thiss!982)) (currentByte!11591 thiss!982) (currentBit!11586 thiss!982)) (bitIndex!0 (size!5771 (buf!6234 (_2!11155 lt!376115))) (currentByte!11591 (_2!11155 lt!376115)) (currentBit!11586 (_2!11155 lt!376115)))))))

(declare-fun b!240925 () Bool)

(declare-fun e!166943 () Bool)

(assert (=> b!240925 (= e!166942 e!166943)))

(declare-fun res!201129 () Bool)

(assert (=> b!240925 (=> res!201129 e!166943)))

(assert (=> b!240925 (= res!201129 (= (size!5771 (buf!6234 thiss!982)) #b00000000000000000000000000000000))))

(declare-fun b!240926 () Bool)

(assert (=> b!240926 (= e!166943 (arrayBitRangesEq!0 (buf!6234 thiss!982) (buf!6234 (_2!11155 lt!376115)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5771 (buf!6234 thiss!982)) (currentByte!11591 thiss!982) (currentBit!11586 thiss!982))))))

(assert (= (and d!81452 res!201127) b!240924))

(assert (= (and b!240924 res!201128) b!240925))

(assert (= (and b!240925 (not res!201129)) b!240926))

(assert (=> b!240924 m!363363))

(assert (=> b!240924 m!363381))

(assert (=> b!240926 m!363363))

(assert (=> b!240926 m!363363))

(declare-fun m!363589 () Bool)

(assert (=> b!240926 m!363589))

(assert (=> b!240771 d!81452))

(declare-fun d!81454 () Bool)

(assert (=> d!81454 (= (array_inv!5512 (buf!6234 thiss!982)) (bvsge (size!5771 (buf!6234 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!240776 d!81454))

(check-sat (not b!240914) (not b!240926) (not b!240916) (not d!81428) (not b!240829) (not b!240828) (not d!81450) (not d!81408) (not b!240915) (not d!81404) (not d!81410) (not d!81426) (not b!240826) (not d!81398) (not d!81402) (not d!81406) (not b!240917) (not b!240825) (not b!240924))
