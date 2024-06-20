; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41842 () Bool)

(assert start!41842)

(declare-fun b!196907 () Bool)

(declare-fun res!164777 () Bool)

(declare-fun e!135290 () Bool)

(assert (=> b!196907 (=> (not res!164777) (not e!135290))))

(declare-datatypes ((array!10090 0))(
  ( (array!10091 (arr!5378 (Array (_ BitVec 32) (_ BitVec 8))) (size!4448 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8004 0))(
  ( (BitStream!8005 (buf!4934 array!10090) (currentByte!9263 (_ BitVec 32)) (currentBit!9258 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8004)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!196907 (= res!164777 (invariant!0 (currentBit!9258 thiss!1204) (currentByte!9263 thiss!1204) (size!4448 (buf!4934 thiss!1204))))))

(declare-fun b!196908 () Bool)

(declare-fun e!135284 () Bool)

(declare-fun array_inv!4189 (array!10090) Bool)

(assert (=> b!196908 (= e!135284 (array_inv!4189 (buf!4934 thiss!1204)))))

(declare-fun b!196909 () Bool)

(declare-fun res!164786 () Bool)

(declare-fun e!135283 () Bool)

(assert (=> b!196909 (=> res!164786 e!135283)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!306374 () (_ BitVec 64))

(declare-fun lt!306372 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((Unit!13928 0))(
  ( (Unit!13929) )
))
(declare-datatypes ((tuple2!17034 0))(
  ( (tuple2!17035 (_1!9162 Unit!13928) (_2!9162 BitStream!8004)) )
))
(declare-fun lt!306378 () tuple2!17034)

(assert (=> b!196909 (= res!164786 (or (not (= (size!4448 (buf!4934 (_2!9162 lt!306378))) (size!4448 (buf!4934 thiss!1204)))) (not (= lt!306372 (bvsub (bvadd lt!306374 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!196910 () Bool)

(declare-fun e!135288 () Bool)

(declare-fun e!135285 () Bool)

(assert (=> b!196910 (= e!135288 e!135285)))

(declare-fun res!164778 () Bool)

(assert (=> b!196910 (=> (not res!164778) (not e!135285))))

(declare-datatypes ((tuple2!17036 0))(
  ( (tuple2!17037 (_1!9163 BitStream!8004) (_2!9163 Bool)) )
))
(declare-fun lt!306377 () tuple2!17036)

(declare-fun lt!306373 () Bool)

(declare-fun lt!306371 () tuple2!17034)

(assert (=> b!196910 (= res!164778 (and (= (_2!9163 lt!306377) lt!306373) (= (_1!9163 lt!306377) (_2!9162 lt!306371))))))

(declare-fun readBitPure!0 (BitStream!8004) tuple2!17036)

(declare-fun readerFrom!0 (BitStream!8004 (_ BitVec 32) (_ BitVec 32)) BitStream!8004)

(assert (=> b!196910 (= lt!306377 (readBitPure!0 (readerFrom!0 (_2!9162 lt!306371) (currentBit!9258 thiss!1204) (currentByte!9263 thiss!1204))))))

(declare-fun b!196911 () Bool)

(declare-fun res!164783 () Bool)

(assert (=> b!196911 (=> (not res!164783) (not e!135288))))

(declare-fun isPrefixOf!0 (BitStream!8004 BitStream!8004) Bool)

(assert (=> b!196911 (= res!164783 (isPrefixOf!0 thiss!1204 (_2!9162 lt!306371)))))

(declare-fun b!196912 () Bool)

(declare-fun e!135289 () Bool)

(assert (=> b!196912 (= e!135289 e!135283)))

(declare-fun res!164787 () Bool)

(assert (=> b!196912 (=> res!164787 e!135283)))

(declare-fun lt!306379 () (_ BitVec 64))

(assert (=> b!196912 (= res!164787 (not (= lt!306372 (bvsub (bvsub (bvadd lt!306379 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196912 (= lt!306372 (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306378))) (currentByte!9263 (_2!9162 lt!306378)) (currentBit!9258 (_2!9162 lt!306378))))))

(assert (=> b!196912 (isPrefixOf!0 thiss!1204 (_2!9162 lt!306378))))

(declare-fun lt!306370 () Unit!13928)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8004 BitStream!8004 BitStream!8004) Unit!13928)

(assert (=> b!196912 (= lt!306370 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9162 lt!306371) (_2!9162 lt!306378)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8004 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17034)

(assert (=> b!196912 (= lt!306378 (appendBitsLSBFirstLoopTR!0 (_2!9162 lt!306371) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!196913 () Bool)

(declare-fun e!135286 () Bool)

(assert (=> b!196913 (= e!135286 e!135288)))

(declare-fun res!164780 () Bool)

(assert (=> b!196913 (=> (not res!164780) (not e!135288))))

(declare-fun lt!306375 () (_ BitVec 64))

(declare-fun lt!306376 () (_ BitVec 64))

(assert (=> b!196913 (= res!164780 (= lt!306375 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!306376)))))

(assert (=> b!196913 (= lt!306375 (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306371))) (currentByte!9263 (_2!9162 lt!306371)) (currentBit!9258 (_2!9162 lt!306371))))))

(assert (=> b!196913 (= lt!306376 (bitIndex!0 (size!4448 (buf!4934 thiss!1204)) (currentByte!9263 thiss!1204) (currentBit!9258 thiss!1204)))))

(declare-fun b!196914 () Bool)

(declare-fun res!164781 () Bool)

(assert (=> b!196914 (=> (not res!164781) (not e!135290))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196914 (= res!164781 (validate_offset_bits!1 ((_ sign_extend 32) (size!4448 (buf!4934 thiss!1204))) ((_ sign_extend 32) (currentByte!9263 thiss!1204)) ((_ sign_extend 32) (currentBit!9258 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!196915 () Bool)

(assert (=> b!196915 (= e!135290 (not e!135289))))

(declare-fun res!164779 () Bool)

(assert (=> b!196915 (=> res!164779 e!135289)))

(assert (=> b!196915 (= res!164779 (not (= lt!306379 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!306374))))))

(assert (=> b!196915 (= lt!306379 (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306371))) (currentByte!9263 (_2!9162 lt!306371)) (currentBit!9258 (_2!9162 lt!306371))))))

(assert (=> b!196915 (= lt!306374 (bitIndex!0 (size!4448 (buf!4934 thiss!1204)) (currentByte!9263 thiss!1204) (currentBit!9258 thiss!1204)))))

(assert (=> b!196915 e!135286))

(declare-fun res!164784 () Bool)

(assert (=> b!196915 (=> (not res!164784) (not e!135286))))

(assert (=> b!196915 (= res!164784 (= (size!4448 (buf!4934 thiss!1204)) (size!4448 (buf!4934 (_2!9162 lt!306371)))))))

(declare-fun appendBit!0 (BitStream!8004 Bool) tuple2!17034)

(assert (=> b!196915 (= lt!306371 (appendBit!0 thiss!1204 lt!306373))))

(assert (=> b!196915 (= lt!306373 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!196916 () Bool)

(assert (=> b!196916 (= e!135285 (= (bitIndex!0 (size!4448 (buf!4934 (_1!9163 lt!306377))) (currentByte!9263 (_1!9163 lt!306377)) (currentBit!9258 (_1!9163 lt!306377))) lt!306375))))

(declare-fun b!196917 () Bool)

(declare-fun res!164776 () Bool)

(assert (=> b!196917 (=> (not res!164776) (not e!135290))))

(assert (=> b!196917 (= res!164776 (not (= i!590 nBits!348)))))

(declare-fun res!164785 () Bool)

(assert (=> start!41842 (=> (not res!164785) (not e!135290))))

(assert (=> start!41842 (= res!164785 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41842 e!135290))

(assert (=> start!41842 true))

(declare-fun inv!12 (BitStream!8004) Bool)

(assert (=> start!41842 (and (inv!12 thiss!1204) e!135284)))

(declare-fun b!196918 () Bool)

(declare-fun res!164782 () Bool)

(assert (=> b!196918 (=> res!164782 e!135283)))

(assert (=> b!196918 (= res!164782 (not (invariant!0 (currentBit!9258 (_2!9162 lt!306378)) (currentByte!9263 (_2!9162 lt!306378)) (size!4448 (buf!4934 (_2!9162 lt!306378))))))))

(declare-fun b!196919 () Bool)

(assert (=> b!196919 (= e!135283 (isPrefixOf!0 (_2!9162 lt!306371) (_2!9162 lt!306378)))))

(assert (= (and start!41842 res!164785) b!196914))

(assert (= (and b!196914 res!164781) b!196907))

(assert (= (and b!196907 res!164777) b!196917))

(assert (= (and b!196917 res!164776) b!196915))

(assert (= (and b!196915 res!164784) b!196913))

(assert (= (and b!196913 res!164780) b!196911))

(assert (= (and b!196911 res!164783) b!196910))

(assert (= (and b!196910 res!164778) b!196916))

(assert (= (and b!196915 (not res!164779)) b!196912))

(assert (= (and b!196912 (not res!164787)) b!196918))

(assert (= (and b!196918 (not res!164782)) b!196909))

(assert (= (and b!196909 (not res!164786)) b!196919))

(assert (= start!41842 b!196908))

(declare-fun m!304413 () Bool)

(assert (=> b!196908 m!304413))

(declare-fun m!304415 () Bool)

(assert (=> b!196910 m!304415))

(assert (=> b!196910 m!304415))

(declare-fun m!304417 () Bool)

(assert (=> b!196910 m!304417))

(declare-fun m!304419 () Bool)

(assert (=> b!196911 m!304419))

(declare-fun m!304421 () Bool)

(assert (=> b!196907 m!304421))

(declare-fun m!304423 () Bool)

(assert (=> b!196914 m!304423))

(declare-fun m!304425 () Bool)

(assert (=> start!41842 m!304425))

(declare-fun m!304427 () Bool)

(assert (=> b!196912 m!304427))

(declare-fun m!304429 () Bool)

(assert (=> b!196912 m!304429))

(declare-fun m!304431 () Bool)

(assert (=> b!196912 m!304431))

(declare-fun m!304433 () Bool)

(assert (=> b!196912 m!304433))

(declare-fun m!304435 () Bool)

(assert (=> b!196919 m!304435))

(declare-fun m!304437 () Bool)

(assert (=> b!196913 m!304437))

(declare-fun m!304439 () Bool)

(assert (=> b!196913 m!304439))

(declare-fun m!304441 () Bool)

(assert (=> b!196916 m!304441))

(declare-fun m!304443 () Bool)

(assert (=> b!196918 m!304443))

(assert (=> b!196915 m!304437))

(assert (=> b!196915 m!304439))

(declare-fun m!304445 () Bool)

(assert (=> b!196915 m!304445))

(check-sat (not b!196912) (not start!41842) (not b!196914) (not b!196913) (not b!196907) (not b!196918) (not b!196911) (not b!196919) (not b!196915) (not b!196916) (not b!196908) (not b!196910))
(check-sat)
(get-model)

(declare-fun d!66545 () Bool)

(assert (=> d!66545 (= (array_inv!4189 (buf!4934 thiss!1204)) (bvsge (size!4448 (buf!4934 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!196908 d!66545))

(declare-fun d!66547 () Bool)

(declare-fun res!164832 () Bool)

(declare-fun e!135320 () Bool)

(assert (=> d!66547 (=> (not res!164832) (not e!135320))))

(assert (=> d!66547 (= res!164832 (= (size!4448 (buf!4934 (_2!9162 lt!306371))) (size!4448 (buf!4934 (_2!9162 lt!306378)))))))

(assert (=> d!66547 (= (isPrefixOf!0 (_2!9162 lt!306371) (_2!9162 lt!306378)) e!135320)))

(declare-fun b!196965 () Bool)

(declare-fun res!164831 () Bool)

(assert (=> b!196965 (=> (not res!164831) (not e!135320))))

(assert (=> b!196965 (= res!164831 (bvsle (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306371))) (currentByte!9263 (_2!9162 lt!306371)) (currentBit!9258 (_2!9162 lt!306371))) (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306378))) (currentByte!9263 (_2!9162 lt!306378)) (currentBit!9258 (_2!9162 lt!306378)))))))

(declare-fun b!196966 () Bool)

(declare-fun e!135319 () Bool)

(assert (=> b!196966 (= e!135320 e!135319)))

(declare-fun res!164830 () Bool)

(assert (=> b!196966 (=> res!164830 e!135319)))

(assert (=> b!196966 (= res!164830 (= (size!4448 (buf!4934 (_2!9162 lt!306371))) #b00000000000000000000000000000000))))

(declare-fun b!196967 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10090 array!10090 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196967 (= e!135319 (arrayBitRangesEq!0 (buf!4934 (_2!9162 lt!306371)) (buf!4934 (_2!9162 lt!306378)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306371))) (currentByte!9263 (_2!9162 lt!306371)) (currentBit!9258 (_2!9162 lt!306371)))))))

(assert (= (and d!66547 res!164832) b!196965))

(assert (= (and b!196965 res!164831) b!196966))

(assert (= (and b!196966 (not res!164830)) b!196967))

(assert (=> b!196965 m!304437))

(assert (=> b!196965 m!304427))

(assert (=> b!196967 m!304437))

(assert (=> b!196967 m!304437))

(declare-fun m!304481 () Bool)

(assert (=> b!196967 m!304481))

(assert (=> b!196919 d!66547))

(declare-fun d!66549 () Bool)

(declare-datatypes ((tuple2!17042 0))(
  ( (tuple2!17043 (_1!9166 Bool) (_2!9166 BitStream!8004)) )
))
(declare-fun lt!306412 () tuple2!17042)

(declare-fun readBit!0 (BitStream!8004) tuple2!17042)

(assert (=> d!66549 (= lt!306412 (readBit!0 (readerFrom!0 (_2!9162 lt!306371) (currentBit!9258 thiss!1204) (currentByte!9263 thiss!1204))))))

(assert (=> d!66549 (= (readBitPure!0 (readerFrom!0 (_2!9162 lt!306371) (currentBit!9258 thiss!1204) (currentByte!9263 thiss!1204))) (tuple2!17037 (_2!9166 lt!306412) (_1!9166 lt!306412)))))

(declare-fun bs!16530 () Bool)

(assert (= bs!16530 d!66549))

(assert (=> bs!16530 m!304415))

(declare-fun m!304483 () Bool)

(assert (=> bs!16530 m!304483))

(assert (=> b!196910 d!66549))

(declare-fun d!66551 () Bool)

(declare-fun e!135323 () Bool)

(assert (=> d!66551 e!135323))

(declare-fun res!164836 () Bool)

(assert (=> d!66551 (=> (not res!164836) (not e!135323))))

(assert (=> d!66551 (= res!164836 (invariant!0 (currentBit!9258 (_2!9162 lt!306371)) (currentByte!9263 (_2!9162 lt!306371)) (size!4448 (buf!4934 (_2!9162 lt!306371)))))))

(assert (=> d!66551 (= (readerFrom!0 (_2!9162 lt!306371) (currentBit!9258 thiss!1204) (currentByte!9263 thiss!1204)) (BitStream!8005 (buf!4934 (_2!9162 lt!306371)) (currentByte!9263 thiss!1204) (currentBit!9258 thiss!1204)))))

(declare-fun b!196970 () Bool)

(assert (=> b!196970 (= e!135323 (invariant!0 (currentBit!9258 thiss!1204) (currentByte!9263 thiss!1204) (size!4448 (buf!4934 (_2!9162 lt!306371)))))))

(assert (= (and d!66551 res!164836) b!196970))

(declare-fun m!304485 () Bool)

(assert (=> d!66551 m!304485))

(declare-fun m!304487 () Bool)

(assert (=> b!196970 m!304487))

(assert (=> b!196910 d!66551))

(declare-fun d!66553 () Bool)

(declare-fun res!164839 () Bool)

(declare-fun e!135325 () Bool)

(assert (=> d!66553 (=> (not res!164839) (not e!135325))))

(assert (=> d!66553 (= res!164839 (= (size!4448 (buf!4934 thiss!1204)) (size!4448 (buf!4934 (_2!9162 lt!306371)))))))

(assert (=> d!66553 (= (isPrefixOf!0 thiss!1204 (_2!9162 lt!306371)) e!135325)))

(declare-fun b!196971 () Bool)

(declare-fun res!164838 () Bool)

(assert (=> b!196971 (=> (not res!164838) (not e!135325))))

(assert (=> b!196971 (= res!164838 (bvsle (bitIndex!0 (size!4448 (buf!4934 thiss!1204)) (currentByte!9263 thiss!1204) (currentBit!9258 thiss!1204)) (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306371))) (currentByte!9263 (_2!9162 lt!306371)) (currentBit!9258 (_2!9162 lt!306371)))))))

(declare-fun b!196972 () Bool)

(declare-fun e!135324 () Bool)

(assert (=> b!196972 (= e!135325 e!135324)))

(declare-fun res!164837 () Bool)

(assert (=> b!196972 (=> res!164837 e!135324)))

(assert (=> b!196972 (= res!164837 (= (size!4448 (buf!4934 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!196973 () Bool)

(assert (=> b!196973 (= e!135324 (arrayBitRangesEq!0 (buf!4934 thiss!1204) (buf!4934 (_2!9162 lt!306371)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4448 (buf!4934 thiss!1204)) (currentByte!9263 thiss!1204) (currentBit!9258 thiss!1204))))))

(assert (= (and d!66553 res!164839) b!196971))

(assert (= (and b!196971 res!164838) b!196972))

(assert (= (and b!196972 (not res!164837)) b!196973))

(assert (=> b!196971 m!304439))

(assert (=> b!196971 m!304437))

(assert (=> b!196973 m!304439))

(assert (=> b!196973 m!304439))

(declare-fun m!304489 () Bool)

(assert (=> b!196973 m!304489))

(assert (=> b!196911 d!66553))

(declare-fun d!66555 () Bool)

(declare-fun e!135328 () Bool)

(assert (=> d!66555 e!135328))

(declare-fun res!164845 () Bool)

(assert (=> d!66555 (=> (not res!164845) (not e!135328))))

(declare-fun lt!306427 () (_ BitVec 64))

(declare-fun lt!306425 () (_ BitVec 64))

(declare-fun lt!306428 () (_ BitVec 64))

(assert (=> d!66555 (= res!164845 (= lt!306425 (bvsub lt!306427 lt!306428)))))

(assert (=> d!66555 (or (= (bvand lt!306427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306428 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306427 lt!306428) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66555 (= lt!306428 (remainingBits!0 ((_ sign_extend 32) (size!4448 (buf!4934 (_2!9162 lt!306378)))) ((_ sign_extend 32) (currentByte!9263 (_2!9162 lt!306378))) ((_ sign_extend 32) (currentBit!9258 (_2!9162 lt!306378)))))))

(declare-fun lt!306430 () (_ BitVec 64))

(declare-fun lt!306426 () (_ BitVec 64))

(assert (=> d!66555 (= lt!306427 (bvmul lt!306430 lt!306426))))

(assert (=> d!66555 (or (= lt!306430 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306426 (bvsdiv (bvmul lt!306430 lt!306426) lt!306430)))))

(assert (=> d!66555 (= lt!306426 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66555 (= lt!306430 ((_ sign_extend 32) (size!4448 (buf!4934 (_2!9162 lt!306378)))))))

(assert (=> d!66555 (= lt!306425 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9263 (_2!9162 lt!306378))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9258 (_2!9162 lt!306378)))))))

(assert (=> d!66555 (invariant!0 (currentBit!9258 (_2!9162 lt!306378)) (currentByte!9263 (_2!9162 lt!306378)) (size!4448 (buf!4934 (_2!9162 lt!306378))))))

(assert (=> d!66555 (= (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306378))) (currentByte!9263 (_2!9162 lt!306378)) (currentBit!9258 (_2!9162 lt!306378))) lt!306425)))

(declare-fun b!196978 () Bool)

(declare-fun res!164844 () Bool)

(assert (=> b!196978 (=> (not res!164844) (not e!135328))))

(assert (=> b!196978 (= res!164844 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306425))))

(declare-fun b!196979 () Bool)

(declare-fun lt!306429 () (_ BitVec 64))

(assert (=> b!196979 (= e!135328 (bvsle lt!306425 (bvmul lt!306429 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196979 (or (= lt!306429 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306429 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306429)))))

(assert (=> b!196979 (= lt!306429 ((_ sign_extend 32) (size!4448 (buf!4934 (_2!9162 lt!306378)))))))

(assert (= (and d!66555 res!164845) b!196978))

(assert (= (and b!196978 res!164844) b!196979))

(declare-fun m!304491 () Bool)

(assert (=> d!66555 m!304491))

(assert (=> d!66555 m!304443))

(assert (=> b!196912 d!66555))

(declare-fun d!66557 () Bool)

(declare-fun res!164848 () Bool)

(declare-fun e!135330 () Bool)

(assert (=> d!66557 (=> (not res!164848) (not e!135330))))

(assert (=> d!66557 (= res!164848 (= (size!4448 (buf!4934 thiss!1204)) (size!4448 (buf!4934 (_2!9162 lt!306378)))))))

(assert (=> d!66557 (= (isPrefixOf!0 thiss!1204 (_2!9162 lt!306378)) e!135330)))

(declare-fun b!196980 () Bool)

(declare-fun res!164847 () Bool)

(assert (=> b!196980 (=> (not res!164847) (not e!135330))))

(assert (=> b!196980 (= res!164847 (bvsle (bitIndex!0 (size!4448 (buf!4934 thiss!1204)) (currentByte!9263 thiss!1204) (currentBit!9258 thiss!1204)) (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306378))) (currentByte!9263 (_2!9162 lt!306378)) (currentBit!9258 (_2!9162 lt!306378)))))))

(declare-fun b!196981 () Bool)

(declare-fun e!135329 () Bool)

(assert (=> b!196981 (= e!135330 e!135329)))

(declare-fun res!164846 () Bool)

(assert (=> b!196981 (=> res!164846 e!135329)))

(assert (=> b!196981 (= res!164846 (= (size!4448 (buf!4934 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!196982 () Bool)

(assert (=> b!196982 (= e!135329 (arrayBitRangesEq!0 (buf!4934 thiss!1204) (buf!4934 (_2!9162 lt!306378)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4448 (buf!4934 thiss!1204)) (currentByte!9263 thiss!1204) (currentBit!9258 thiss!1204))))))

(assert (= (and d!66557 res!164848) b!196980))

(assert (= (and b!196980 res!164847) b!196981))

(assert (= (and b!196981 (not res!164846)) b!196982))

(assert (=> b!196980 m!304439))

(assert (=> b!196980 m!304427))

(assert (=> b!196982 m!304439))

(assert (=> b!196982 m!304439))

(declare-fun m!304493 () Bool)

(assert (=> b!196982 m!304493))

(assert (=> b!196912 d!66557))

(declare-fun d!66559 () Bool)

(assert (=> d!66559 (isPrefixOf!0 thiss!1204 (_2!9162 lt!306378))))

(declare-fun lt!306433 () Unit!13928)

(declare-fun choose!30 (BitStream!8004 BitStream!8004 BitStream!8004) Unit!13928)

(assert (=> d!66559 (= lt!306433 (choose!30 thiss!1204 (_2!9162 lt!306371) (_2!9162 lt!306378)))))

(assert (=> d!66559 (isPrefixOf!0 thiss!1204 (_2!9162 lt!306371))))

(assert (=> d!66559 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9162 lt!306371) (_2!9162 lt!306378)) lt!306433)))

(declare-fun bs!16531 () Bool)

(assert (= bs!16531 d!66559))

(assert (=> bs!16531 m!304429))

(declare-fun m!304495 () Bool)

(assert (=> bs!16531 m!304495))

(assert (=> bs!16531 m!304419))

(assert (=> b!196912 d!66559))

(declare-fun b!197047 () Bool)

(declare-fun lt!306629 () tuple2!17036)

(declare-fun lt!306607 () tuple2!17034)

(assert (=> b!197047 (= lt!306629 (readBitPure!0 (readerFrom!0 (_2!9162 lt!306607) (currentBit!9258 (_2!9162 lt!306371)) (currentByte!9263 (_2!9162 lt!306371)))))))

(declare-fun lt!306615 () Bool)

(declare-fun res!164910 () Bool)

(assert (=> b!197047 (= res!164910 (and (= (_2!9163 lt!306629) lt!306615) (= (_1!9163 lt!306629) (_2!9162 lt!306607))))))

(declare-fun e!135370 () Bool)

(assert (=> b!197047 (=> (not res!164910) (not e!135370))))

(declare-fun e!135368 () Bool)

(assert (=> b!197047 (= e!135368 e!135370)))

(declare-fun d!66561 () Bool)

(declare-fun e!135369 () Bool)

(assert (=> d!66561 e!135369))

(declare-fun res!164907 () Bool)

(assert (=> d!66561 (=> (not res!164907) (not e!135369))))

(declare-fun lt!306628 () tuple2!17034)

(assert (=> d!66561 (= res!164907 (invariant!0 (currentBit!9258 (_2!9162 lt!306628)) (currentByte!9263 (_2!9162 lt!306628)) (size!4448 (buf!4934 (_2!9162 lt!306628)))))))

(declare-fun e!135374 () tuple2!17034)

(assert (=> d!66561 (= lt!306628 e!135374)))

(declare-fun c!9798 () Bool)

(assert (=> d!66561 (= c!9798 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66561 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66561 (= (appendBitsLSBFirstLoopTR!0 (_2!9162 lt!306371) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!306628)))

(declare-fun b!197048 () Bool)

(declare-fun e!135372 () Bool)

(declare-datatypes ((tuple2!17044 0))(
  ( (tuple2!17045 (_1!9167 BitStream!8004) (_2!9167 (_ BitVec 64))) )
))
(declare-fun lt!306597 () tuple2!17044)

(declare-datatypes ((tuple2!17046 0))(
  ( (tuple2!17047 (_1!9168 BitStream!8004) (_2!9168 BitStream!8004)) )
))
(declare-fun lt!306596 () tuple2!17046)

(assert (=> b!197048 (= e!135372 (= (_1!9167 lt!306597) (_2!9168 lt!306596)))))

(declare-fun b!197049 () Bool)

(declare-fun res!164905 () Bool)

(assert (=> b!197049 (=> (not res!164905) (not e!135369))))

(assert (=> b!197049 (= res!164905 (isPrefixOf!0 (_2!9162 lt!306371) (_2!9162 lt!306628)))))

(declare-fun b!197050 () Bool)

(declare-fun res!164914 () Bool)

(assert (=> b!197050 (=> (not res!164914) (not e!135369))))

(declare-fun lt!306633 () (_ BitVec 64))

(declare-fun lt!306634 () (_ BitVec 64))

(assert (=> b!197050 (= res!164914 (= (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306628))) (currentByte!9263 (_2!9162 lt!306628)) (currentBit!9258 (_2!9162 lt!306628))) (bvsub lt!306634 lt!306633)))))

(assert (=> b!197050 (or (= (bvand lt!306634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306633 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306634 lt!306633) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197050 (= lt!306633 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!306601 () (_ BitVec 64))

(declare-fun lt!306613 () (_ BitVec 64))

(assert (=> b!197050 (= lt!306634 (bvadd lt!306601 lt!306613))))

(assert (=> b!197050 (or (not (= (bvand lt!306601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306613 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!306601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!306601 lt!306613) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197050 (= lt!306613 ((_ sign_extend 32) nBits!348))))

(assert (=> b!197050 (= lt!306601 (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306371))) (currentByte!9263 (_2!9162 lt!306371)) (currentBit!9258 (_2!9162 lt!306371))))))

(declare-fun b!197051 () Bool)

(declare-fun res!164913 () Bool)

(assert (=> b!197051 (=> (not res!164913) (not e!135369))))

(assert (=> b!197051 (= res!164913 (= (size!4448 (buf!4934 (_2!9162 lt!306371))) (size!4448 (buf!4934 (_2!9162 lt!306628)))))))

(declare-fun b!197052 () Bool)

(declare-fun e!135373 () (_ BitVec 64))

(assert (=> b!197052 (= e!135373 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!197053 () Bool)

(declare-fun e!135375 () Bool)

(declare-fun lt!306618 () tuple2!17044)

(declare-fun lt!306604 () tuple2!17046)

(assert (=> b!197053 (= e!135375 (= (_1!9167 lt!306618) (_2!9168 lt!306604)))))

(declare-fun b!197054 () Bool)

(declare-fun Unit!13932 () Unit!13928)

(assert (=> b!197054 (= e!135374 (tuple2!17035 Unit!13932 (_2!9162 lt!306371)))))

(declare-fun lt!306631 () Unit!13928)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8004) Unit!13928)

(assert (=> b!197054 (= lt!306631 (lemmaIsPrefixRefl!0 (_2!9162 lt!306371)))))

(declare-fun call!3095 () Bool)

(assert (=> b!197054 call!3095))

(declare-fun lt!306595 () Unit!13928)

(assert (=> b!197054 (= lt!306595 lt!306631)))

(declare-fun b!197055 () Bool)

(assert (=> b!197055 (= e!135369 e!135372)))

(declare-fun res!164906 () Bool)

(assert (=> b!197055 (=> (not res!164906) (not e!135372))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!197055 (= res!164906 (= (_2!9167 lt!306597) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17044)

(assert (=> b!197055 (= lt!306597 (readNBitsLSBFirstsLoopPure!0 (_1!9168 lt!306596) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!306606 () Unit!13928)

(declare-fun lt!306635 () Unit!13928)

(assert (=> b!197055 (= lt!306606 lt!306635)))

(declare-fun lt!306647 () (_ BitVec 64))

(assert (=> b!197055 (validate_offset_bits!1 ((_ sign_extend 32) (size!4448 (buf!4934 (_2!9162 lt!306628)))) ((_ sign_extend 32) (currentByte!9263 (_2!9162 lt!306371))) ((_ sign_extend 32) (currentBit!9258 (_2!9162 lt!306371))) lt!306647)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8004 array!10090 (_ BitVec 64)) Unit!13928)

(assert (=> b!197055 (= lt!306635 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9162 lt!306371) (buf!4934 (_2!9162 lt!306628)) lt!306647))))

(declare-fun e!135371 () Bool)

(assert (=> b!197055 e!135371))

(declare-fun res!164909 () Bool)

(assert (=> b!197055 (=> (not res!164909) (not e!135371))))

(assert (=> b!197055 (= res!164909 (and (= (size!4448 (buf!4934 (_2!9162 lt!306371))) (size!4448 (buf!4934 (_2!9162 lt!306628)))) (bvsge lt!306647 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197055 (= lt!306647 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!197055 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8004 BitStream!8004) tuple2!17046)

(assert (=> b!197055 (= lt!306596 (reader!0 (_2!9162 lt!306371) (_2!9162 lt!306628)))))

(declare-fun b!197056 () Bool)

(declare-fun e!135376 () Bool)

(declare-fun lt!306641 () tuple2!17036)

(declare-fun lt!306625 () tuple2!17036)

(assert (=> b!197056 (= e!135376 (= (_2!9163 lt!306641) (_2!9163 lt!306625)))))

(declare-fun b!197057 () Bool)

(declare-fun res!164912 () Bool)

(assert (=> b!197057 (= res!164912 call!3095)))

(assert (=> b!197057 (=> (not res!164912) (not e!135368))))

(declare-fun b!197058 () Bool)

(declare-fun res!164908 () Bool)

(assert (=> b!197058 (= res!164908 (= (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306607))) (currentByte!9263 (_2!9162 lt!306607)) (currentBit!9258 (_2!9162 lt!306607))) (bvadd (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306371))) (currentByte!9263 (_2!9162 lt!306371)) (currentBit!9258 (_2!9162 lt!306371))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!197058 (=> (not res!164908) (not e!135368))))

(declare-fun b!197059 () Bool)

(assert (=> b!197059 (= e!135371 (validate_offset_bits!1 ((_ sign_extend 32) (size!4448 (buf!4934 (_2!9162 lt!306371)))) ((_ sign_extend 32) (currentByte!9263 (_2!9162 lt!306371))) ((_ sign_extend 32) (currentBit!9258 (_2!9162 lt!306371))) lt!306647))))

(declare-fun bm!3092 () Bool)

(assert (=> bm!3092 (= call!3095 (isPrefixOf!0 (_2!9162 lt!306371) (ite c!9798 (_2!9162 lt!306371) (_2!9162 lt!306607))))))

(declare-fun b!197060 () Bool)

(assert (=> b!197060 (= e!135370 (= (bitIndex!0 (size!4448 (buf!4934 (_1!9163 lt!306629))) (currentByte!9263 (_1!9163 lt!306629)) (currentBit!9258 (_1!9163 lt!306629))) (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306607))) (currentByte!9263 (_2!9162 lt!306607)) (currentBit!9258 (_2!9162 lt!306607)))))))

(declare-fun b!197061 () Bool)

(declare-fun lt!306638 () tuple2!17034)

(assert (=> b!197061 (= e!135374 (tuple2!17035 (_1!9162 lt!306638) (_2!9162 lt!306638)))))

(assert (=> b!197061 (= lt!306615 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197061 (= lt!306607 (appendBit!0 (_2!9162 lt!306371) lt!306615))))

(declare-fun res!164915 () Bool)

(assert (=> b!197061 (= res!164915 (= (size!4448 (buf!4934 (_2!9162 lt!306371))) (size!4448 (buf!4934 (_2!9162 lt!306607)))))))

(assert (=> b!197061 (=> (not res!164915) (not e!135368))))

(assert (=> b!197061 e!135368))

(declare-fun lt!306624 () tuple2!17034)

(assert (=> b!197061 (= lt!306624 lt!306607)))

(assert (=> b!197061 (= lt!306638 (appendBitsLSBFirstLoopTR!0 (_2!9162 lt!306624) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!306621 () Unit!13928)

(assert (=> b!197061 (= lt!306621 (lemmaIsPrefixTransitive!0 (_2!9162 lt!306371) (_2!9162 lt!306624) (_2!9162 lt!306638)))))

(assert (=> b!197061 (isPrefixOf!0 (_2!9162 lt!306371) (_2!9162 lt!306638))))

(declare-fun lt!306627 () Unit!13928)

(assert (=> b!197061 (= lt!306627 lt!306621)))

(assert (=> b!197061 (invariant!0 (currentBit!9258 (_2!9162 lt!306371)) (currentByte!9263 (_2!9162 lt!306371)) (size!4448 (buf!4934 (_2!9162 lt!306624))))))

(declare-fun lt!306642 () BitStream!8004)

(assert (=> b!197061 (= lt!306642 (BitStream!8005 (buf!4934 (_2!9162 lt!306624)) (currentByte!9263 (_2!9162 lt!306371)) (currentBit!9258 (_2!9162 lt!306371))))))

(assert (=> b!197061 (invariant!0 (currentBit!9258 lt!306642) (currentByte!9263 lt!306642) (size!4448 (buf!4934 (_2!9162 lt!306638))))))

(declare-fun lt!306617 () BitStream!8004)

(assert (=> b!197061 (= lt!306617 (BitStream!8005 (buf!4934 (_2!9162 lt!306638)) (currentByte!9263 lt!306642) (currentBit!9258 lt!306642)))))

(assert (=> b!197061 (= lt!306641 (readBitPure!0 lt!306642))))

(assert (=> b!197061 (= lt!306625 (readBitPure!0 lt!306617))))

(declare-fun lt!306626 () Unit!13928)

(declare-fun readBitPrefixLemma!0 (BitStream!8004 BitStream!8004) Unit!13928)

(assert (=> b!197061 (= lt!306626 (readBitPrefixLemma!0 lt!306642 (_2!9162 lt!306638)))))

(declare-fun res!164911 () Bool)

(assert (=> b!197061 (= res!164911 (= (bitIndex!0 (size!4448 (buf!4934 (_1!9163 lt!306641))) (currentByte!9263 (_1!9163 lt!306641)) (currentBit!9258 (_1!9163 lt!306641))) (bitIndex!0 (size!4448 (buf!4934 (_1!9163 lt!306625))) (currentByte!9263 (_1!9163 lt!306625)) (currentBit!9258 (_1!9163 lt!306625)))))))

(assert (=> b!197061 (=> (not res!164911) (not e!135376))))

(assert (=> b!197061 e!135376))

(declare-fun lt!306612 () Unit!13928)

(assert (=> b!197061 (= lt!306612 lt!306626)))

(declare-fun lt!306643 () tuple2!17046)

(assert (=> b!197061 (= lt!306643 (reader!0 (_2!9162 lt!306371) (_2!9162 lt!306638)))))

(declare-fun lt!306623 () tuple2!17046)

(assert (=> b!197061 (= lt!306623 (reader!0 (_2!9162 lt!306624) (_2!9162 lt!306638)))))

(declare-fun lt!306648 () tuple2!17036)

(assert (=> b!197061 (= lt!306648 (readBitPure!0 (_1!9168 lt!306643)))))

(assert (=> b!197061 (= (_2!9163 lt!306648) lt!306615)))

(declare-fun lt!306649 () Unit!13928)

(declare-fun Unit!13933 () Unit!13928)

(assert (=> b!197061 (= lt!306649 Unit!13933)))

(declare-fun lt!306637 () (_ BitVec 64))

(assert (=> b!197061 (= lt!306637 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306644 () (_ BitVec 64))

(assert (=> b!197061 (= lt!306644 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306640 () Unit!13928)

(assert (=> b!197061 (= lt!306640 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9162 lt!306371) (buf!4934 (_2!9162 lt!306638)) lt!306644))))

(assert (=> b!197061 (validate_offset_bits!1 ((_ sign_extend 32) (size!4448 (buf!4934 (_2!9162 lt!306638)))) ((_ sign_extend 32) (currentByte!9263 (_2!9162 lt!306371))) ((_ sign_extend 32) (currentBit!9258 (_2!9162 lt!306371))) lt!306644)))

(declare-fun lt!306598 () Unit!13928)

(assert (=> b!197061 (= lt!306598 lt!306640)))

(declare-fun lt!306599 () tuple2!17044)

(assert (=> b!197061 (= lt!306599 (readNBitsLSBFirstsLoopPure!0 (_1!9168 lt!306643) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!306637))))

(declare-fun lt!306605 () (_ BitVec 64))

(assert (=> b!197061 (= lt!306605 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!306630 () Unit!13928)

(assert (=> b!197061 (= lt!306630 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9162 lt!306624) (buf!4934 (_2!9162 lt!306638)) lt!306605))))

(assert (=> b!197061 (validate_offset_bits!1 ((_ sign_extend 32) (size!4448 (buf!4934 (_2!9162 lt!306638)))) ((_ sign_extend 32) (currentByte!9263 (_2!9162 lt!306624))) ((_ sign_extend 32) (currentBit!9258 (_2!9162 lt!306624))) lt!306605)))

(declare-fun lt!306639 () Unit!13928)

(assert (=> b!197061 (= lt!306639 lt!306630)))

(declare-fun lt!306616 () tuple2!17044)

(assert (=> b!197061 (= lt!306616 (readNBitsLSBFirstsLoopPure!0 (_1!9168 lt!306623) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!306637 (ite (_2!9163 lt!306648) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!306608 () tuple2!17044)

(assert (=> b!197061 (= lt!306608 (readNBitsLSBFirstsLoopPure!0 (_1!9168 lt!306643) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!306637))))

(declare-fun c!9799 () Bool)

(assert (=> b!197061 (= c!9799 (_2!9163 (readBitPure!0 (_1!9168 lt!306643))))))

(declare-fun lt!306620 () tuple2!17044)

(declare-fun withMovedBitIndex!0 (BitStream!8004 (_ BitVec 64)) BitStream!8004)

(assert (=> b!197061 (= lt!306620 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9168 lt!306643) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!306637 e!135373)))))

(declare-fun lt!306611 () Unit!13928)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13928)

(assert (=> b!197061 (= lt!306611 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9168 lt!306643) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!306637))))

(assert (=> b!197061 (and (= (_2!9167 lt!306608) (_2!9167 lt!306620)) (= (_1!9167 lt!306608) (_1!9167 lt!306620)))))

(declare-fun lt!306645 () Unit!13928)

(assert (=> b!197061 (= lt!306645 lt!306611)))

(assert (=> b!197061 (= (_1!9168 lt!306643) (withMovedBitIndex!0 (_2!9168 lt!306643) (bvsub (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306371))) (currentByte!9263 (_2!9162 lt!306371)) (currentBit!9258 (_2!9162 lt!306371))) (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306638))) (currentByte!9263 (_2!9162 lt!306638)) (currentBit!9258 (_2!9162 lt!306638))))))))

(declare-fun lt!306632 () Unit!13928)

(declare-fun Unit!13934 () Unit!13928)

(assert (=> b!197061 (= lt!306632 Unit!13934)))

(assert (=> b!197061 (= (_1!9168 lt!306623) (withMovedBitIndex!0 (_2!9168 lt!306623) (bvsub (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306624))) (currentByte!9263 (_2!9162 lt!306624)) (currentBit!9258 (_2!9162 lt!306624))) (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306638))) (currentByte!9263 (_2!9162 lt!306638)) (currentBit!9258 (_2!9162 lt!306638))))))))

(declare-fun lt!306609 () Unit!13928)

(declare-fun Unit!13935 () Unit!13928)

(assert (=> b!197061 (= lt!306609 Unit!13935)))

(assert (=> b!197061 (= (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306371))) (currentByte!9263 (_2!9162 lt!306371)) (currentBit!9258 (_2!9162 lt!306371))) (bvsub (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306624))) (currentByte!9263 (_2!9162 lt!306624)) (currentBit!9258 (_2!9162 lt!306624))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!306622 () Unit!13928)

(declare-fun Unit!13936 () Unit!13928)

(assert (=> b!197061 (= lt!306622 Unit!13936)))

(assert (=> b!197061 (= (_2!9167 lt!306599) (_2!9167 lt!306616))))

(declare-fun lt!306610 () Unit!13928)

(declare-fun Unit!13937 () Unit!13928)

(assert (=> b!197061 (= lt!306610 Unit!13937)))

(assert (=> b!197061 (invariant!0 (currentBit!9258 (_2!9162 lt!306638)) (currentByte!9263 (_2!9162 lt!306638)) (size!4448 (buf!4934 (_2!9162 lt!306638))))))

(declare-fun lt!306603 () Unit!13928)

(declare-fun Unit!13938 () Unit!13928)

(assert (=> b!197061 (= lt!306603 Unit!13938)))

(assert (=> b!197061 (= (size!4448 (buf!4934 (_2!9162 lt!306371))) (size!4448 (buf!4934 (_2!9162 lt!306638))))))

(declare-fun lt!306594 () Unit!13928)

(declare-fun Unit!13939 () Unit!13928)

(assert (=> b!197061 (= lt!306594 Unit!13939)))

(assert (=> b!197061 (= (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306638))) (currentByte!9263 (_2!9162 lt!306638)) (currentBit!9258 (_2!9162 lt!306638))) (bvsub (bvadd (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306371))) (currentByte!9263 (_2!9162 lt!306371)) (currentBit!9258 (_2!9162 lt!306371))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306602 () Unit!13928)

(declare-fun Unit!13940 () Unit!13928)

(assert (=> b!197061 (= lt!306602 Unit!13940)))

(declare-fun lt!306619 () Unit!13928)

(declare-fun Unit!13941 () Unit!13928)

(assert (=> b!197061 (= lt!306619 Unit!13941)))

(assert (=> b!197061 (= lt!306604 (reader!0 (_2!9162 lt!306371) (_2!9162 lt!306638)))))

(declare-fun lt!306600 () (_ BitVec 64))

(assert (=> b!197061 (= lt!306600 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306646 () Unit!13928)

(assert (=> b!197061 (= lt!306646 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9162 lt!306371) (buf!4934 (_2!9162 lt!306638)) lt!306600))))

(assert (=> b!197061 (validate_offset_bits!1 ((_ sign_extend 32) (size!4448 (buf!4934 (_2!9162 lt!306638)))) ((_ sign_extend 32) (currentByte!9263 (_2!9162 lt!306371))) ((_ sign_extend 32) (currentBit!9258 (_2!9162 lt!306371))) lt!306600)))

(declare-fun lt!306614 () Unit!13928)

(assert (=> b!197061 (= lt!306614 lt!306646)))

(assert (=> b!197061 (= lt!306618 (readNBitsLSBFirstsLoopPure!0 (_1!9168 lt!306604) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!164916 () Bool)

(assert (=> b!197061 (= res!164916 (= (_2!9167 lt!306618) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!197061 (=> (not res!164916) (not e!135375))))

(assert (=> b!197061 e!135375))

(declare-fun lt!306636 () Unit!13928)

(declare-fun Unit!13942 () Unit!13928)

(assert (=> b!197061 (= lt!306636 Unit!13942)))

(declare-fun b!197062 () Bool)

(assert (=> b!197062 (= e!135373 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (= (and d!66561 c!9798) b!197054))

(assert (= (and d!66561 (not c!9798)) b!197061))

(assert (= (and b!197061 res!164915) b!197058))

(assert (= (and b!197058 res!164908) b!197057))

(assert (= (and b!197057 res!164912) b!197047))

(assert (= (and b!197047 res!164910) b!197060))

(assert (= (and b!197061 res!164911) b!197056))

(assert (= (and b!197061 c!9799) b!197062))

(assert (= (and b!197061 (not c!9799)) b!197052))

(assert (= (and b!197061 res!164916) b!197053))

(assert (= (or b!197054 b!197057) bm!3092))

(assert (= (and d!66561 res!164907) b!197051))

(assert (= (and b!197051 res!164913) b!197050))

(assert (= (and b!197050 res!164914) b!197049))

(assert (= (and b!197049 res!164905) b!197055))

(assert (= (and b!197055 res!164909) b!197059))

(assert (= (and b!197055 res!164906) b!197048))

(declare-fun m!304513 () Bool)

(assert (=> b!197049 m!304513))

(declare-fun m!304515 () Bool)

(assert (=> b!197059 m!304515))

(declare-fun m!304517 () Bool)

(assert (=> b!197055 m!304517))

(declare-fun m!304519 () Bool)

(assert (=> b!197055 m!304519))

(declare-fun m!304521 () Bool)

(assert (=> b!197055 m!304521))

(declare-fun m!304523 () Bool)

(assert (=> b!197055 m!304523))

(declare-fun m!304525 () Bool)

(assert (=> b!197055 m!304525))

(declare-fun m!304527 () Bool)

(assert (=> b!197055 m!304527))

(declare-fun m!304529 () Bool)

(assert (=> b!197054 m!304529))

(declare-fun m!304531 () Bool)

(assert (=> bm!3092 m!304531))

(declare-fun m!304533 () Bool)

(assert (=> d!66561 m!304533))

(declare-fun m!304535 () Bool)

(assert (=> b!197050 m!304535))

(assert (=> b!197050 m!304437))

(declare-fun m!304537 () Bool)

(assert (=> b!197047 m!304537))

(assert (=> b!197047 m!304537))

(declare-fun m!304539 () Bool)

(assert (=> b!197047 m!304539))

(declare-fun m!304541 () Bool)

(assert (=> b!197061 m!304541))

(declare-fun m!304543 () Bool)

(assert (=> b!197061 m!304543))

(declare-fun m!304545 () Bool)

(assert (=> b!197061 m!304545))

(declare-fun m!304547 () Bool)

(assert (=> b!197061 m!304547))

(declare-fun m!304549 () Bool)

(assert (=> b!197061 m!304549))

(declare-fun m!304551 () Bool)

(assert (=> b!197061 m!304551))

(declare-fun m!304553 () Bool)

(assert (=> b!197061 m!304553))

(declare-fun m!304555 () Bool)

(assert (=> b!197061 m!304555))

(declare-fun m!304557 () Bool)

(assert (=> b!197061 m!304557))

(declare-fun m!304559 () Bool)

(assert (=> b!197061 m!304559))

(declare-fun m!304561 () Bool)

(assert (=> b!197061 m!304561))

(declare-fun m!304563 () Bool)

(assert (=> b!197061 m!304563))

(declare-fun m!304565 () Bool)

(assert (=> b!197061 m!304565))

(declare-fun m!304567 () Bool)

(assert (=> b!197061 m!304567))

(declare-fun m!304569 () Bool)

(assert (=> b!197061 m!304569))

(declare-fun m!304571 () Bool)

(assert (=> b!197061 m!304571))

(declare-fun m!304573 () Bool)

(assert (=> b!197061 m!304573))

(declare-fun m!304575 () Bool)

(assert (=> b!197061 m!304575))

(declare-fun m!304577 () Bool)

(assert (=> b!197061 m!304577))

(declare-fun m!304579 () Bool)

(assert (=> b!197061 m!304579))

(declare-fun m!304581 () Bool)

(assert (=> b!197061 m!304581))

(assert (=> b!197061 m!304527))

(declare-fun m!304583 () Bool)

(assert (=> b!197061 m!304583))

(declare-fun m!304585 () Bool)

(assert (=> b!197061 m!304585))

(declare-fun m!304587 () Bool)

(assert (=> b!197061 m!304587))

(declare-fun m!304589 () Bool)

(assert (=> b!197061 m!304589))

(declare-fun m!304591 () Bool)

(assert (=> b!197061 m!304591))

(declare-fun m!304593 () Bool)

(assert (=> b!197061 m!304593))

(declare-fun m!304595 () Bool)

(assert (=> b!197061 m!304595))

(declare-fun m!304597 () Bool)

(assert (=> b!197061 m!304597))

(assert (=> b!197061 m!304437))

(assert (=> b!197061 m!304523))

(assert (=> b!197061 m!304555))

(declare-fun m!304599 () Bool)

(assert (=> b!197061 m!304599))

(declare-fun m!304601 () Bool)

(assert (=> b!197061 m!304601))

(declare-fun m!304603 () Bool)

(assert (=> b!197058 m!304603))

(assert (=> b!197058 m!304437))

(declare-fun m!304605 () Bool)

(assert (=> b!197060 m!304605))

(assert (=> b!197060 m!304603))

(assert (=> b!196912 d!66561))

(declare-fun d!66583 () Bool)

(declare-fun e!135377 () Bool)

(assert (=> d!66583 e!135377))

(declare-fun res!164918 () Bool)

(assert (=> d!66583 (=> (not res!164918) (not e!135377))))

(declare-fun lt!306653 () (_ BitVec 64))

(declare-fun lt!306650 () (_ BitVec 64))

(declare-fun lt!306652 () (_ BitVec 64))

(assert (=> d!66583 (= res!164918 (= lt!306650 (bvsub lt!306652 lt!306653)))))

(assert (=> d!66583 (or (= (bvand lt!306652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306653 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306652 lt!306653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66583 (= lt!306653 (remainingBits!0 ((_ sign_extend 32) (size!4448 (buf!4934 (_2!9162 lt!306371)))) ((_ sign_extend 32) (currentByte!9263 (_2!9162 lt!306371))) ((_ sign_extend 32) (currentBit!9258 (_2!9162 lt!306371)))))))

(declare-fun lt!306655 () (_ BitVec 64))

(declare-fun lt!306651 () (_ BitVec 64))

(assert (=> d!66583 (= lt!306652 (bvmul lt!306655 lt!306651))))

(assert (=> d!66583 (or (= lt!306655 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306651 (bvsdiv (bvmul lt!306655 lt!306651) lt!306655)))))

(assert (=> d!66583 (= lt!306651 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66583 (= lt!306655 ((_ sign_extend 32) (size!4448 (buf!4934 (_2!9162 lt!306371)))))))

(assert (=> d!66583 (= lt!306650 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9263 (_2!9162 lt!306371))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9258 (_2!9162 lt!306371)))))))

(assert (=> d!66583 (invariant!0 (currentBit!9258 (_2!9162 lt!306371)) (currentByte!9263 (_2!9162 lt!306371)) (size!4448 (buf!4934 (_2!9162 lt!306371))))))

(assert (=> d!66583 (= (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306371))) (currentByte!9263 (_2!9162 lt!306371)) (currentBit!9258 (_2!9162 lt!306371))) lt!306650)))

(declare-fun b!197063 () Bool)

(declare-fun res!164917 () Bool)

(assert (=> b!197063 (=> (not res!164917) (not e!135377))))

(assert (=> b!197063 (= res!164917 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306650))))

(declare-fun b!197064 () Bool)

(declare-fun lt!306654 () (_ BitVec 64))

(assert (=> b!197064 (= e!135377 (bvsle lt!306650 (bvmul lt!306654 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197064 (or (= lt!306654 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306654 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306654)))))

(assert (=> b!197064 (= lt!306654 ((_ sign_extend 32) (size!4448 (buf!4934 (_2!9162 lt!306371)))))))

(assert (= (and d!66583 res!164918) b!197063))

(assert (= (and b!197063 res!164917) b!197064))

(declare-fun m!304607 () Bool)

(assert (=> d!66583 m!304607))

(assert (=> d!66583 m!304485))

(assert (=> b!196913 d!66583))

(declare-fun d!66585 () Bool)

(declare-fun e!135378 () Bool)

(assert (=> d!66585 e!135378))

(declare-fun res!164920 () Bool)

(assert (=> d!66585 (=> (not res!164920) (not e!135378))))

(declare-fun lt!306659 () (_ BitVec 64))

(declare-fun lt!306658 () (_ BitVec 64))

(declare-fun lt!306656 () (_ BitVec 64))

(assert (=> d!66585 (= res!164920 (= lt!306656 (bvsub lt!306658 lt!306659)))))

(assert (=> d!66585 (or (= (bvand lt!306658 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306659 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306658 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306658 lt!306659) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66585 (= lt!306659 (remainingBits!0 ((_ sign_extend 32) (size!4448 (buf!4934 thiss!1204))) ((_ sign_extend 32) (currentByte!9263 thiss!1204)) ((_ sign_extend 32) (currentBit!9258 thiss!1204))))))

(declare-fun lt!306661 () (_ BitVec 64))

(declare-fun lt!306657 () (_ BitVec 64))

(assert (=> d!66585 (= lt!306658 (bvmul lt!306661 lt!306657))))

(assert (=> d!66585 (or (= lt!306661 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306657 (bvsdiv (bvmul lt!306661 lt!306657) lt!306661)))))

(assert (=> d!66585 (= lt!306657 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66585 (= lt!306661 ((_ sign_extend 32) (size!4448 (buf!4934 thiss!1204))))))

(assert (=> d!66585 (= lt!306656 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9263 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9258 thiss!1204))))))

(assert (=> d!66585 (invariant!0 (currentBit!9258 thiss!1204) (currentByte!9263 thiss!1204) (size!4448 (buf!4934 thiss!1204)))))

(assert (=> d!66585 (= (bitIndex!0 (size!4448 (buf!4934 thiss!1204)) (currentByte!9263 thiss!1204) (currentBit!9258 thiss!1204)) lt!306656)))

(declare-fun b!197065 () Bool)

(declare-fun res!164919 () Bool)

(assert (=> b!197065 (=> (not res!164919) (not e!135378))))

(assert (=> b!197065 (= res!164919 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306656))))

(declare-fun b!197066 () Bool)

(declare-fun lt!306660 () (_ BitVec 64))

(assert (=> b!197066 (= e!135378 (bvsle lt!306656 (bvmul lt!306660 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197066 (or (= lt!306660 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306660 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306660)))))

(assert (=> b!197066 (= lt!306660 ((_ sign_extend 32) (size!4448 (buf!4934 thiss!1204))))))

(assert (= (and d!66585 res!164920) b!197065))

(assert (= (and b!197065 res!164919) b!197066))

(declare-fun m!304609 () Bool)

(assert (=> d!66585 m!304609))

(assert (=> d!66585 m!304421))

(assert (=> b!196913 d!66585))

(declare-fun d!66587 () Bool)

(assert (=> d!66587 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4448 (buf!4934 thiss!1204))) ((_ sign_extend 32) (currentByte!9263 thiss!1204)) ((_ sign_extend 32) (currentBit!9258 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4448 (buf!4934 thiss!1204))) ((_ sign_extend 32) (currentByte!9263 thiss!1204)) ((_ sign_extend 32) (currentBit!9258 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16534 () Bool)

(assert (= bs!16534 d!66587))

(assert (=> bs!16534 m!304609))

(assert (=> b!196914 d!66587))

(assert (=> b!196915 d!66583))

(assert (=> b!196915 d!66585))

(declare-fun b!197092 () Bool)

(declare-fun e!135391 () Bool)

(declare-fun e!135392 () Bool)

(assert (=> b!197092 (= e!135391 e!135392)))

(declare-fun res!164941 () Bool)

(assert (=> b!197092 (=> (not res!164941) (not e!135392))))

(declare-fun lt!306710 () tuple2!17036)

(declare-fun lt!306712 () tuple2!17034)

(assert (=> b!197092 (= res!164941 (and (= (_2!9163 lt!306710) lt!306373) (= (_1!9163 lt!306710) (_2!9162 lt!306712))))))

(assert (=> b!197092 (= lt!306710 (readBitPure!0 (readerFrom!0 (_2!9162 lt!306712) (currentBit!9258 thiss!1204) (currentByte!9263 thiss!1204))))))

(declare-fun b!197093 () Bool)

(assert (=> b!197093 (= e!135392 (= (bitIndex!0 (size!4448 (buf!4934 (_1!9163 lt!306710))) (currentByte!9263 (_1!9163 lt!306710)) (currentBit!9258 (_1!9163 lt!306710))) (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306712))) (currentByte!9263 (_2!9162 lt!306712)) (currentBit!9258 (_2!9162 lt!306712)))))))

(declare-fun b!197090 () Bool)

(declare-fun res!164939 () Bool)

(assert (=> b!197090 (=> (not res!164939) (not e!135391))))

(declare-fun lt!306713 () (_ BitVec 64))

(declare-fun lt!306711 () (_ BitVec 64))

(assert (=> b!197090 (= res!164939 (= (bitIndex!0 (size!4448 (buf!4934 (_2!9162 lt!306712))) (currentByte!9263 (_2!9162 lt!306712)) (currentBit!9258 (_2!9162 lt!306712))) (bvadd lt!306713 lt!306711)))))

(assert (=> b!197090 (or (not (= (bvand lt!306713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306711 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!306713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!306713 lt!306711) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197090 (= lt!306711 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!197090 (= lt!306713 (bitIndex!0 (size!4448 (buf!4934 thiss!1204)) (currentByte!9263 thiss!1204) (currentBit!9258 thiss!1204)))))

(declare-fun d!66589 () Bool)

(assert (=> d!66589 e!135391))

(declare-fun res!164942 () Bool)

(assert (=> d!66589 (=> (not res!164942) (not e!135391))))

(assert (=> d!66589 (= res!164942 (= (size!4448 (buf!4934 thiss!1204)) (size!4448 (buf!4934 (_2!9162 lt!306712)))))))

(declare-fun choose!16 (BitStream!8004 Bool) tuple2!17034)

(assert (=> d!66589 (= lt!306712 (choose!16 thiss!1204 lt!306373))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66589 (validate_offset_bit!0 ((_ sign_extend 32) (size!4448 (buf!4934 thiss!1204))) ((_ sign_extend 32) (currentByte!9263 thiss!1204)) ((_ sign_extend 32) (currentBit!9258 thiss!1204)))))

(assert (=> d!66589 (= (appendBit!0 thiss!1204 lt!306373) lt!306712)))

(declare-fun b!197091 () Bool)

(declare-fun res!164940 () Bool)

(assert (=> b!197091 (=> (not res!164940) (not e!135391))))

(assert (=> b!197091 (= res!164940 (isPrefixOf!0 thiss!1204 (_2!9162 lt!306712)))))

(assert (= (and d!66589 res!164942) b!197090))

(assert (= (and b!197090 res!164939) b!197091))

(assert (= (and b!197091 res!164940) b!197092))

(assert (= (and b!197092 res!164941) b!197093))

(declare-fun m!304611 () Bool)

(assert (=> b!197091 m!304611))

(declare-fun m!304613 () Bool)

(assert (=> b!197092 m!304613))

(assert (=> b!197092 m!304613))

(declare-fun m!304615 () Bool)

(assert (=> b!197092 m!304615))

(declare-fun m!304617 () Bool)

(assert (=> b!197090 m!304617))

(assert (=> b!197090 m!304439))

(declare-fun m!304619 () Bool)

(assert (=> b!197093 m!304619))

(assert (=> b!197093 m!304617))

(declare-fun m!304621 () Bool)

(assert (=> d!66589 m!304621))

(declare-fun m!304623 () Bool)

(assert (=> d!66589 m!304623))

(assert (=> b!196915 d!66589))

(declare-fun d!66591 () Bool)

(declare-fun e!135393 () Bool)

(assert (=> d!66591 e!135393))

(declare-fun res!164944 () Bool)

(assert (=> d!66591 (=> (not res!164944) (not e!135393))))

(declare-fun lt!306722 () (_ BitVec 64))

(declare-fun lt!306725 () (_ BitVec 64))

(declare-fun lt!306724 () (_ BitVec 64))

(assert (=> d!66591 (= res!164944 (= lt!306722 (bvsub lt!306724 lt!306725)))))

(assert (=> d!66591 (or (= (bvand lt!306724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306725 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306724 lt!306725) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66591 (= lt!306725 (remainingBits!0 ((_ sign_extend 32) (size!4448 (buf!4934 (_1!9163 lt!306377)))) ((_ sign_extend 32) (currentByte!9263 (_1!9163 lt!306377))) ((_ sign_extend 32) (currentBit!9258 (_1!9163 lt!306377)))))))

(declare-fun lt!306727 () (_ BitVec 64))

(declare-fun lt!306723 () (_ BitVec 64))

(assert (=> d!66591 (= lt!306724 (bvmul lt!306727 lt!306723))))

(assert (=> d!66591 (or (= lt!306727 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306723 (bvsdiv (bvmul lt!306727 lt!306723) lt!306727)))))

(assert (=> d!66591 (= lt!306723 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66591 (= lt!306727 ((_ sign_extend 32) (size!4448 (buf!4934 (_1!9163 lt!306377)))))))

(assert (=> d!66591 (= lt!306722 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9263 (_1!9163 lt!306377))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9258 (_1!9163 lt!306377)))))))

(assert (=> d!66591 (invariant!0 (currentBit!9258 (_1!9163 lt!306377)) (currentByte!9263 (_1!9163 lt!306377)) (size!4448 (buf!4934 (_1!9163 lt!306377))))))

(assert (=> d!66591 (= (bitIndex!0 (size!4448 (buf!4934 (_1!9163 lt!306377))) (currentByte!9263 (_1!9163 lt!306377)) (currentBit!9258 (_1!9163 lt!306377))) lt!306722)))

(declare-fun b!197094 () Bool)

(declare-fun res!164943 () Bool)

(assert (=> b!197094 (=> (not res!164943) (not e!135393))))

(assert (=> b!197094 (= res!164943 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306722))))

(declare-fun b!197095 () Bool)

(declare-fun lt!306726 () (_ BitVec 64))

(assert (=> b!197095 (= e!135393 (bvsle lt!306722 (bvmul lt!306726 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197095 (or (= lt!306726 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306726 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306726)))))

(assert (=> b!197095 (= lt!306726 ((_ sign_extend 32) (size!4448 (buf!4934 (_1!9163 lt!306377)))))))

(assert (= (and d!66591 res!164944) b!197094))

(assert (= (and b!197094 res!164943) b!197095))

(declare-fun m!304625 () Bool)

(assert (=> d!66591 m!304625))

(declare-fun m!304627 () Bool)

(assert (=> d!66591 m!304627))

(assert (=> b!196916 d!66591))

(declare-fun d!66593 () Bool)

(assert (=> d!66593 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9258 thiss!1204) (currentByte!9263 thiss!1204) (size!4448 (buf!4934 thiss!1204))))))

(declare-fun bs!16535 () Bool)

(assert (= bs!16535 d!66593))

(assert (=> bs!16535 m!304421))

(assert (=> start!41842 d!66593))

(declare-fun d!66595 () Bool)

(assert (=> d!66595 (= (invariant!0 (currentBit!9258 (_2!9162 lt!306378)) (currentByte!9263 (_2!9162 lt!306378)) (size!4448 (buf!4934 (_2!9162 lt!306378)))) (and (bvsge (currentBit!9258 (_2!9162 lt!306378)) #b00000000000000000000000000000000) (bvslt (currentBit!9258 (_2!9162 lt!306378)) #b00000000000000000000000000001000) (bvsge (currentByte!9263 (_2!9162 lt!306378)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9263 (_2!9162 lt!306378)) (size!4448 (buf!4934 (_2!9162 lt!306378)))) (and (= (currentBit!9258 (_2!9162 lt!306378)) #b00000000000000000000000000000000) (= (currentByte!9263 (_2!9162 lt!306378)) (size!4448 (buf!4934 (_2!9162 lt!306378))))))))))

(assert (=> b!196918 d!66595))

(declare-fun d!66597 () Bool)

(assert (=> d!66597 (= (invariant!0 (currentBit!9258 thiss!1204) (currentByte!9263 thiss!1204) (size!4448 (buf!4934 thiss!1204))) (and (bvsge (currentBit!9258 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9258 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9263 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9263 thiss!1204) (size!4448 (buf!4934 thiss!1204))) (and (= (currentBit!9258 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9263 thiss!1204) (size!4448 (buf!4934 thiss!1204)))))))))

(assert (=> b!196907 d!66597))

(check-sat (not b!197091) (not b!197058) (not b!197059) (not bm!3092) (not b!196980) (not d!66593) (not d!66587) (not b!197092) (not b!196967) (not d!66583) (not d!66555) (not d!66551) (not b!197061) (not b!196973) (not d!66589) (not b!197060) (not b!197093) (not d!66585) (not b!197047) (not d!66549) (not b!196965) (not b!197055) (not d!66591) (not b!196982) (not d!66561) (not b!197090) (not b!196971) (not b!197054) (not b!197050) (not d!66559) (not b!197049) (not b!196970))
