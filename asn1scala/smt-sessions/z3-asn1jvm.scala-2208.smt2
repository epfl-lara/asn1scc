; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56022 () Bool)

(assert start!56022)

(declare-fun b!260164 () Bool)

(declare-fun e!180566 () Bool)

(declare-datatypes ((array!14234 0))(
  ( (array!14235 (arr!7217 (Array (_ BitVec 32) (_ BitVec 8))) (size!6230 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11382 0))(
  ( (BitStream!11383 (buf!6752 array!14234) (currentByte!12420 (_ BitVec 32)) (currentBit!12415 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11382)

(declare-fun array_inv!5971 (array!14234) Bool)

(assert (=> b!260164 (= e!180566 (array_inv!5971 (buf!6752 thiss!1754)))))

(declare-fun b!260165 () Bool)

(declare-fun e!180569 () Bool)

(declare-fun e!180567 () Bool)

(assert (=> b!260165 (= e!180569 (not e!180567))))

(declare-fun res!217867 () Bool)

(assert (=> b!260165 (=> (not res!217867) (not e!180567))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((tuple2!22314 0))(
  ( (tuple2!22315 (_1!12093 Bool) (_2!12093 BitStream!11382)) )
))
(declare-fun lt!402392 () tuple2!22314)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun lt!402391 () (_ BitVec 64))

(declare-fun lt!402393 () (_ BitVec 64))

(assert (=> b!260165 (= res!217867 (and (bvsge lt!402391 lt!402393) (= (buf!6752 thiss!1754) (buf!6752 (_2!12093 lt!402392))) (or (not (= nBits!535 from!526)) (_1!12093 lt!402392)) (or (not (_1!12093 lt!402392)) (= lt!402391 lt!402393))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!260165 (= lt!402393 (bitIndex!0 (size!6230 (buf!6752 (_2!12093 lt!402392))) (currentByte!12420 (_2!12093 lt!402392)) (currentBit!12415 (_2!12093 lt!402392))))))

(assert (=> b!260165 (= lt!402391 (bvsub (bvadd (bitIndex!0 (size!6230 (buf!6752 thiss!1754)) (currentByte!12420 thiss!1754) (currentBit!12415 thiss!1754)) nBits!535) from!526))))

(declare-fun expected!109 () Bool)

(declare-fun lt!402395 () tuple2!22314)

(declare-fun checkBitsLoop!0 (BitStream!11382 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22314)

(assert (=> b!260165 (= lt!402392 (checkBitsLoop!0 (_2!12093 lt!402395) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260165 (validate_offset_bits!1 ((_ sign_extend 32) (size!6230 (buf!6752 (_2!12093 lt!402395)))) ((_ sign_extend 32) (currentByte!12420 (_2!12093 lt!402395))) ((_ sign_extend 32) (currentBit!12415 (_2!12093 lt!402395))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18503 0))(
  ( (Unit!18504) )
))
(declare-fun lt!402394 () Unit!18503)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11382 BitStream!11382 (_ BitVec 64) (_ BitVec 64)) Unit!18503)

(assert (=> b!260165 (= lt!402394 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12093 lt!402395) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!260166 () Bool)

(declare-fun res!217869 () Bool)

(declare-fun e!180570 () Bool)

(assert (=> b!260166 (=> (not res!217869) (not e!180570))))

(assert (=> b!260166 (= res!217869 (not (= from!526 nBits!535)))))

(declare-fun res!217870 () Bool)

(assert (=> start!56022 (=> (not res!217870) (not e!180570))))

(assert (=> start!56022 (= res!217870 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!56022 e!180570))

(assert (=> start!56022 true))

(declare-fun inv!12 (BitStream!11382) Bool)

(assert (=> start!56022 (and (inv!12 thiss!1754) e!180566)))

(declare-fun b!260167 () Bool)

(declare-fun e!180571 () Bool)

(declare-datatypes ((tuple2!22316 0))(
  ( (tuple2!22317 (_1!12094 BitStream!11382) (_2!12094 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11382) tuple2!22316)

(assert (=> b!260167 (= e!180571 (= expected!109 (_2!12094 (readBitPure!0 thiss!1754))))))

(declare-fun b!260168 () Bool)

(assert (=> b!260168 (= e!180567 e!180571)))

(declare-fun res!217865 () Bool)

(assert (=> b!260168 (=> res!217865 e!180571)))

(assert (=> b!260168 (= res!217865 (or (not (_1!12093 lt!402392)) (bvsge from!526 nBits!535)))))

(declare-fun b!260169 () Bool)

(assert (=> b!260169 (= e!180570 e!180569)))

(declare-fun res!217866 () Bool)

(assert (=> b!260169 (=> (not res!217866) (not e!180569))))

(assert (=> b!260169 (= res!217866 (= (_1!12093 lt!402395) expected!109))))

(declare-fun readBit!0 (BitStream!11382) tuple2!22314)

(assert (=> b!260169 (= lt!402395 (readBit!0 thiss!1754))))

(declare-fun b!260170 () Bool)

(declare-fun res!217868 () Bool)

(assert (=> b!260170 (=> (not res!217868) (not e!180570))))

(assert (=> b!260170 (= res!217868 (validate_offset_bits!1 ((_ sign_extend 32) (size!6230 (buf!6752 thiss!1754))) ((_ sign_extend 32) (currentByte!12420 thiss!1754)) ((_ sign_extend 32) (currentBit!12415 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!56022 res!217870) b!260170))

(assert (= (and b!260170 res!217868) b!260166))

(assert (= (and b!260166 res!217869) b!260169))

(assert (= (and b!260169 res!217866) b!260165))

(assert (= (and b!260165 res!217867) b!260168))

(assert (= (and b!260168 (not res!217865)) b!260167))

(assert (= start!56022 b!260164))

(declare-fun m!389407 () Bool)

(assert (=> b!260164 m!389407))

(declare-fun m!389409 () Bool)

(assert (=> start!56022 m!389409))

(declare-fun m!389411 () Bool)

(assert (=> b!260165 m!389411))

(declare-fun m!389413 () Bool)

(assert (=> b!260165 m!389413))

(declare-fun m!389415 () Bool)

(assert (=> b!260165 m!389415))

(declare-fun m!389417 () Bool)

(assert (=> b!260165 m!389417))

(declare-fun m!389419 () Bool)

(assert (=> b!260165 m!389419))

(declare-fun m!389421 () Bool)

(assert (=> b!260169 m!389421))

(declare-fun m!389423 () Bool)

(assert (=> b!260170 m!389423))

(declare-fun m!389425 () Bool)

(assert (=> b!260167 m!389425))

(check-sat (not b!260164) (not b!260165) (not b!260170) (not b!260167) (not start!56022) (not b!260169))
(check-sat)
(get-model)

(declare-fun d!87252 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87252 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12415 thiss!1754) (currentByte!12420 thiss!1754) (size!6230 (buf!6752 thiss!1754))))))

(declare-fun bs!22102 () Bool)

(assert (= bs!22102 d!87252))

(declare-fun m!389449 () Bool)

(assert (=> bs!22102 m!389449))

(assert (=> start!56022 d!87252))

(declare-fun d!87256 () Bool)

(declare-fun lt!402416 () tuple2!22314)

(assert (=> d!87256 (= lt!402416 (readBit!0 thiss!1754))))

(assert (=> d!87256 (= (readBitPure!0 thiss!1754) (tuple2!22317 (_2!12093 lt!402416) (_1!12093 lt!402416)))))

(declare-fun bs!22104 () Bool)

(assert (= bs!22104 d!87256))

(assert (=> bs!22104 m!389421))

(assert (=> b!260167 d!87256))

(declare-fun d!87260 () Bool)

(declare-fun e!180596 () Bool)

(assert (=> d!87260 e!180596))

(declare-fun res!217893 () Bool)

(assert (=> d!87260 (=> (not res!217893) (not e!180596))))

(declare-fun lt!402429 () (_ BitVec 64))

(declare-fun lt!402430 () (_ BitVec 64))

(declare-fun lt!402431 () (_ BitVec 64))

(assert (=> d!87260 (= res!217893 (= lt!402431 (bvsub lt!402429 lt!402430)))))

(assert (=> d!87260 (or (= (bvand lt!402429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402430 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402429 lt!402430) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87260 (= lt!402430 (remainingBits!0 ((_ sign_extend 32) (size!6230 (buf!6752 thiss!1754))) ((_ sign_extend 32) (currentByte!12420 thiss!1754)) ((_ sign_extend 32) (currentBit!12415 thiss!1754))))))

(declare-fun lt!402433 () (_ BitVec 64))

(declare-fun lt!402432 () (_ BitVec 64))

(assert (=> d!87260 (= lt!402429 (bvmul lt!402433 lt!402432))))

(assert (=> d!87260 (or (= lt!402433 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402432 (bvsdiv (bvmul lt!402433 lt!402432) lt!402433)))))

(assert (=> d!87260 (= lt!402432 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87260 (= lt!402433 ((_ sign_extend 32) (size!6230 (buf!6752 thiss!1754))))))

(assert (=> d!87260 (= lt!402431 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12420 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12415 thiss!1754))))))

(assert (=> d!87260 (invariant!0 (currentBit!12415 thiss!1754) (currentByte!12420 thiss!1754) (size!6230 (buf!6752 thiss!1754)))))

(assert (=> d!87260 (= (bitIndex!0 (size!6230 (buf!6752 thiss!1754)) (currentByte!12420 thiss!1754) (currentBit!12415 thiss!1754)) lt!402431)))

(declare-fun b!260196 () Bool)

(declare-fun res!217894 () Bool)

(assert (=> b!260196 (=> (not res!217894) (not e!180596))))

(assert (=> b!260196 (= res!217894 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402431))))

(declare-fun b!260197 () Bool)

(declare-fun lt!402434 () (_ BitVec 64))

(assert (=> b!260197 (= e!180596 (bvsle lt!402431 (bvmul lt!402434 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260197 (or (= lt!402434 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402434 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402434)))))

(assert (=> b!260197 (= lt!402434 ((_ sign_extend 32) (size!6230 (buf!6752 thiss!1754))))))

(assert (= (and d!87260 res!217893) b!260196))

(assert (= (and b!260196 res!217894) b!260197))

(declare-fun m!389451 () Bool)

(assert (=> d!87260 m!389451))

(assert (=> d!87260 m!389449))

(assert (=> b!260165 d!87260))

(declare-fun d!87262 () Bool)

(declare-fun e!180601 () Bool)

(assert (=> d!87262 e!180601))

(declare-fun res!217899 () Bool)

(assert (=> d!87262 (=> (not res!217899) (not e!180601))))

(assert (=> d!87262 (= res!217899 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!402451 () Unit!18503)

(declare-fun choose!27 (BitStream!11382 BitStream!11382 (_ BitVec 64) (_ BitVec 64)) Unit!18503)

(assert (=> d!87262 (= lt!402451 (choose!27 thiss!1754 (_2!12093 lt!402395) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87262 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87262 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12093 lt!402395) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!402451)))

(declare-fun b!260202 () Bool)

(assert (=> b!260202 (= e!180601 (validate_offset_bits!1 ((_ sign_extend 32) (size!6230 (buf!6752 (_2!12093 lt!402395)))) ((_ sign_extend 32) (currentByte!12420 (_2!12093 lt!402395))) ((_ sign_extend 32) (currentBit!12415 (_2!12093 lt!402395))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87262 res!217899) b!260202))

(declare-fun m!389453 () Bool)

(assert (=> d!87262 m!389453))

(assert (=> b!260202 m!389411))

(assert (=> b!260165 d!87262))

(declare-fun d!87264 () Bool)

(assert (=> d!87264 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6230 (buf!6752 (_2!12093 lt!402395)))) ((_ sign_extend 32) (currentByte!12420 (_2!12093 lt!402395))) ((_ sign_extend 32) (currentBit!12415 (_2!12093 lt!402395))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6230 (buf!6752 (_2!12093 lt!402395)))) ((_ sign_extend 32) (currentByte!12420 (_2!12093 lt!402395))) ((_ sign_extend 32) (currentBit!12415 (_2!12093 lt!402395)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22105 () Bool)

(assert (= bs!22105 d!87264))

(declare-fun m!389455 () Bool)

(assert (=> bs!22105 m!389455))

(assert (=> b!260165 d!87264))

(declare-fun d!87266 () Bool)

(declare-fun e!180602 () Bool)

(assert (=> d!87266 e!180602))

(declare-fun res!217900 () Bool)

(assert (=> d!87266 (=> (not res!217900) (not e!180602))))

(declare-fun lt!402454 () (_ BitVec 64))

(declare-fun lt!402452 () (_ BitVec 64))

(declare-fun lt!402453 () (_ BitVec 64))

(assert (=> d!87266 (= res!217900 (= lt!402454 (bvsub lt!402452 lt!402453)))))

(assert (=> d!87266 (or (= (bvand lt!402452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402453 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402452 lt!402453) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87266 (= lt!402453 (remainingBits!0 ((_ sign_extend 32) (size!6230 (buf!6752 (_2!12093 lt!402392)))) ((_ sign_extend 32) (currentByte!12420 (_2!12093 lt!402392))) ((_ sign_extend 32) (currentBit!12415 (_2!12093 lt!402392)))))))

(declare-fun lt!402456 () (_ BitVec 64))

(declare-fun lt!402455 () (_ BitVec 64))

(assert (=> d!87266 (= lt!402452 (bvmul lt!402456 lt!402455))))

(assert (=> d!87266 (or (= lt!402456 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402455 (bvsdiv (bvmul lt!402456 lt!402455) lt!402456)))))

(assert (=> d!87266 (= lt!402455 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87266 (= lt!402456 ((_ sign_extend 32) (size!6230 (buf!6752 (_2!12093 lt!402392)))))))

(assert (=> d!87266 (= lt!402454 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12420 (_2!12093 lt!402392))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12415 (_2!12093 lt!402392)))))))

(assert (=> d!87266 (invariant!0 (currentBit!12415 (_2!12093 lt!402392)) (currentByte!12420 (_2!12093 lt!402392)) (size!6230 (buf!6752 (_2!12093 lt!402392))))))

(assert (=> d!87266 (= (bitIndex!0 (size!6230 (buf!6752 (_2!12093 lt!402392))) (currentByte!12420 (_2!12093 lt!402392)) (currentBit!12415 (_2!12093 lt!402392))) lt!402454)))

(declare-fun b!260203 () Bool)

(declare-fun res!217901 () Bool)

(assert (=> b!260203 (=> (not res!217901) (not e!180602))))

(assert (=> b!260203 (= res!217901 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402454))))

(declare-fun b!260204 () Bool)

(declare-fun lt!402457 () (_ BitVec 64))

(assert (=> b!260204 (= e!180602 (bvsle lt!402454 (bvmul lt!402457 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260204 (or (= lt!402457 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402457 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402457)))))

(assert (=> b!260204 (= lt!402457 ((_ sign_extend 32) (size!6230 (buf!6752 (_2!12093 lt!402392)))))))

(assert (= (and d!87266 res!217900) b!260203))

(assert (= (and b!260203 res!217901) b!260204))

(declare-fun m!389457 () Bool)

(assert (=> d!87266 m!389457))

(declare-fun m!389459 () Bool)

(assert (=> d!87266 m!389459))

(assert (=> b!260165 d!87266))

(declare-fun lt!402541 () tuple2!22314)

(declare-fun lt!402548 () tuple2!22314)

(declare-fun b!260246 () Bool)

(assert (=> b!260246 (= lt!402548 (checkBitsLoop!0 (_2!12093 lt!402541) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!402545 () Unit!18503)

(declare-fun lt!402546 () Unit!18503)

(assert (=> b!260246 (= lt!402545 lt!402546)))

(declare-fun lt!402547 () (_ BitVec 64))

(declare-fun lt!402551 () (_ BitVec 64))

(assert (=> b!260246 (validate_offset_bits!1 ((_ sign_extend 32) (size!6230 (buf!6752 (_2!12093 lt!402541)))) ((_ sign_extend 32) (currentByte!12420 (_2!12093 lt!402541))) ((_ sign_extend 32) (currentBit!12415 (_2!12093 lt!402541))) (bvsub lt!402547 lt!402551))))

(assert (=> b!260246 (= lt!402546 (validateOffsetBitsIneqLemma!0 (_2!12093 lt!402395) (_2!12093 lt!402541) lt!402547 lt!402551))))

(assert (=> b!260246 (= lt!402551 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!260246 (= lt!402547 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun e!180632 () tuple2!22314)

(assert (=> b!260246 (= e!180632 (tuple2!22315 (_1!12093 lt!402548) (_2!12093 lt!402548)))))

(declare-fun b!260247 () Bool)

(assert (=> b!260247 (= e!180632 (tuple2!22315 false (_2!12093 lt!402541)))))

(declare-fun b!260248 () Bool)

(declare-fun res!217938 () Bool)

(declare-fun e!180629 () Bool)

(assert (=> b!260248 (=> (not res!217938) (not e!180629))))

(declare-fun e!180630 () Bool)

(assert (=> b!260248 (= res!217938 e!180630)))

(declare-fun res!217936 () Bool)

(assert (=> b!260248 (=> res!217936 e!180630)))

(declare-fun lt!402550 () tuple2!22314)

(assert (=> b!260248 (= res!217936 (not (_1!12093 lt!402550)))))

(declare-fun b!260249 () Bool)

(declare-fun e!180631 () tuple2!22314)

(assert (=> b!260249 (= e!180631 (tuple2!22315 true (_2!12093 lt!402395)))))

(declare-fun b!260250 () Bool)

(declare-fun e!180628 () Bool)

(assert (=> b!260250 (= e!180629 e!180628)))

(declare-fun res!217939 () Bool)

(assert (=> b!260250 (=> res!217939 e!180628)))

(assert (=> b!260250 (= res!217939 (or (not (_1!12093 lt!402550)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!260251 () Bool)

(assert (=> b!260251 (= e!180628 (= expected!109 (_2!12094 (readBitPure!0 (_2!12093 lt!402395)))))))

(declare-fun b!260252 () Bool)

(declare-fun lt!402542 () (_ BitVec 64))

(assert (=> b!260252 (= e!180630 (= (bvsub lt!402542 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6230 (buf!6752 (_2!12093 lt!402550))) (currentByte!12420 (_2!12093 lt!402550)) (currentBit!12415 (_2!12093 lt!402550)))))))

(assert (=> b!260252 (or (= (bvand lt!402542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402542 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402549 () (_ BitVec 64))

(assert (=> b!260252 (= lt!402542 (bvadd lt!402549 nBits!535))))

(assert (=> b!260252 (or (not (= (bvand lt!402549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402549 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260252 (= lt!402549 (bitIndex!0 (size!6230 (buf!6752 (_2!12093 lt!402395))) (currentByte!12420 (_2!12093 lt!402395)) (currentBit!12415 (_2!12093 lt!402395))))))

(declare-fun d!87268 () Bool)

(assert (=> d!87268 e!180629))

(declare-fun res!217935 () Bool)

(assert (=> d!87268 (=> (not res!217935) (not e!180629))))

(declare-fun lt!402543 () (_ BitVec 64))

(assert (=> d!87268 (= res!217935 (bvsge (bvsub lt!402543 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6230 (buf!6752 (_2!12093 lt!402550))) (currentByte!12420 (_2!12093 lt!402550)) (currentBit!12415 (_2!12093 lt!402550)))))))

(assert (=> d!87268 (or (= (bvand lt!402543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402543 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402544 () (_ BitVec 64))

(assert (=> d!87268 (= lt!402543 (bvadd lt!402544 nBits!535))))

(assert (=> d!87268 (or (not (= (bvand lt!402544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402544 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87268 (= lt!402544 (bitIndex!0 (size!6230 (buf!6752 (_2!12093 lt!402395))) (currentByte!12420 (_2!12093 lt!402395)) (currentBit!12415 (_2!12093 lt!402395))))))

(assert (=> d!87268 (= lt!402550 e!180631)))

(declare-fun c!11973 () Bool)

(assert (=> d!87268 (= c!11973 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87268 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87268 (= (checkBitsLoop!0 (_2!12093 lt!402395) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!402550)))

(declare-fun b!260253 () Bool)

(declare-fun res!217937 () Bool)

(assert (=> b!260253 (=> (not res!217937) (not e!180629))))

(assert (=> b!260253 (= res!217937 (and (= (buf!6752 (_2!12093 lt!402395)) (buf!6752 (_2!12093 lt!402550))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12093 lt!402550))))))

(declare-fun b!260254 () Bool)

(assert (=> b!260254 (= e!180631 e!180632)))

(assert (=> b!260254 (= lt!402541 (readBit!0 (_2!12093 lt!402395)))))

(declare-fun c!11972 () Bool)

(assert (=> b!260254 (= c!11972 (not (= (_1!12093 lt!402541) expected!109)))))

(assert (= (and d!87268 c!11973) b!260249))

(assert (= (and d!87268 (not c!11973)) b!260254))

(assert (= (and b!260254 c!11972) b!260247))

(assert (= (and b!260254 (not c!11972)) b!260246))

(assert (= (and d!87268 res!217935) b!260253))

(assert (= (and b!260253 res!217937) b!260248))

(assert (= (and b!260248 (not res!217936)) b!260252))

(assert (= (and b!260248 res!217938) b!260250))

(assert (= (and b!260250 (not res!217939)) b!260251))

(declare-fun m!389493 () Bool)

(assert (=> b!260252 m!389493))

(declare-fun m!389495 () Bool)

(assert (=> b!260252 m!389495))

(declare-fun m!389497 () Bool)

(assert (=> b!260254 m!389497))

(assert (=> d!87268 m!389493))

(assert (=> d!87268 m!389495))

(declare-fun m!389499 () Bool)

(assert (=> b!260251 m!389499))

(declare-fun m!389501 () Bool)

(assert (=> b!260246 m!389501))

(declare-fun m!389503 () Bool)

(assert (=> b!260246 m!389503))

(declare-fun m!389505 () Bool)

(assert (=> b!260246 m!389505))

(assert (=> b!260165 d!87268))

(declare-fun d!87292 () Bool)

(assert (=> d!87292 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6230 (buf!6752 thiss!1754))) ((_ sign_extend 32) (currentByte!12420 thiss!1754)) ((_ sign_extend 32) (currentBit!12415 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6230 (buf!6752 thiss!1754))) ((_ sign_extend 32) (currentByte!12420 thiss!1754)) ((_ sign_extend 32) (currentBit!12415 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22108 () Bool)

(assert (= bs!22108 d!87292))

(assert (=> bs!22108 m!389451))

(assert (=> b!260170 d!87292))

(declare-fun d!87294 () Bool)

(assert (=> d!87294 (= (array_inv!5971 (buf!6752 thiss!1754)) (bvsge (size!6230 (buf!6752 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!260164 d!87294))

(declare-fun d!87296 () Bool)

(declare-fun e!180664 () Bool)

(assert (=> d!87296 e!180664))

(declare-fun res!217967 () Bool)

(assert (=> d!87296 (=> (not res!217967) (not e!180664))))

(declare-datatypes ((tuple2!22324 0))(
  ( (tuple2!22325 (_1!12098 Unit!18503) (_2!12098 BitStream!11382)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11382) tuple2!22324)

(assert (=> d!87296 (= res!217967 (= (buf!6752 (_2!12098 (increaseBitIndex!0 thiss!1754))) (buf!6752 thiss!1754)))))

(declare-fun lt!402621 () Bool)

(assert (=> d!87296 (= lt!402621 (not (= (bvand ((_ sign_extend 24) (select (arr!7217 (buf!6752 thiss!1754)) (currentByte!12420 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12415 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402624 () tuple2!22314)

(assert (=> d!87296 (= lt!402624 (tuple2!22315 (not (= (bvand ((_ sign_extend 24) (select (arr!7217 (buf!6752 thiss!1754)) (currentByte!12420 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12415 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12098 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87296 (validate_offset_bit!0 ((_ sign_extend 32) (size!6230 (buf!6752 thiss!1754))) ((_ sign_extend 32) (currentByte!12420 thiss!1754)) ((_ sign_extend 32) (currentBit!12415 thiss!1754)))))

(assert (=> d!87296 (= (readBit!0 thiss!1754) lt!402624)))

(declare-fun b!260302 () Bool)

(declare-fun lt!402626 () (_ BitVec 64))

(declare-fun lt!402623 () (_ BitVec 64))

(assert (=> b!260302 (= e!180664 (= (bitIndex!0 (size!6230 (buf!6752 (_2!12098 (increaseBitIndex!0 thiss!1754)))) (currentByte!12420 (_2!12098 (increaseBitIndex!0 thiss!1754))) (currentBit!12415 (_2!12098 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!402623 lt!402626)))))

(assert (=> b!260302 (or (not (= (bvand lt!402623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402626 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402623 lt!402626) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260302 (= lt!402626 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!260302 (= lt!402623 (bitIndex!0 (size!6230 (buf!6752 thiss!1754)) (currentByte!12420 thiss!1754) (currentBit!12415 thiss!1754)))))

(declare-fun lt!402622 () Bool)

(assert (=> b!260302 (= lt!402622 (not (= (bvand ((_ sign_extend 24) (select (arr!7217 (buf!6752 thiss!1754)) (currentByte!12420 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12415 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402627 () Bool)

(assert (=> b!260302 (= lt!402627 (not (= (bvand ((_ sign_extend 24) (select (arr!7217 (buf!6752 thiss!1754)) (currentByte!12420 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12415 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402625 () Bool)

(assert (=> b!260302 (= lt!402625 (not (= (bvand ((_ sign_extend 24) (select (arr!7217 (buf!6752 thiss!1754)) (currentByte!12420 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12415 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87296 res!217967) b!260302))

(declare-fun m!389521 () Bool)

(assert (=> d!87296 m!389521))

(declare-fun m!389523 () Bool)

(assert (=> d!87296 m!389523))

(declare-fun m!389525 () Bool)

(assert (=> d!87296 m!389525))

(declare-fun m!389527 () Bool)

(assert (=> d!87296 m!389527))

(assert (=> b!260302 m!389523))

(assert (=> b!260302 m!389525))

(declare-fun m!389529 () Bool)

(assert (=> b!260302 m!389529))

(assert (=> b!260302 m!389413))

(assert (=> b!260302 m!389521))

(assert (=> b!260169 d!87296))

(check-sat (not d!87256) (not d!87262) (not b!260252) (not d!87292) (not d!87266) (not d!87264) (not b!260254) (not b!260302) (not d!87296) (not d!87252) (not b!260246) (not b!260202) (not b!260251) (not d!87268) (not d!87260))
(check-sat)
