; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!302 () Bool)

(assert start!302)

(declare-fun b!821 () Bool)

(declare-fun e!474 () Bool)

(declare-datatypes ((array!94 0))(
  ( (array!95 (arr!423 (Array (_ BitVec 32) (_ BitVec 8))) (size!36 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!56 0))(
  ( (BitStream!57 (buf!348 array!94) (currentByte!1264 (_ BitVec 32)) (currentBit!1259 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!42 0))(
  ( (tuple2!43 (_1!21 BitStream!56) (_2!21 Bool)) )
))
(declare-fun lt!376 () tuple2!42)

(declare-fun lt!374 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!821 (= e!474 (= (bitIndex!0 (size!36 (buf!348 (_1!21 lt!376))) (currentByte!1264 (_1!21 lt!376)) (currentBit!1259 (_1!21 lt!376))) lt!374))))

(declare-fun b!822 () Bool)

(declare-fun res!2904 () Bool)

(declare-fun e!473 () Bool)

(assert (=> b!822 (=> (not res!2904) (not e!473))))

(declare-fun thiss!932 () BitStream!56)

(declare-datatypes ((Unit!17 0))(
  ( (Unit!18) )
))
(declare-datatypes ((tuple2!44 0))(
  ( (tuple2!45 (_1!22 Unit!17) (_2!22 BitStream!56)) )
))
(declare-fun lt!377 () tuple2!44)

(declare-fun isPrefixOf!0 (BitStream!56 BitStream!56) Bool)

(assert (=> b!822 (= res!2904 (isPrefixOf!0 thiss!932 (_2!22 lt!377)))))

(declare-fun b!823 () Bool)

(declare-fun e!475 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!823 (= e!475 (invariant!0 (currentBit!1259 (_2!22 lt!377)) (currentByte!1264 (_2!22 lt!377)) (size!36 (buf!348 (_2!22 lt!377)))))))

(declare-fun b!824 () Bool)

(declare-fun e!476 () Bool)

(assert (=> b!824 (= e!476 e!473)))

(declare-fun res!2905 () Bool)

(assert (=> b!824 (=> (not res!2905) (not e!473))))

(declare-fun lt!375 () (_ BitVec 64))

(assert (=> b!824 (= res!2905 (= lt!374 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!375)))))

(assert (=> b!824 (= lt!374 (bitIndex!0 (size!36 (buf!348 (_2!22 lt!377))) (currentByte!1264 (_2!22 lt!377)) (currentBit!1259 (_2!22 lt!377))))))

(assert (=> b!824 (= lt!375 (bitIndex!0 (size!36 (buf!348 thiss!932)) (currentByte!1264 thiss!932) (currentBit!1259 thiss!932)))))

(declare-fun b!825 () Bool)

(declare-fun res!2903 () Bool)

(assert (=> b!825 (=> res!2903 e!475)))

(assert (=> b!825 (= res!2903 (not (= (bitIndex!0 (size!36 (buf!348 (_2!22 lt!377))) (currentByte!1264 (_2!22 lt!377)) (currentBit!1259 (_2!22 lt!377))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!36 (buf!348 thiss!932)) (currentByte!1264 thiss!932) (currentBit!1259 thiss!932))))))))

(declare-fun b!826 () Bool)

(declare-fun res!2908 () Bool)

(assert (=> b!826 (=> res!2908 e!475)))

(assert (=> b!826 (= res!2908 (not (isPrefixOf!0 thiss!932 (_2!22 lt!377))))))

(declare-fun b!827 () Bool)

(declare-fun e!477 () Bool)

(declare-fun array_inv!33 (array!94) Bool)

(assert (=> b!827 (= e!477 (array_inv!33 (buf!348 thiss!932)))))

(declare-fun b!828 () Bool)

(assert (=> b!828 (= e!473 e!474)))

(declare-fun res!2902 () Bool)

(assert (=> b!828 (=> (not res!2902) (not e!474))))

(assert (=> b!828 (= res!2902 (and (_2!21 lt!376) (= (_1!21 lt!376) (_2!22 lt!377))))))

(declare-fun readBitPure!0 (BitStream!56) tuple2!42)

(declare-fun readerFrom!0 (BitStream!56 (_ BitVec 32) (_ BitVec 32)) BitStream!56)

(assert (=> b!828 (= lt!376 (readBitPure!0 (readerFrom!0 (_2!22 lt!377) (currentBit!1259 thiss!932) (currentByte!1264 thiss!932))))))

(declare-fun b!829 () Bool)

