; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22462 () Bool)

(assert start!22462)

(declare-fun b!113677 () Bool)

(declare-fun e!74580 () Bool)

(declare-datatypes ((array!5169 0))(
  ( (array!5170 (arr!2942 (Array (_ BitVec 32) (_ BitVec 8))) (size!2349 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4172 0))(
  ( (BitStream!4173 (buf!2757 array!5169) (currentByte!5343 (_ BitVec 32)) (currentBit!5338 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4172)

(declare-datatypes ((Unit!6983 0))(
  ( (Unit!6984) )
))
(declare-datatypes ((tuple2!9374 0))(
  ( (tuple2!9375 (_1!4949 Unit!6983) (_2!4949 BitStream!4172)) )
))
(declare-fun lt!172679 () tuple2!9374)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!113677 (= e!74580 (invariant!0 (currentBit!5338 thiss!1305) (currentByte!5343 thiss!1305) (size!2349 (buf!2757 (_2!4949 lt!172679)))))))

(declare-fun res!93895 () Bool)

(declare-fun e!74577 () Bool)

(assert (=> start!22462 (=> (not res!93895) (not e!74577))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!22462 (= res!93895 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22462 e!74577))

(assert (=> start!22462 true))

(declare-fun e!74583 () Bool)

(declare-fun inv!12 (BitStream!4172) Bool)

(assert (=> start!22462 (and (inv!12 thiss!1305) e!74583)))

(declare-fun b!113678 () Bool)

(declare-fun res!93896 () Bool)

(assert (=> b!113678 (=> (not res!93896) (not e!74577))))

(assert (=> b!113678 (= res!93896 (bvslt i!615 nBits!396))))

(declare-fun b!113679 () Bool)

(declare-fun res!93894 () Bool)

(declare-fun e!74582 () Bool)

(assert (=> b!113679 (=> (not res!93894) (not e!74582))))

(declare-fun isPrefixOf!0 (BitStream!4172 BitStream!4172) Bool)

(assert (=> b!113679 (= res!93894 (isPrefixOf!0 thiss!1305 (_2!4949 lt!172679)))))

(declare-fun b!113680 () Bool)

(declare-fun array_inv!2151 (array!5169) Bool)

(assert (=> b!113680 (= e!74583 (array_inv!2151 (buf!2757 thiss!1305)))))

(declare-fun b!113681 () Bool)

(declare-fun e!74579 () Bool)

(assert (=> b!113681 (= e!74579 e!74582)))

(declare-fun res!93901 () Bool)

(assert (=> b!113681 (=> (not res!93901) (not e!74582))))

(declare-fun lt!172684 () (_ BitVec 64))

(declare-fun lt!172683 () (_ BitVec 64))

(assert (=> b!113681 (= res!93901 (= lt!172684 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!172683)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113681 (= lt!172684 (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!172679))) (currentByte!5343 (_2!4949 lt!172679)) (currentBit!5338 (_2!4949 lt!172679))))))

(assert (=> b!113681 (= lt!172683 (bitIndex!0 (size!2349 (buf!2757 thiss!1305)) (currentByte!5343 thiss!1305) (currentBit!5338 thiss!1305)))))

(declare-fun b!113682 () Bool)

(declare-fun e!74581 () Bool)

(declare-datatypes ((tuple2!9376 0))(
  ( (tuple2!9377 (_1!4950 BitStream!4172) (_2!4950 Bool)) )
))
(declare-fun lt!172681 () tuple2!9376)

(assert (=> b!113682 (= e!74581 (= (bitIndex!0 (size!2349 (buf!2757 (_1!4950 lt!172681))) (currentByte!5343 (_1!4950 lt!172681)) (currentBit!5338 (_1!4950 lt!172681))) lt!172684))))

(declare-fun b!113683 () Bool)

(declare-fun lt!172680 () tuple2!9374)

(assert (=> b!113683 (= e!74577 (not (= (size!2349 (buf!2757 (_2!4949 lt!172679))) (size!2349 (buf!2757 (_2!4949 lt!172680))))))))

(assert (=> b!113683 e!74580))

(declare-fun res!93902 () Bool)

(assert (=> b!113683 (=> (not res!93902) (not e!74580))))

(assert (=> b!113683 (= res!93902 (isPrefixOf!0 thiss!1305 (_2!4949 lt!172680)))))

(declare-fun lt!172685 () Unit!6983)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4172 BitStream!4172 BitStream!4172) Unit!6983)

(assert (=> b!113683 (= lt!172685 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4949 lt!172679) (_2!4949 lt!172680)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4172 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9374)

(assert (=> b!113683 (= lt!172680 (appendNLeastSignificantBitsLoop!0 (_2!4949 lt!172679) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!113683 e!74579))

(declare-fun res!93900 () Bool)

(assert (=> b!113683 (=> (not res!93900) (not e!74579))))

(assert (=> b!113683 (= res!93900 (= (size!2349 (buf!2757 thiss!1305)) (size!2349 (buf!2757 (_2!4949 lt!172679)))))))

(declare-fun lt!172682 () Bool)

(declare-fun appendBit!0 (BitStream!4172 Bool) tuple2!9374)

(assert (=> b!113683 (= lt!172679 (appendBit!0 thiss!1305 lt!172682))))

(assert (=> b!113683 (= lt!172682 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113684 () Bool)

(declare-fun res!93897 () Bool)

(assert (=> b!113684 (=> (not res!93897) (not e!74577))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113684 (= res!93897 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113685 () Bool)

(assert (=> b!113685 (= e!74582 e!74581)))

(declare-fun res!93899 () Bool)

(assert (=> b!113685 (=> (not res!93899) (not e!74581))))

(assert (=> b!113685 (= res!93899 (and (= (_2!4950 lt!172681) lt!172682) (= (_1!4950 lt!172681) (_2!4949 lt!172679))))))

(declare-fun readBitPure!0 (BitStream!4172) tuple2!9376)

(declare-fun readerFrom!0 (BitStream!4172 (_ BitVec 32) (_ BitVec 32)) BitStream!4172)

(assert (=> b!113685 (= lt!172681 (readBitPure!0 (readerFrom!0 (_2!4949 lt!172679) (currentBit!5338 thiss!1305) (currentByte!5343 thiss!1305))))))

(declare-fun b!113686 () Bool)

(declare-fun res!93898 () Bool)

(assert (=> b!113686 (=> (not res!93898) (not e!74577))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113686 (= res!93898 (validate_offset_bits!1 ((_ sign_extend 32) (size!2349 (buf!2757 thiss!1305))) ((_ sign_extend 32) (currentByte!5343 thiss!1305)) ((_ sign_extend 32) (currentBit!5338 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(assert (= (and start!22462 res!93895) b!113686))

(assert (= (and b!113686 res!93898) b!113684))

(assert (= (and b!113684 res!93897) b!113678))

(assert (= (and b!113678 res!93896) b!113683))

(assert (= (and b!113683 res!93900) b!113681))

(assert (= (and b!113681 res!93901) b!113679))

(assert (= (and b!113679 res!93894) b!113685))

(assert (= (and b!113685 res!93899) b!113682))

(assert (= (and b!113683 res!93902) b!113677))

(assert (= start!22462 b!113680))

(declare-fun m!169807 () Bool)

(assert (=> b!113685 m!169807))

(assert (=> b!113685 m!169807))

(declare-fun m!169809 () Bool)

(assert (=> b!113685 m!169809))

(declare-fun m!169811 () Bool)

(assert (=> b!113679 m!169811))

(declare-fun m!169813 () Bool)

(assert (=> b!113677 m!169813))

(declare-fun m!169815 () Bool)

(assert (=> start!22462 m!169815))

(declare-fun m!169817 () Bool)

(assert (=> b!113681 m!169817))

(declare-fun m!169819 () Bool)

(assert (=> b!113681 m!169819))

(declare-fun m!169821 () Bool)

(assert (=> b!113680 m!169821))

(declare-fun m!169823 () Bool)

(assert (=> b!113682 m!169823))

(declare-fun m!169825 () Bool)

(assert (=> b!113683 m!169825))

(declare-fun m!169827 () Bool)

(assert (=> b!113683 m!169827))

(declare-fun m!169829 () Bool)

(assert (=> b!113683 m!169829))

(declare-fun m!169831 () Bool)

(assert (=> b!113683 m!169831))

(declare-fun m!169833 () Bool)

(assert (=> b!113686 m!169833))

(declare-fun m!169835 () Bool)

(assert (=> b!113684 m!169835))

(push 1)

(assert (not b!113682))

(assert (not b!113683))

(assert (not b!113679))

(assert (not b!113677))

(assert (not start!22462))

(assert (not b!113686))

(assert (not b!113684))

(assert (not b!113685))

(assert (not b!113680))

(assert (not b!113681))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!36514 () Bool)

(assert (=> d!36514 (= (array_inv!2151 (buf!2757 thiss!1305)) (bvsge (size!2349 (buf!2757 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!113680 d!36514))

(declare-fun d!36518 () Bool)

(declare-datatypes ((tuple2!9384 0))(
  ( (tuple2!9385 (_1!4954 Bool) (_2!4954 BitStream!4172)) )
))
(declare-fun lt!172700 () tuple2!9384)

(declare-fun readBit!0 (BitStream!4172) tuple2!9384)

(assert (=> d!36518 (= lt!172700 (readBit!0 (readerFrom!0 (_2!4949 lt!172679) (currentBit!5338 thiss!1305) (currentByte!5343 thiss!1305))))))

(assert (=> d!36518 (= (readBitPure!0 (readerFrom!0 (_2!4949 lt!172679) (currentBit!5338 thiss!1305) (currentByte!5343 thiss!1305))) (tuple2!9377 (_2!4954 lt!172700) (_1!4954 lt!172700)))))

(declare-fun bs!8877 () Bool)

(assert (= bs!8877 d!36518))

(assert (=> bs!8877 m!169807))

(declare-fun m!169863 () Bool)

(assert (=> bs!8877 m!169863))

(assert (=> b!113685 d!36518))

(declare-fun d!36522 () Bool)

(declare-fun e!74606 () Bool)

(assert (=> d!36522 e!74606))

(declare-fun res!93935 () Bool)

(assert (=> d!36522 (=> (not res!93935) (not e!74606))))

(assert (=> d!36522 (= res!93935 (invariant!0 (currentBit!5338 (_2!4949 lt!172679)) (currentByte!5343 (_2!4949 lt!172679)) (size!2349 (buf!2757 (_2!4949 lt!172679)))))))

(assert (=> d!36522 (= (readerFrom!0 (_2!4949 lt!172679) (currentBit!5338 thiss!1305) (currentByte!5343 thiss!1305)) (BitStream!4173 (buf!2757 (_2!4949 lt!172679)) (currentByte!5343 thiss!1305) (currentBit!5338 thiss!1305)))))

(declare-fun b!113716 () Bool)

(assert (=> b!113716 (= e!74606 (invariant!0 (currentBit!5338 thiss!1305) (currentByte!5343 thiss!1305) (size!2349 (buf!2757 (_2!4949 lt!172679)))))))

(assert (= (and d!36522 res!93935) b!113716))

(declare-fun m!169865 () Bool)

(assert (=> d!36522 m!169865))

(assert (=> b!113716 m!169813))

(assert (=> b!113685 d!36522))

(declare-fun d!36524 () Bool)

(declare-fun res!93943 () Bool)

(declare-fun e!74611 () Bool)

(assert (=> d!36524 (=> (not res!93943) (not e!74611))))

(assert (=> d!36524 (= res!93943 (= (size!2349 (buf!2757 thiss!1305)) (size!2349 (buf!2757 (_2!4949 lt!172679)))))))

(assert (=> d!36524 (= (isPrefixOf!0 thiss!1305 (_2!4949 lt!172679)) e!74611)))

(declare-fun b!113723 () Bool)

(declare-fun res!93944 () Bool)

(assert (=> b!113723 (=> (not res!93944) (not e!74611))))

(assert (=> b!113723 (= res!93944 (bvsle (bitIndex!0 (size!2349 (buf!2757 thiss!1305)) (currentByte!5343 thiss!1305) (currentBit!5338 thiss!1305)) (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!172679))) (currentByte!5343 (_2!4949 lt!172679)) (currentBit!5338 (_2!4949 lt!172679)))))))

(declare-fun b!113724 () Bool)

(declare-fun e!74612 () Bool)

(assert (=> b!113724 (= e!74611 e!74612)))

(declare-fun res!93942 () Bool)

(assert (=> b!113724 (=> res!93942 e!74612)))

(assert (=> b!113724 (= res!93942 (= (size!2349 (buf!2757 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!113725 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5169 array!5169 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113725 (= e!74612 (arrayBitRangesEq!0 (buf!2757 thiss!1305) (buf!2757 (_2!4949 lt!172679)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2349 (buf!2757 thiss!1305)) (currentByte!5343 thiss!1305) (currentBit!5338 thiss!1305))))))

(assert (= (and d!36524 res!93943) b!113723))

(assert (= (and b!113723 res!93944) b!113724))

(assert (= (and b!113724 (not res!93942)) b!113725))

(assert (=> b!113723 m!169819))

(assert (=> b!113723 m!169817))

(assert (=> b!113725 m!169819))

(assert (=> b!113725 m!169819))

(declare-fun m!169867 () Bool)

(assert (=> b!113725 m!169867))

(assert (=> b!113679 d!36524))

(declare-fun d!36526 () Bool)

(declare-fun e!74615 () Bool)

(assert (=> d!36526 e!74615))

(declare-fun res!93950 () Bool)

(assert (=> d!36526 (=> (not res!93950) (not e!74615))))

(declare-fun lt!172714 () (_ BitVec 64))

(declare-fun lt!172713 () (_ BitVec 64))

(declare-fun lt!172718 () (_ BitVec 64))

(assert (=> d!36526 (= res!93950 (= lt!172714 (bvsub lt!172713 lt!172718)))))

(assert (=> d!36526 (or (= (bvand lt!172713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172718 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172713 lt!172718) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36526 (= lt!172718 (remainingBits!0 ((_ sign_extend 32) (size!2349 (buf!2757 (_2!4949 lt!172679)))) ((_ sign_extend 32) (currentByte!5343 (_2!4949 lt!172679))) ((_ sign_extend 32) (currentBit!5338 (_2!4949 lt!172679)))))))

(declare-fun lt!172716 () (_ BitVec 64))

(declare-fun lt!172717 () (_ BitVec 64))

(assert (=> d!36526 (= lt!172713 (bvmul lt!172716 lt!172717))))

(assert (=> d!36526 (or (= lt!172716 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172717 (bvsdiv (bvmul lt!172716 lt!172717) lt!172716)))))

(assert (=> d!36526 (= lt!172717 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36526 (= lt!172716 ((_ sign_extend 32) (size!2349 (buf!2757 (_2!4949 lt!172679)))))))

(assert (=> d!36526 (= lt!172714 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5343 (_2!4949 lt!172679))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5338 (_2!4949 lt!172679)))))))

(assert (=> d!36526 (invariant!0 (currentBit!5338 (_2!4949 lt!172679)) (currentByte!5343 (_2!4949 lt!172679)) (size!2349 (buf!2757 (_2!4949 lt!172679))))))

(assert (=> d!36526 (= (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!172679))) (currentByte!5343 (_2!4949 lt!172679)) (currentBit!5338 (_2!4949 lt!172679))) lt!172714)))

(declare-fun b!113730 () Bool)

(declare-fun res!93949 () Bool)

(assert (=> b!113730 (=> (not res!93949) (not e!74615))))

(assert (=> b!113730 (= res!93949 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172714))))

(declare-fun b!113731 () Bool)

(declare-fun lt!172715 () (_ BitVec 64))

(assert (=> b!113731 (= e!74615 (bvsle lt!172714 (bvmul lt!172715 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113731 (or (= lt!172715 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172715 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172715)))))

(assert (=> b!113731 (= lt!172715 ((_ sign_extend 32) (size!2349 (buf!2757 (_2!4949 lt!172679)))))))

(assert (= (and d!36526 res!93950) b!113730))

(assert (= (and b!113730 res!93949) b!113731))

(declare-fun m!169869 () Bool)

(assert (=> d!36526 m!169869))

(assert (=> d!36526 m!169865))

(assert (=> b!113681 d!36526))

(declare-fun d!36528 () Bool)

(declare-fun e!74616 () Bool)

(assert (=> d!36528 e!74616))

(declare-fun res!93952 () Bool)

(assert (=> d!36528 (=> (not res!93952) (not e!74616))))

(declare-fun lt!172724 () (_ BitVec 64))

(declare-fun lt!172720 () (_ BitVec 64))

(declare-fun lt!172719 () (_ BitVec 64))

(assert (=> d!36528 (= res!93952 (= lt!172720 (bvsub lt!172719 lt!172724)))))

(assert (=> d!36528 (or (= (bvand lt!172719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172724 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172719 lt!172724) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36528 (= lt!172724 (remainingBits!0 ((_ sign_extend 32) (size!2349 (buf!2757 thiss!1305))) ((_ sign_extend 32) (currentByte!5343 thiss!1305)) ((_ sign_extend 32) (currentBit!5338 thiss!1305))))))

(declare-fun lt!172722 () (_ BitVec 64))

(declare-fun lt!172723 () (_ BitVec 64))

(assert (=> d!36528 (= lt!172719 (bvmul lt!172722 lt!172723))))

(assert (=> d!36528 (or (= lt!172722 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172723 (bvsdiv (bvmul lt!172722 lt!172723) lt!172722)))))

(assert (=> d!36528 (= lt!172723 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36528 (= lt!172722 ((_ sign_extend 32) (size!2349 (buf!2757 thiss!1305))))))

(assert (=> d!36528 (= lt!172720 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5343 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5338 thiss!1305))))))

(assert (=> d!36528 (invariant!0 (currentBit!5338 thiss!1305) (currentByte!5343 thiss!1305) (size!2349 (buf!2757 thiss!1305)))))

(assert (=> d!36528 (= (bitIndex!0 (size!2349 (buf!2757 thiss!1305)) (currentByte!5343 thiss!1305) (currentBit!5338 thiss!1305)) lt!172720)))

(declare-fun b!113732 () Bool)

(declare-fun res!93951 () Bool)

(assert (=> b!113732 (=> (not res!93951) (not e!74616))))

(assert (=> b!113732 (= res!93951 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172720))))

(declare-fun b!113733 () Bool)

(declare-fun lt!172721 () (_ BitVec 64))

(assert (=> b!113733 (= e!74616 (bvsle lt!172720 (bvmul lt!172721 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113733 (or (= lt!172721 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172721 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172721)))))

(assert (=> b!113733 (= lt!172721 ((_ sign_extend 32) (size!2349 (buf!2757 thiss!1305))))))

(assert (= (and d!36528 res!93952) b!113732))

(assert (= (and b!113732 res!93951) b!113733))

(declare-fun m!169871 () Bool)

(assert (=> d!36528 m!169871))

(declare-fun m!169873 () Bool)

(assert (=> d!36528 m!169873))

(assert (=> b!113681 d!36528))

(declare-fun d!36530 () Bool)

(assert (=> d!36530 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2349 (buf!2757 thiss!1305))) ((_ sign_extend 32) (currentByte!5343 thiss!1305)) ((_ sign_extend 32) (currentBit!5338 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2349 (buf!2757 thiss!1305))) ((_ sign_extend 32) (currentByte!5343 thiss!1305)) ((_ sign_extend 32) (currentBit!5338 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8878 () Bool)

(assert (= bs!8878 d!36530))

(assert (=> bs!8878 m!169871))

(assert (=> b!113686 d!36530))

(declare-fun d!36532 () Bool)

(assert (=> d!36532 (= (invariant!0 (currentBit!5338 thiss!1305) (currentByte!5343 thiss!1305) (size!2349 (buf!2757 (_2!4949 lt!172679)))) (and (bvsge (currentBit!5338 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5338 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5343 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5343 thiss!1305) (size!2349 (buf!2757 (_2!4949 lt!172679)))) (and (= (currentBit!5338 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5343 thiss!1305) (size!2349 (buf!2757 (_2!4949 lt!172679))))))))))

(assert (=> b!113677 d!36532))

(declare-fun d!36534 () Bool)

(declare-fun e!74617 () Bool)

(assert (=> d!36534 e!74617))

(declare-fun res!93954 () Bool)

(assert (=> d!36534 (=> (not res!93954) (not e!74617))))

(declare-fun lt!172725 () (_ BitVec 64))

(declare-fun lt!172730 () (_ BitVec 64))

(declare-fun lt!172726 () (_ BitVec 64))

(assert (=> d!36534 (= res!93954 (= lt!172726 (bvsub lt!172725 lt!172730)))))

(assert (=> d!36534 (or (= (bvand lt!172725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172730 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172725 lt!172730) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36534 (= lt!172730 (remainingBits!0 ((_ sign_extend 32) (size!2349 (buf!2757 (_1!4950 lt!172681)))) ((_ sign_extend 32) (currentByte!5343 (_1!4950 lt!172681))) ((_ sign_extend 32) (currentBit!5338 (_1!4950 lt!172681)))))))

(declare-fun lt!172728 () (_ BitVec 64))

(declare-fun lt!172729 () (_ BitVec 64))

(assert (=> d!36534 (= lt!172725 (bvmul lt!172728 lt!172729))))

(assert (=> d!36534 (or (= lt!172728 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172729 (bvsdiv (bvmul lt!172728 lt!172729) lt!172728)))))

(assert (=> d!36534 (= lt!172729 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36534 (= lt!172728 ((_ sign_extend 32) (size!2349 (buf!2757 (_1!4950 lt!172681)))))))

(assert (=> d!36534 (= lt!172726 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5343 (_1!4950 lt!172681))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5338 (_1!4950 lt!172681)))))))

(assert (=> d!36534 (invariant!0 (currentBit!5338 (_1!4950 lt!172681)) (currentByte!5343 (_1!4950 lt!172681)) (size!2349 (buf!2757 (_1!4950 lt!172681))))))

(assert (=> d!36534 (= (bitIndex!0 (size!2349 (buf!2757 (_1!4950 lt!172681))) (currentByte!5343 (_1!4950 lt!172681)) (currentBit!5338 (_1!4950 lt!172681))) lt!172726)))

(declare-fun b!113734 () Bool)

(declare-fun res!93953 () Bool)

(assert (=> b!113734 (=> (not res!93953) (not e!74617))))

(assert (=> b!113734 (= res!93953 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172726))))

(declare-fun b!113735 () Bool)

(declare-fun lt!172727 () (_ BitVec 64))

(assert (=> b!113735 (= e!74617 (bvsle lt!172726 (bvmul lt!172727 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113735 (or (= lt!172727 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172727 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172727)))))

(assert (=> b!113735 (= lt!172727 ((_ sign_extend 32) (size!2349 (buf!2757 (_1!4950 lt!172681)))))))

(assert (= (and d!36534 res!93954) b!113734))

(assert (= (and b!113734 res!93953) b!113735))

(declare-fun m!169875 () Bool)

(assert (=> d!36534 m!169875))

(declare-fun m!169877 () Bool)

(assert (=> d!36534 m!169877))

(assert (=> b!113682 d!36534))

(declare-fun d!36536 () Bool)

(assert (=> d!36536 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!113684 d!36536))

(declare-fun d!36538 () Bool)

(declare-fun res!93956 () Bool)

(declare-fun e!74618 () Bool)

(assert (=> d!36538 (=> (not res!93956) (not e!74618))))

(assert (=> d!36538 (= res!93956 (= (size!2349 (buf!2757 thiss!1305)) (size!2349 (buf!2757 (_2!4949 lt!172680)))))))

(assert (=> d!36538 (= (isPrefixOf!0 thiss!1305 (_2!4949 lt!172680)) e!74618)))

(declare-fun b!113736 () Bool)

(declare-fun res!93957 () Bool)

(assert (=> b!113736 (=> (not res!93957) (not e!74618))))

(assert (=> b!113736 (= res!93957 (bvsle (bitIndex!0 (size!2349 (buf!2757 thiss!1305)) (currentByte!5343 thiss!1305) (currentBit!5338 thiss!1305)) (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!172680))) (currentByte!5343 (_2!4949 lt!172680)) (currentBit!5338 (_2!4949 lt!172680)))))))

(declare-fun b!113737 () Bool)

(declare-fun e!74619 () Bool)

(assert (=> b!113737 (= e!74618 e!74619)))

(declare-fun res!93955 () Bool)

(assert (=> b!113737 (=> res!93955 e!74619)))

(assert (=> b!113737 (= res!93955 (= (size!2349 (buf!2757 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!113738 () Bool)

(assert (=> b!113738 (= e!74619 (arrayBitRangesEq!0 (buf!2757 thiss!1305) (buf!2757 (_2!4949 lt!172680)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2349 (buf!2757 thiss!1305)) (currentByte!5343 thiss!1305) (currentBit!5338 thiss!1305))))))

(assert (= (and d!36538 res!93956) b!113736))

(assert (= (and b!113736 res!93957) b!113737))

(assert (= (and b!113737 (not res!93955)) b!113738))

(assert (=> b!113736 m!169819))

(declare-fun m!169879 () Bool)

(assert (=> b!113736 m!169879))

(assert (=> b!113738 m!169819))

(assert (=> b!113738 m!169819))

(declare-fun m!169881 () Bool)

(assert (=> b!113738 m!169881))

(assert (=> b!113683 d!36538))

(declare-fun d!36540 () Bool)

(assert (=> d!36540 (isPrefixOf!0 thiss!1305 (_2!4949 lt!172680))))

(declare-fun lt!172733 () Unit!6983)

(declare-fun choose!30 (BitStream!4172 BitStream!4172 BitStream!4172) Unit!6983)

(assert (=> d!36540 (= lt!172733 (choose!30 thiss!1305 (_2!4949 lt!172679) (_2!4949 lt!172680)))))

(assert (=> d!36540 (isPrefixOf!0 thiss!1305 (_2!4949 lt!172679))))

(assert (=> d!36540 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4949 lt!172679) (_2!4949 lt!172680)) lt!172733)))

(declare-fun bs!8879 () Bool)

(assert (= bs!8879 d!36540))

(assert (=> bs!8879 m!169825))

(declare-fun m!169883 () Bool)

(assert (=> bs!8879 m!169883))

(assert (=> bs!8879 m!169811))

(assert (=> b!113683 d!36540))

(declare-fun b!113856 () Bool)

(declare-datatypes ((tuple2!9392 0))(
  ( (tuple2!9393 (_1!4958 BitStream!4172) (_2!4958 (_ BitVec 64))) )
))
(declare-fun lt!173118 () tuple2!9392)

(declare-fun e!74686 () Bool)

(declare-datatypes ((tuple2!9394 0))(
  ( (tuple2!9395 (_1!4959 BitStream!4172) (_2!4959 BitStream!4172)) )
))
(declare-fun lt!173102 () tuple2!9394)

(assert (=> b!113856 (= e!74686 (and (= (_2!4958 lt!173118) v!199) (= (_1!4958 lt!173118) (_2!4959 lt!173102))))))

(declare-fun lt!173107 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9392)

(assert (=> b!113856 (= lt!173118 (readNLeastSignificantBitsLoopPure!0 (_1!4959 lt!173102) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173107))))

(declare-fun lt!173108 () Unit!6983)

(declare-fun lt!173106 () Unit!6983)

(assert (=> b!113856 (= lt!173108 lt!173106)))

(declare-fun lt!173131 () tuple2!9374)

(declare-fun lt!173109 () (_ BitVec 64))

(assert (=> b!113856 (validate_offset_bits!1 ((_ sign_extend 32) (size!2349 (buf!2757 (_2!4949 lt!173131)))) ((_ sign_extend 32) (currentByte!5343 (_2!4949 lt!172679))) ((_ sign_extend 32) (currentBit!5338 (_2!4949 lt!172679))) lt!173109)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4172 array!5169 (_ BitVec 64)) Unit!6983)

(assert (=> b!113856 (= lt!173106 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4949 lt!172679) (buf!2757 (_2!4949 lt!173131)) lt!173109))))

(declare-fun e!74687 () Bool)

(assert (=> b!113856 e!74687))

(declare-fun res!94049 () Bool)

(assert (=> b!113856 (=> (not res!94049) (not e!74687))))

(assert (=> b!113856 (= res!94049 (and (= (size!2349 (buf!2757 (_2!4949 lt!172679))) (size!2349 (buf!2757 (_2!4949 lt!173131)))) (bvsge lt!173109 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113856 (= lt!173109 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!113856 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113856 (= lt!173107 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!113856 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!4172 BitStream!4172) tuple2!9394)

(assert (=> b!113856 (= lt!173102 (reader!0 (_2!4949 lt!172679) (_2!4949 lt!173131)))))

(declare-fun b!113857 () Bool)

(declare-fun e!74688 () Bool)

(declare-fun lt!173091 () tuple2!9376)

(declare-fun lt!173105 () tuple2!9376)

(assert (=> b!113857 (= e!74688 (= (_2!4950 lt!173091) (_2!4950 lt!173105)))))

(declare-fun b!113858 () Bool)

(declare-fun e!74682 () (_ BitVec 64))

(assert (=> b!113858 (= e!74682 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!113859 () Bool)

(declare-fun lt!173112 () tuple2!9376)

(declare-fun lt!173098 () tuple2!9374)

(assert (=> b!113859 (= lt!173112 (readBitPure!0 (readerFrom!0 (_2!4949 lt!173098) (currentBit!5338 (_2!4949 lt!172679)) (currentByte!5343 (_2!4949 lt!172679)))))))

(declare-fun res!94046 () Bool)

(declare-fun lt!173116 () Bool)

(assert (=> b!113859 (= res!94046 (and (= (_2!4950 lt!173112) lt!173116) (= (_1!4950 lt!173112) (_2!4949 lt!173098))))))

(declare-fun e!74685 () Bool)

(assert (=> b!113859 (=> (not res!94046) (not e!74685))))

(declare-fun e!74683 () Bool)

(assert (=> b!113859 (= e!74683 e!74685)))

(declare-fun b!113860 () Bool)

(declare-fun res!94054 () Bool)

(assert (=> b!113860 (=> (not res!94054) (not e!74686))))

(assert (=> b!113860 (= res!94054 (isPrefixOf!0 (_2!4949 lt!172679) (_2!4949 lt!173131)))))

(declare-fun b!113861 () Bool)

(declare-fun res!94050 () Bool)

(declare-fun call!1456 () Bool)

(assert (=> b!113861 (= res!94050 call!1456)))

(assert (=> b!113861 (=> (not res!94050) (not e!74683))))

(declare-fun lt!173135 () BitStream!4172)

(declare-fun c!6904 () Bool)

(declare-fun bm!1453 () Bool)

(assert (=> bm!1453 (= call!1456 (isPrefixOf!0 (ite c!6904 (_2!4949 lt!172679) lt!173135) (ite c!6904 (_2!4949 lt!173098) lt!173135)))))

(declare-fun b!113862 () Bool)

(declare-fun e!74684 () tuple2!9374)

(declare-fun lt!173114 () Unit!6983)

(assert (=> b!113862 (= e!74684 (tuple2!9375 lt!173114 (_2!4949 lt!172679)))))

(assert (=> b!113862 (= lt!173135 (_2!4949 lt!172679))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4172) Unit!6983)

(assert (=> b!113862 (= lt!173114 (lemmaIsPrefixRefl!0 lt!173135))))

(assert (=> b!113862 call!1456))

(declare-fun b!113863 () Bool)

(declare-fun lt!173095 () tuple2!9374)

(declare-fun Unit!6993 () Unit!6983)

(assert (=> b!113863 (= e!74684 (tuple2!9375 Unit!6993 (_2!4949 lt!173095)))))

(assert (=> b!113863 (= lt!173116 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113863 (= lt!173098 (appendBit!0 (_2!4949 lt!172679) lt!173116))))

(declare-fun res!94053 () Bool)

(assert (=> b!113863 (= res!94053 (= (size!2349 (buf!2757 (_2!4949 lt!172679))) (size!2349 (buf!2757 (_2!4949 lt!173098)))))))

(assert (=> b!113863 (=> (not res!94053) (not e!74683))))

(assert (=> b!113863 e!74683))

(declare-fun lt!173127 () tuple2!9374)

(assert (=> b!113863 (= lt!173127 lt!173098)))

(assert (=> b!113863 (= lt!173095 (appendNLeastSignificantBitsLoop!0 (_2!4949 lt!173127) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!173130 () Unit!6983)

(assert (=> b!113863 (= lt!173130 (lemmaIsPrefixTransitive!0 (_2!4949 lt!172679) (_2!4949 lt!173127) (_2!4949 lt!173095)))))

(assert (=> b!113863 (isPrefixOf!0 (_2!4949 lt!172679) (_2!4949 lt!173095))))

(declare-fun lt!173134 () Unit!6983)

(assert (=> b!113863 (= lt!173134 lt!173130)))

(assert (=> b!113863 (invariant!0 (currentBit!5338 (_2!4949 lt!172679)) (currentByte!5343 (_2!4949 lt!172679)) (size!2349 (buf!2757 (_2!4949 lt!173127))))))

(declare-fun lt!173093 () BitStream!4172)

(assert (=> b!113863 (= lt!173093 (BitStream!4173 (buf!2757 (_2!4949 lt!173127)) (currentByte!5343 (_2!4949 lt!172679)) (currentBit!5338 (_2!4949 lt!172679))))))

(assert (=> b!113863 (invariant!0 (currentBit!5338 lt!173093) (currentByte!5343 lt!173093) (size!2349 (buf!2757 (_2!4949 lt!173095))))))

(declare-fun lt!173122 () BitStream!4172)

(assert (=> b!113863 (= lt!173122 (BitStream!4173 (buf!2757 (_2!4949 lt!173095)) (currentByte!5343 lt!173093) (currentBit!5338 lt!173093)))))

(assert (=> b!113863 (= lt!173091 (readBitPure!0 lt!173093))))

(assert (=> b!113863 (= lt!173105 (readBitPure!0 lt!173122))))

(declare-fun lt!173111 () Unit!6983)

(declare-fun readBitPrefixLemma!0 (BitStream!4172 BitStream!4172) Unit!6983)

(assert (=> b!113863 (= lt!173111 (readBitPrefixLemma!0 lt!173093 (_2!4949 lt!173095)))))

(declare-fun res!94047 () Bool)

(assert (=> b!113863 (= res!94047 (= (bitIndex!0 (size!2349 (buf!2757 (_1!4950 lt!173091))) (currentByte!5343 (_1!4950 lt!173091)) (currentBit!5338 (_1!4950 lt!173091))) (bitIndex!0 (size!2349 (buf!2757 (_1!4950 lt!173105))) (currentByte!5343 (_1!4950 lt!173105)) (currentBit!5338 (_1!4950 lt!173105)))))))

(assert (=> b!113863 (=> (not res!94047) (not e!74688))))

(assert (=> b!113863 e!74688))

(declare-fun lt!173117 () Unit!6983)

(assert (=> b!113863 (= lt!173117 lt!173111)))

(declare-fun lt!173101 () tuple2!9394)

(assert (=> b!113863 (= lt!173101 (reader!0 (_2!4949 lt!172679) (_2!4949 lt!173095)))))

(declare-fun lt!173133 () tuple2!9394)

(assert (=> b!113863 (= lt!173133 (reader!0 (_2!4949 lt!173127) (_2!4949 lt!173095)))))

(declare-fun lt!173124 () tuple2!9376)

(assert (=> b!113863 (= lt!173124 (readBitPure!0 (_1!4959 lt!173101)))))

(assert (=> b!113863 (= (_2!4950 lt!173124) lt!173116)))

(declare-fun lt!173113 () Unit!6983)

(declare-fun Unit!6998 () Unit!6983)

(assert (=> b!113863 (= lt!173113 Unit!6998)))

(declare-fun lt!173103 () (_ BitVec 64))

(assert (=> b!113863 (= lt!173103 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!173123 () (_ BitVec 64))

(assert (=> b!113863 (= lt!173123 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!173092 () Unit!6983)

(assert (=> b!113863 (= lt!173092 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4949 lt!172679) (buf!2757 (_2!4949 lt!173095)) lt!173123))))

(assert (=> b!113863 (validate_offset_bits!1 ((_ sign_extend 32) (size!2349 (buf!2757 (_2!4949 lt!173095)))) ((_ sign_extend 32) (currentByte!5343 (_2!4949 lt!172679))) ((_ sign_extend 32) (currentBit!5338 (_2!4949 lt!172679))) lt!173123)))

(declare-fun lt!173129 () Unit!6983)

(assert (=> b!113863 (= lt!173129 lt!173092)))

(declare-fun lt!173099 () tuple2!9392)

(assert (=> b!113863 (= lt!173099 (readNLeastSignificantBitsLoopPure!0 (_1!4959 lt!173101) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173103))))

(declare-fun lt!173132 () (_ BitVec 64))

(assert (=> b!113863 (= lt!173132 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!173121 () Unit!6983)

(assert (=> b!113863 (= lt!173121 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4949 lt!173127) (buf!2757 (_2!4949 lt!173095)) lt!173132))))

(assert (=> b!113863 (validate_offset_bits!1 ((_ sign_extend 32) (size!2349 (buf!2757 (_2!4949 lt!173095)))) ((_ sign_extend 32) (currentByte!5343 (_2!4949 lt!173127))) ((_ sign_extend 32) (currentBit!5338 (_2!4949 lt!173127))) lt!173132)))

(declare-fun lt!173126 () Unit!6983)

(assert (=> b!113863 (= lt!173126 lt!173121)))

(declare-fun lt!173120 () tuple2!9392)

(assert (=> b!113863 (= lt!173120 (readNLeastSignificantBitsLoopPure!0 (_1!4959 lt!173133) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!173103 (ite (_2!4950 lt!173124) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!173104 () tuple2!9392)

(assert (=> b!113863 (= lt!173104 (readNLeastSignificantBitsLoopPure!0 (_1!4959 lt!173101) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173103))))

(declare-fun c!6905 () Bool)

(assert (=> b!113863 (= c!6905 (_2!4950 (readBitPure!0 (_1!4959 lt!173101))))))

(declare-fun lt!173128 () tuple2!9392)

(declare-fun withMovedBitIndex!0 (BitStream!4172 (_ BitVec 64)) BitStream!4172)

(assert (=> b!113863 (= lt!173128 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4959 lt!173101) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!173103 e!74682)))))

(declare-fun lt!173119 () Unit!6983)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6983)

(assert (=> b!113863 (= lt!173119 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4959 lt!173101) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173103))))

(assert (=> b!113863 (and (= (_2!4958 lt!173104) (_2!4958 lt!173128)) (= (_1!4958 lt!173104) (_1!4958 lt!173128)))))

(declare-fun lt!173125 () Unit!6983)

(assert (=> b!113863 (= lt!173125 lt!173119)))

(assert (=> b!113863 (= (_1!4959 lt!173101) (withMovedBitIndex!0 (_2!4959 lt!173101) (bvsub (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!172679))) (currentByte!5343 (_2!4949 lt!172679)) (currentBit!5338 (_2!4949 lt!172679))) (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!173095))) (currentByte!5343 (_2!4949 lt!173095)) (currentBit!5338 (_2!4949 lt!173095))))))))

(declare-fun lt!173115 () Unit!6983)

(declare-fun Unit!6999 () Unit!6983)

(assert (=> b!113863 (= lt!173115 Unit!6999)))

(assert (=> b!113863 (= (_1!4959 lt!173133) (withMovedBitIndex!0 (_2!4959 lt!173133) (bvsub (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!173127))) (currentByte!5343 (_2!4949 lt!173127)) (currentBit!5338 (_2!4949 lt!173127))) (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!173095))) (currentByte!5343 (_2!4949 lt!173095)) (currentBit!5338 (_2!4949 lt!173095))))))))

(declare-fun lt!173096 () Unit!6983)

(declare-fun Unit!7000 () Unit!6983)

(assert (=> b!113863 (= lt!173096 Unit!7000)))

(assert (=> b!113863 (= (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!172679))) (currentByte!5343 (_2!4949 lt!172679)) (currentBit!5338 (_2!4949 lt!172679))) (bvsub (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!173127))) (currentByte!5343 (_2!4949 lt!173127)) (currentBit!5338 (_2!4949 lt!173127))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!173110 () Unit!6983)

(declare-fun Unit!7001 () Unit!6983)

(assert (=> b!113863 (= lt!173110 Unit!7001)))

(assert (=> b!113863 (= (_2!4958 lt!173099) (_2!4958 lt!173120))))

(declare-fun lt!173100 () Unit!6983)

(declare-fun Unit!7002 () Unit!6983)

(assert (=> b!113863 (= lt!173100 Unit!7002)))

(assert (=> b!113863 (= (_1!4958 lt!173099) (_2!4959 lt!173101))))

(declare-fun b!113864 () Bool)

(assert (=> b!113864 (= e!74687 (validate_offset_bits!1 ((_ sign_extend 32) (size!2349 (buf!2757 (_2!4949 lt!172679)))) ((_ sign_extend 32) (currentByte!5343 (_2!4949 lt!172679))) ((_ sign_extend 32) (currentBit!5338 (_2!4949 lt!172679))) lt!173109))))

(declare-fun d!36542 () Bool)

(assert (=> d!36542 e!74686))

(declare-fun res!94048 () Bool)

(assert (=> d!36542 (=> (not res!94048) (not e!74686))))

(assert (=> d!36542 (= res!94048 (= (size!2349 (buf!2757 (_2!4949 lt!172679))) (size!2349 (buf!2757 (_2!4949 lt!173131)))))))

(assert (=> d!36542 (= lt!173131 e!74684)))

(assert (=> d!36542 (= c!6904 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!36542 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36542 (= (appendNLeastSignificantBitsLoop!0 (_2!4949 lt!172679) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!173131)))

(declare-fun b!113865 () Bool)

(declare-fun res!94051 () Bool)

(assert (=> b!113865 (= res!94051 (= (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!173098))) (currentByte!5343 (_2!4949 lt!173098)) (currentBit!5338 (_2!4949 lt!173098))) (bvadd (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!172679))) (currentByte!5343 (_2!4949 lt!172679)) (currentBit!5338 (_2!4949 lt!172679))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!113865 (=> (not res!94051) (not e!74683))))

(declare-fun b!113866 () Bool)

(declare-fun res!94052 () Bool)

(assert (=> b!113866 (=> (not res!94052) (not e!74686))))

(declare-fun lt!173097 () (_ BitVec 64))

(declare-fun lt!173094 () (_ BitVec 64))

(assert (=> b!113866 (= res!94052 (= (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!173131))) (currentByte!5343 (_2!4949 lt!173131)) (currentBit!5338 (_2!4949 lt!173131))) (bvadd lt!173094 lt!173097)))))

(assert (=> b!113866 (or (not (= (bvand lt!173094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173097 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!173094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!173094 lt!173097) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113866 (= lt!173097 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!113866 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113866 (= lt!173094 (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!172679))) (currentByte!5343 (_2!4949 lt!172679)) (currentBit!5338 (_2!4949 lt!172679))))))

(declare-fun b!113867 () Bool)

(assert (=> b!113867 (= e!74685 (= (bitIndex!0 (size!2349 (buf!2757 (_1!4950 lt!173112))) (currentByte!5343 (_1!4950 lt!173112)) (currentBit!5338 (_1!4950 lt!173112))) (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!173098))) (currentByte!5343 (_2!4949 lt!173098)) (currentBit!5338 (_2!4949 lt!173098)))))))

(declare-fun b!113868 () Bool)

(assert (=> b!113868 (= e!74682 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!36542 c!6904) b!113863))

(assert (= (and d!36542 (not c!6904)) b!113862))

(assert (= (and b!113863 res!94053) b!113865))

(assert (= (and b!113865 res!94051) b!113861))

(assert (= (and b!113861 res!94050) b!113859))

(assert (= (and b!113859 res!94046) b!113867))

(assert (= (and b!113863 res!94047) b!113857))

(assert (= (and b!113863 c!6905) b!113858))

(assert (= (and b!113863 (not c!6905)) b!113868))

(assert (= (or b!113861 b!113862) bm!1453))

(assert (= (and d!36542 res!94048) b!113866))

(assert (= (and b!113866 res!94052) b!113860))

(assert (= (and b!113860 res!94054) b!113856))

(assert (= (and b!113856 res!94049) b!113864))

(declare-fun m!169991 () Bool)

(assert (=> b!113862 m!169991))

(declare-fun m!169993 () Bool)

(assert (=> b!113863 m!169993))

(declare-fun m!169995 () Bool)

(assert (=> b!113863 m!169995))

(declare-fun m!169997 () Bool)

(assert (=> b!113863 m!169997))

(declare-fun m!169999 () Bool)

(assert (=> b!113863 m!169999))

(declare-fun m!170001 () Bool)

(assert (=> b!113863 m!170001))

(declare-fun m!170003 () Bool)

(assert (=> b!113863 m!170003))

(declare-fun m!170005 () Bool)

(assert (=> b!113863 m!170005))

(declare-fun m!170007 () Bool)

(assert (=> b!113863 m!170007))

(declare-fun m!170009 () Bool)

(assert (=> b!113863 m!170009))

(declare-fun m!170011 () Bool)

(assert (=> b!113863 m!170011))

(declare-fun m!170013 () Bool)

(assert (=> b!113863 m!170013))

(declare-fun m!170015 () Bool)

(assert (=> b!113863 m!170015))

(declare-fun m!170017 () Bool)

(assert (=> b!113863 m!170017))

(declare-fun m!170019 () Bool)

(assert (=> b!113863 m!170019))

(declare-fun m!170021 () Bool)

(assert (=> b!113863 m!170021))

(declare-fun m!170023 () Bool)

(assert (=> b!113863 m!170023))

(declare-fun m!170025 () Bool)

(assert (=> b!113863 m!170025))

(assert (=> b!113863 m!169817))

(declare-fun m!170027 () Bool)

(assert (=> b!113863 m!170027))

(declare-fun m!170029 () Bool)

(assert (=> b!113863 m!170029))

(declare-fun m!170031 () Bool)

(assert (=> b!113863 m!170031))

(declare-fun m!170033 () Bool)

(assert (=> b!113863 m!170033))

(declare-fun m!170035 () Bool)

(assert (=> b!113863 m!170035))

(declare-fun m!170037 () Bool)

(assert (=> b!113863 m!170037))

(declare-fun m!170039 () Bool)

(assert (=> b!113863 m!170039))

(declare-fun m!170041 () Bool)

(assert (=> b!113863 m!170041))

(declare-fun m!170043 () Bool)

(assert (=> b!113863 m!170043))

(assert (=> b!113863 m!170007))

(declare-fun m!170045 () Bool)

(assert (=> b!113863 m!170045))

(declare-fun m!170047 () Bool)

(assert (=> b!113863 m!170047))

(declare-fun m!170049 () Bool)

(assert (=> b!113866 m!170049))

(assert (=> b!113866 m!169817))

(declare-fun m!170051 () Bool)

(assert (=> b!113860 m!170051))

(declare-fun m!170053 () Bool)

(assert (=> bm!1453 m!170053))

(declare-fun m!170055 () Bool)

(assert (=> b!113859 m!170055))

(assert (=> b!113859 m!170055))

(declare-fun m!170057 () Bool)

(assert (=> b!113859 m!170057))

(declare-fun m!170059 () Bool)

(assert (=> b!113864 m!170059))

(declare-fun m!170061 () Bool)

(assert (=> b!113865 m!170061))

(assert (=> b!113865 m!169817))

(declare-fun m!170063 () Bool)

(assert (=> b!113867 m!170063))

(assert (=> b!113867 m!170061))

(declare-fun m!170065 () Bool)

(assert (=> b!113856 m!170065))

(declare-fun m!170067 () Bool)

(assert (=> b!113856 m!170067))

(declare-fun m!170069 () Bool)

(assert (=> b!113856 m!170069))

(assert (=> b!113856 m!170039))

(declare-fun m!170071 () Bool)

(assert (=> b!113856 m!170071))

(assert (=> b!113683 d!36542))

(declare-fun b!113893 () Bool)

(declare-fun e!74700 () Bool)

(declare-fun e!74701 () Bool)

(assert (=> b!113893 (= e!74700 e!74701)))

(declare-fun res!94075 () Bool)

(assert (=> b!113893 (=> (not res!94075) (not e!74701))))

(declare-fun lt!173191 () tuple2!9374)

(declare-fun lt!173192 () tuple2!9376)

(assert (=> b!113893 (= res!94075 (and (= (_2!4950 lt!173192) lt!172682) (= (_1!4950 lt!173192) (_2!4949 lt!173191))))))

(assert (=> b!113893 (= lt!173192 (readBitPure!0 (readerFrom!0 (_2!4949 lt!173191) (currentBit!5338 thiss!1305) (currentByte!5343 thiss!1305))))))

(declare-fun b!113891 () Bool)

(declare-fun res!94074 () Bool)

(assert (=> b!113891 (=> (not res!94074) (not e!74700))))

(declare-fun lt!173189 () (_ BitVec 64))

(declare-fun lt!173190 () (_ BitVec 64))

(assert (=> b!113891 (= res!94074 (= (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!173191))) (currentByte!5343 (_2!4949 lt!173191)) (currentBit!5338 (_2!4949 lt!173191))) (bvadd lt!173189 lt!173190)))))

(assert (=> b!113891 (or (not (= (bvand lt!173189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173190 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!173189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!173189 lt!173190) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113891 (= lt!173190 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!113891 (= lt!173189 (bitIndex!0 (size!2349 (buf!2757 thiss!1305)) (currentByte!5343 thiss!1305) (currentBit!5338 thiss!1305)))))

(declare-fun b!113894 () Bool)

(assert (=> b!113894 (= e!74701 (= (bitIndex!0 (size!2349 (buf!2757 (_1!4950 lt!173192))) (currentByte!5343 (_1!4950 lt!173192)) (currentBit!5338 (_1!4950 lt!173192))) (bitIndex!0 (size!2349 (buf!2757 (_2!4949 lt!173191))) (currentByte!5343 (_2!4949 lt!173191)) (currentBit!5338 (_2!4949 lt!173191)))))))

(declare-fun b!113892 () Bool)

(declare-fun res!94073 () Bool)

(assert (=> b!113892 (=> (not res!94073) (not e!74700))))

(assert (=> b!113892 (= res!94073 (isPrefixOf!0 thiss!1305 (_2!4949 lt!173191)))))

(declare-fun d!36558 () Bool)

(assert (=> d!36558 e!74700))

(declare-fun res!94072 () Bool)

(assert (=> d!36558 (=> (not res!94072) (not e!74700))))

(assert (=> d!36558 (= res!94072 (= (size!2349 (buf!2757 thiss!1305)) (size!2349 (buf!2757 (_2!4949 lt!173191)))))))

(declare-fun choose!16 (BitStream!4172 Bool) tuple2!9374)

(assert (=> d!36558 (= lt!173191 (choose!16 thiss!1305 lt!172682))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!36558 (validate_offset_bit!0 ((_ sign_extend 32) (size!2349 (buf!2757 thiss!1305))) ((_ sign_extend 32) (currentByte!5343 thiss!1305)) ((_ sign_extend 32) (currentBit!5338 thiss!1305)))))

(assert (=> d!36558 (= (appendBit!0 thiss!1305 lt!172682) lt!173191)))

(assert (= (and d!36558 res!94072) b!113891))

(assert (= (and b!113891 res!94074) b!113892))

(assert (= (and b!113892 res!94073) b!113893))

(assert (= (and b!113893 res!94075) b!113894))

(declare-fun m!170155 () Bool)

(assert (=> b!113892 m!170155))

(declare-fun m!170157 () Bool)

(assert (=> b!113893 m!170157))

(assert (=> b!113893 m!170157))

(declare-fun m!170159 () Bool)

(assert (=> b!113893 m!170159))

(declare-fun m!170161 () Bool)

(assert (=> b!113891 m!170161))

(assert (=> b!113891 m!169819))

(declare-fun m!170163 () Bool)

(assert (=> d!36558 m!170163))

(declare-fun m!170165 () Bool)

(assert (=> d!36558 m!170165))

(declare-fun m!170167 () Bool)

(assert (=> b!113894 m!170167))

(assert (=> b!113894 m!170161))

(assert (=> b!113683 d!36558))

(declare-fun d!36562 () Bool)

(assert (=> d!36562 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5338 thiss!1305) (currentByte!5343 thiss!1305) (size!2349 (buf!2757 thiss!1305))))))

(declare-fun bs!8881 () Bool)

(assert (= bs!8881 d!36562))

(assert (=> bs!8881 m!169873))

(assert (=> start!22462 d!36562))

(push 1)