(declare-fun e!479 () Bool)

(assert (=> b!829 (= e!479 (not e!475))))

(declare-fun res!2901 () Bool)

(assert (=> b!829 (=> res!2901 e!475)))

(assert (=> b!829 (= res!2901 (not (= (size!36 (buf!348 (_2!22 lt!377))) (size!36 (buf!348 thiss!932)))))))

(assert (=> b!829 e!476))

(declare-fun res!2907 () Bool)

(assert (=> b!829 (=> (not res!2907) (not e!476))))

(assert (=> b!829 (= res!2907 (= (size!36 (buf!348 thiss!932)) (size!36 (buf!348 (_2!22 lt!377)))))))

(declare-fun appendBit!0 (BitStream!56 Bool) tuple2!44)

(assert (=> b!829 (= lt!377 (appendBit!0 thiss!932 true))))

(declare-fun res!2906 () Bool)

(assert (=> start!302 (=> (not res!2906) (not e!479))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!302 (= res!2906 (validate_offset_bit!0 ((_ sign_extend 32) (size!36 (buf!348 thiss!932))) ((_ sign_extend 32) (currentByte!1264 thiss!932)) ((_ sign_extend 32) (currentBit!1259 thiss!932))))))

(assert (=> start!302 e!479))

(declare-fun inv!12 (BitStream!56) Bool)

(assert (=> start!302 (and (inv!12 thiss!932) e!477)))

(assert (= (and start!302 res!2906) b!829))

(assert (= (and b!829 res!2907) b!824))

(assert (= (and b!824 res!2905) b!822))

(assert (= (and b!822 res!2904) b!828))

(assert (= (and b!828 res!2902) b!821))

(assert (= (and b!829 (not res!2901)) b!825))

(assert (= (and b!825 (not res!2903)) b!826))

(assert (= (and b!826 (not res!2908)) b!823))

(assert (= start!302 b!827))

(declare-fun m!519 () Bool)

(assert (=> start!302 m!519))

(declare-fun m!521 () Bool)

(assert (=> start!302 m!521))

(declare-fun m!523 () Bool)

(assert (=> b!826 m!523))

(declare-fun m!525 () Bool)

(assert (=> b!829 m!525))

(declare-fun m!527 () Bool)

(assert (=> b!824 m!527))

(declare-fun m!529 () Bool)

(assert (=> b!824 m!529))

(assert (=> b!822 m!523))

(declare-fun m!531 () Bool)

(assert (=> b!823 m!531))

(assert (=> b!825 m!527))

(assert (=> b!825 m!529))

(declare-fun m!533 () Bool)

(assert (=> b!827 m!533))

(declare-fun m!535 () Bool)

(assert (=> b!828 m!535))

(assert (=> b!828 m!535))

(declare-fun m!537 () Bool)

(assert (=> b!828 m!537))

(declare-fun m!539 () Bool)

(assert (=> b!821 m!539))

(push 1)

(assert (not b!824))

(assert (not b!825))

(assert (not b!828))

(assert (not b!826))

(assert (not b!822))

(assert (not b!821))

(assert (not b!829))

(assert (not b!823))

(assert (not b!827))

(assert (not start!302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!982 () Bool)

(declare-datatypes ((tuple2!48 0))(
  ( (tuple2!49 (_1!24 Bool) (_2!24 BitStream!56)) )
))
(declare-fun lt!383 () tuple2!48)

(declare-fun readBit!0 (BitStream!56) tuple2!48)

(assert (=> d!982 (= lt!383 (readBit!0 (readerFrom!0 (_2!22 lt!377) (currentBit!1259 thiss!932) (currentByte!1264 thiss!932))))))

(assert (=> d!982 (= (readBitPure!0 (readerFrom!0 (_2!22 lt!377) (currentBit!1259 thiss!932) (currentByte!1264 thiss!932))) (tuple2!43 (_2!24 lt!383) (_1!24 lt!383)))))

(declare-fun bs!403 () Bool)

(assert (= bs!403 d!982))

(assert (=> bs!403 m!535))

(declare-fun m!543 () Bool)

(assert (=> bs!403 m!543))

(assert (=> b!828 d!982))

(declare-fun d!986 () Bool)

(declare-fun e!485 () Bool)

(assert (=> d!986 e!485))

(declare-fun res!2916 () Bool)

(assert (=> d!986 (=> (not res!2916) (not e!485))))

(assert (=> d!986 (= res!2916 (invariant!0 (currentBit!1259 (_2!22 lt!377)) (currentByte!1264 (_2!22 lt!377)) (size!36 (buf!348 (_2!22 lt!377)))))))

(assert (=> d!986 (= (readerFrom!0 (_2!22 lt!377) (currentBit!1259 thiss!932) (currentByte!1264 thiss!932)) (BitStream!57 (buf!348 (_2!22 lt!377)) (currentByte!1264 thiss!932) (currentBit!1259 thiss!932)))))

(declare-fun b!835 () Bool)

(assert (=> b!835 (= e!485 (invariant!0 (currentBit!1259 thiss!932) (currentByte!1264 thiss!932) (size!36 (buf!348 (_2!22 lt!377)))))))

(assert (= (and d!986 res!2916) b!835))

(assert (=> d!986 m!531))

(declare-fun m!547 () Bool)

(assert (=> b!835 m!547))

(assert (=> b!828 d!986))

(declare-fun d!992 () Bool)

(assert (=> d!992 (= (array_inv!33 (buf!348 thiss!932)) (bvsge (size!36 (buf!348 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!827 d!992))

(declare-fun d!994 () Bool)

(declare-fun res!2940 () Bool)

(declare-fun e!502 () Bool)

(assert (=> d!994 (=> (not res!2940) (not e!502))))

(assert (=> d!994 (= res!2940 (= (size!36 (buf!348 thiss!932)) (size!36 (buf!348 (_2!22 lt!377)))))))

(assert (=> d!994 (= (isPrefixOf!0 thiss!932 (_2!22 lt!377)) e!502)))

(declare-fun b!859 () Bool)

(declare-fun res!2941 () Bool)

(assert (=> b!859 (=> (not res!2941) (not e!502))))

(assert (=> b!859 (= res!2941 (bvsle (bitIndex!0 (size!36 (buf!348 thiss!932)) (currentByte!1264 thiss!932) (currentBit!1259 thiss!932)) (bitIndex!0 (size!36 (buf!348 (_2!22 lt!377))) (currentByte!1264 (_2!22 lt!377)) (currentBit!1259 (_2!22 lt!377)))))))

(declare-fun b!860 () Bool)

(declare-fun e!501 () Bool)

(assert (=> b!860 (= e!502 e!501)))

(declare-fun res!2942 () Bool)

(assert (=> b!860 (=> res!2942 e!501)))

(assert (=> b!860 (= res!2942 (= (size!36 (buf!348 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!861 () Bool)

(declare-fun arrayBitRangesEq!0 (array!94 array!94 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!861 (= e!501 (arrayBitRangesEq!0 (buf!348 thiss!932) (buf!348 (_2!22 lt!377)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!36 (buf!348 thiss!932)) (currentByte!1264 thiss!932) (currentBit!1259 thiss!932))))))

(assert (= (and d!994 res!2940) b!859))

(assert (= (and b!859 res!2941) b!860))

(assert (= (and b!860 (not res!2942)) b!861))

(assert (=> b!859 m!529))

(assert (=> b!859 m!527))

(assert (=> b!861 m!529))

(assert (=> b!861 m!529))

(declare-fun m!555 () Bool)

(assert (=> b!861 m!555))

(assert (=> b!822 d!994))

(declare-fun d!1000 () Bool)

(declare-fun e!523 () Bool)

(assert (=> d!1000 e!523))

(declare-fun res!2980 () Bool)

(assert (=> d!1000 (=> (not res!2980) (not e!523))))

(declare-fun lt!462 () tuple2!44)

(assert (=> d!1000 (= res!2980 (= (size!36 (buf!348 thiss!932)) (size!36 (buf!348 (_2!22 lt!462)))))))

(declare-fun choose!16 (BitStream!56 Bool) tuple2!44)

(assert (=> d!1000 (= lt!462 (choose!16 thiss!932 true))))

(assert (=> d!1000 (validate_offset_bit!0 ((_ sign_extend 32) (size!36 (buf!348 thiss!932))) ((_ sign_extend 32) (currentByte!1264 thiss!932)) ((_ sign_extend 32) (currentBit!1259 thiss!932)))))

(assert (=> d!1000 (= (appendBit!0 thiss!932 true) lt!462)))

(declare-fun b!902 () Bool)

(declare-fun res!2981 () Bool)

(assert (=> b!902 (=> (not res!2981) (not e!523))))

(assert (=> b!902 (= res!2981 (isPrefixOf!0 thiss!932 (_2!22 lt!462)))))

(declare-fun b!904 () Bool)

(declare-fun e!522 () Bool)

(declare-fun lt!460 () tuple2!42)

(assert (=> b!904 (= e!522 (= (bitIndex!0 (size!36 (buf!348 (_1!21 lt!460))) (currentByte!1264 (_1!21 lt!460)) (currentBit!1259 (_1!21 lt!460))) (bitIndex!0 (size!36 (buf!348 (_2!22 lt!462))) (currentByte!1264 (_2!22 lt!462)) (currentBit!1259 (_2!22 lt!462)))))))

(declare-fun b!903 () Bool)

(assert (=> b!903 (= e!523 e!522)))

(declare-fun res!2983 () Bool)

(assert (=> b!903 (=> (not res!2983) (not e!522))))

(assert (=> b!903 (= res!2983 (and (= (_2!21 lt!460) true) (= (_1!21 lt!460) (_2!22 lt!462))))))

(assert (=> b!903 (= lt!460 (readBitPure!0 (readerFrom!0 (_2!22 lt!462) (currentBit!1259 thiss!932) (currentByte!1264 thiss!932))))))

(declare-fun b!901 () Bool)

(declare-fun res!2982 () Bool)

(assert (=> b!901 (=> (not res!2982) (not e!523))))

(declare-fun lt!461 () (_ BitVec 64))

(declare-fun lt!463 () (_ BitVec 64))

(assert (=> b!901 (= res!2982 (= (bitIndex!0 (size!36 (buf!348 (_2!22 lt!462))) (currentByte!1264 (_2!22 lt!462)) (currentBit!1259 (_2!22 lt!462))) (bvadd lt!461 lt!463)))))

(assert (=> b!901 (or (not (= (bvand lt!461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!463 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!461 lt!463) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!901 (= lt!463 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!901 (= lt!461 (bitIndex!0 (size!36 (buf!348 thiss!932)) (currentByte!1264 thiss!932) (currentBit!1259 thiss!932)))))

(assert (= (and d!1000 res!2980) b!901))

(assert (= (and b!901 res!2982) b!902))

(assert (= (and b!902 res!2981) b!903))

(assert (= (and b!903 res!2983) b!904))

(declare-fun m!575 () Bool)

(assert (=> b!902 m!575))

(declare-fun m!577 () Bool)

(assert (=> d!1000 m!577))

(assert (=> d!1000 m!519))

(declare-fun m!579 () Bool)

(assert (=> b!904 m!579))

(declare-fun m!581 () Bool)

(assert (=> b!904 m!581))

(declare-fun m!583 () Bool)

(assert (=> b!903 m!583))

(assert (=> b!903 m!583))

(declare-fun m!585 () Bool)

(assert (=> b!903 m!585))

(assert (=> b!901 m!581))

(assert (=> b!901 m!529))

(assert (=> b!829 d!1000))

(declare-fun d!1014 () Bool)

(declare-fun e!537 () Bool)

(assert (=> d!1014 e!537))

(declare-fun res!3008 () Bool)

(assert (=> d!1014 (=> (not res!3008) (not e!537))))

(declare-fun lt!496 () (_ BitVec 64))

(declare-fun lt!500 () (_ BitVec 64))

(declare-fun lt!499 () (_ BitVec 64))

(assert (=> d!1014 (= res!3008 (= lt!500 (bvsub lt!499 lt!496)))))

(assert (=> d!1014 (or (= (bvand lt!499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!496 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!499 lt!496) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1014 (= lt!496 (remainingBits!0 ((_ sign_extend 32) (size!36 (buf!348 (_2!22 lt!377)))) ((_ sign_extend 32) (currentByte!1264 (_2!22 lt!377))) ((_ sign_extend 32) (currentBit!1259 (_2!22 lt!377)))))))

(declare-fun lt!495 () (_ BitVec 64))

(declare-fun lt!497 () (_ BitVec 64))

(assert (=> d!1014 (= lt!499 (bvmul lt!495 lt!497))))

(assert (=> d!1014 (or (= lt!495 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!497 (bvsdiv (bvmul lt!495 lt!497) lt!495)))))

(assert (=> d!1014 (= lt!497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1014 (= lt!495 ((_ sign_extend 32) (size!36 (buf!348 (_2!22 lt!377)))))))

(assert (=> d!1014 (= lt!500 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1264 (_2!22 lt!377))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1259 (_2!22 lt!377)))))))

(assert (=> d!1014 (invariant!0 (currentBit!1259 (_2!22 lt!377)) (currentByte!1264 (_2!22 lt!377)) (size!36 (buf!348 (_2!22 lt!377))))))

(assert (=> d!1014 (= (bitIndex!0 (size!36 (buf!348 (_2!22 lt!377))) (currentByte!1264 (_2!22 lt!377)) (currentBit!1259 (_2!22 lt!377))) lt!500)))

(declare-fun b!929 () Bool)

(declare-fun res!3009 () Bool)

(assert (=> b!929 (=> (not res!3009) (not e!537))))

(assert (=> b!929 (= res!3009 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!500))))

(declare-fun b!930 () Bool)

(declare-fun lt!498 () (_ BitVec 64))

(assert (=> b!930 (= e!537 (bvsle lt!500 (bvmul lt!498 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!930 (or (= lt!498 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!498 #b0000000000000000000000000000000000000000000000000000000000001000) lt!498)))))

(assert (=> b!930 (= lt!498 ((_ sign_extend 32) (size!36 (buf!348 (_2!22 lt!377)))))))

(assert (= (and d!1014 res!3008) b!929))

(assert (= (and b!929 res!3009) b!930))

(declare-fun m!603 () Bool)

(assert (=> d!1014 m!603))

(assert (=> d!1014 m!531))

(assert (=> b!824 d!1014))

(declare-fun d!1026 () Bool)

(declare-fun e!538 () Bool)

(assert (=> d!1026 e!538))

(declare-fun res!3010 () Bool)

(assert (=> d!1026 (=> (not res!3010) (not e!538))))

(declare-fun lt!506 () (_ BitVec 64))

(declare-fun lt!505 () (_ BitVec 64))

(declare-fun lt!502 () (_ BitVec 64))

(assert (=> d!1026 (= res!3010 (= lt!506 (bvsub lt!505 lt!502)))))

(assert (=> d!1026 (or (= (bvand lt!505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!505 lt!502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1026 (= lt!502 (remainingBits!0 ((_ sign_extend 32) (size!36 (buf!348 thiss!932))) ((_ sign_extend 32) (currentByte!1264 thiss!932)) ((_ sign_extend 32) (currentBit!1259 thiss!932))))))

(declare-fun lt!501 () (_ BitVec 64))

(declare-fun lt!503 () (_ BitVec 64))

(assert (=> d!1026 (= lt!505 (bvmul lt!501 lt!503))))

(assert (=> d!1026 (or (= lt!501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!503 (bvsdiv (bvmul lt!501 lt!503) lt!501)))))

(assert (=> d!1026 (= lt!503 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1026 (= lt!501 ((_ sign_extend 32) (size!36 (buf!348 thiss!932))))))

(assert (=> d!1026 (= lt!506 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1264 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1259 thiss!932))))))

(assert (=> d!1026 (invariant!0 (currentBit!1259 thiss!932) (currentByte!1264 thiss!932) (size!36 (buf!348 thiss!932)))))

(assert (=> d!1026 (= (bitIndex!0 (size!36 (buf!348 thiss!932)) (currentByte!1264 thiss!932) (currentBit!1259 thiss!932)) lt!506)))

(declare-fun b!931 () Bool)

(declare-fun res!3011 () Bool)

(assert (=> b!931 (=> (not res!3011) (not e!538))))

(assert (=> b!931 (= res!3011 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!506))))

(declare-fun b!932 () Bool)

(declare-fun lt!504 () (_ BitVec 64))

(assert (=> b!932 (= e!538 (bvsle lt!506 (bvmul lt!504 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!932 (or (= lt!504 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!504 #b0000000000000000000000000000000000000000000000000000000000001000) lt!504)))))

(assert (=> b!932 (= lt!504 ((_ sign_extend 32) (size!36 (buf!348 thiss!932))))))

(assert (= (and d!1026 res!3010) b!931))

(assert (= (and b!931 res!3011) b!932))

(declare-fun m!617 () Bool)

(assert (=> d!1026 m!617))

(declare-fun m!619 () Bool)

(assert (=> d!1026 m!619))

(assert (=> b!824 d!1026))

(declare-fun d!1028 () Bool)

(assert (=> d!1028 (= (invariant!0 (currentBit!1259 (_2!22 lt!377)) (currentByte!1264 (_2!22 lt!377)) (size!36 (buf!348 (_2!22 lt!377)))) (and (bvsge (currentBit!1259 (_2!22 lt!377)) #b00000000000000000000000000000000) (bvslt (currentBit!1259 (_2!22 lt!377)) #b00000000000000000000000000001000) (bvsge (currentByte!1264 (_2!22 lt!377)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1264 (_2!22 lt!377)) (size!36 (buf!348 (_2!22 lt!377)))) (and (= (currentBit!1259 (_2!22 lt!377)) #b00000000000000000000000000000000) (= (currentByte!1264 (_2!22 lt!377)) (size!36 (buf!348 (_2!22 lt!377))))))))))

(assert (=> b!823 d!1028))

(assert (=> b!825 d!1014))

(assert (=> b!825 d!1026))

(declare-fun d!1036 () Bool)

(assert (=> d!1036 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!36 (buf!348 thiss!932))) ((_ sign_extend 32) (currentByte!1264 thiss!932)) ((_ sign_extend 32) (currentBit!1259 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!36 (buf!348 thiss!932))) ((_ sign_extend 32) (currentByte!1264 thiss!932)) ((_ sign_extend 32) (currentBit!1259 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!409 () Bool)

(assert (= bs!409 d!1036))

(assert (=> bs!409 m!617))

(assert (=> start!302 d!1036))

(declare-fun d!1040 () Bool)

(assert (=> d!1040 (= (inv!12 thiss!932) (invariant!0 (currentBit!1259 thiss!932) (currentByte!1264 thiss!932) (size!36 (buf!348 thiss!932))))))

(declare-fun bs!410 () Bool)

(assert (= bs!410 d!1040))

(assert (=> bs!410 m!619))

(assert (=> start!302 d!1040))

(declare-fun d!1042 () Bool)

(declare-fun e!539 () Bool)

(assert (=> d!1042 e!539))

(declare-fun res!3012 () Bool)

(assert (=> d!1042 (=> (not res!3012) (not e!539))))

(declare-fun lt!512 () (_ BitVec 64))

(declare-fun lt!511 () (_ BitVec 64))

(declare-fun lt!508 () (_ BitVec 64))

(assert (=> d!1042 (= res!3012 (= lt!512 (bvsub lt!511 lt!508)))))

(assert (=> d!1042 (or (= (bvand lt!511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!508 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!511 lt!508) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1042 (= lt!508 (remainingBits!0 ((_ sign_extend 32) (size!36 (buf!348 (_1!21 lt!376)))) ((_ sign_extend 32) (currentByte!1264 (_1!21 lt!376))) ((_ sign_extend 32) (currentBit!1259 (_1!21 lt!376)))))))

(declare-fun lt!507 () (_ BitVec 64))

(declare-fun lt!509 () (_ BitVec 64))

(assert (=> d!1042 (= lt!511 (bvmul lt!507 lt!509))))

(assert (=> d!1042 (or (= lt!507 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!509 (bvsdiv (bvmul lt!507 lt!509) lt!507)))))

(assert (=> d!1042 (= lt!509 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1042 (= lt!507 ((_ sign_extend 32) (size!36 (buf!348 (_1!21 lt!376)))))))

(assert (=> d!1042 (= lt!512 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1264 (_1!21 lt!376))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1259 (_1!21 lt!376)))))))

(assert (=> d!1042 (invariant!0 (currentBit!1259 (_1!21 lt!376)) (currentByte!1264 (_1!21 lt!376)) (size!36 (buf!348 (_1!21 lt!376))))))

(assert (=> d!1042 (= (bitIndex!0 (size!36 (buf!348 (_1!21 lt!376))) (currentByte!1264 (_1!21 lt!376)) (currentBit!1259 (_1!21 lt!376))) lt!512)))

(declare-fun b!933 () Bool)

(declare-fun res!3013 () Bool)

(assert (=> b!933 (=> (not res!3013) (not e!539))))

(assert (=> b!933 (= res!3013 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!512))))

(declare-fun b!934 () Bool)

(declare-fun lt!510 () (_ BitVec 64))

(assert (=> b!934 (= e!539 (bvsle lt!512 (bvmul lt!510 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!934 (or (= lt!510 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!510 #b0000000000000000000000000000000000000000000000000000000000001000) lt!510)))))

(assert (=> b!934 (= lt!510 ((_ sign_extend 32) (size!36 (buf!348 (_1!21 lt!376)))))))

(assert (= (and d!1042 res!3012) b!933))

(assert (= (and b!933 res!3013) b!934))

(declare-fun m!621 () Bool)

(assert (=> d!1042 m!621))

(declare-fun m!623 () Bool)

(assert (=> d!1042 m!623))

(assert (=> b!821 d!1042))

(assert (=> b!826 d!994))

(push 1)

