; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68916 () Bool)

(assert start!68916)

(declare-fun res!254841 () Bool)

(declare-fun e!223382 () Bool)

(assert (=> start!68916 (=> (not res!254841) (not e!223382))))

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> start!68916 (= res!254841 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68916 e!223382))

(assert (=> start!68916 true))

(declare-datatypes ((array!18951 0))(
  ( (array!18952 (arr!9306 (Array (_ BitVec 32) (_ BitVec 8))) (size!8223 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13556 0))(
  ( (BitStream!13557 (buf!7839 array!18951) (currentByte!14427 (_ BitVec 32)) (currentBit!14422 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13556)

(declare-fun e!223384 () Bool)

(declare-fun inv!12 (BitStream!13556) Bool)

(assert (=> start!68916 (and (inv!12 bitStream!19) e!223384)))

(declare-fun thiss!1522 () BitStream!13556)

(declare-fun e!223380 () Bool)

(assert (=> start!68916 (and (inv!12 thiss!1522) e!223380)))

(declare-fun b!310885 () Bool)

(declare-fun array_inv!7778 (array!18951) Bool)

(assert (=> b!310885 (= e!223384 (array_inv!7778 (buf!7839 bitStream!19)))))

(declare-fun b!310886 () Bool)

(declare-fun e!223385 () Bool)

(assert (=> b!310886 (= e!223385 false)))

(declare-fun b!310887 () Bool)

(assert (=> b!310887 (= e!223382 e!223385)))

(declare-fun c!15159 () Bool)

(assert (=> b!310887 (= c!15159 (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!310888 () Bool)

(assert (=> b!310888 (= e!223380 (array_inv!7778 (buf!7839 thiss!1522)))))

(declare-fun b!310889 () Bool)

(declare-fun res!254842 () Bool)

(assert (=> b!310889 (=> (not res!254842) (not e!223382))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310889 (= res!254842 (validate_offset_bits!1 ((_ sign_extend 32) (size!8223 (buf!7839 bitStream!19))) ((_ sign_extend 32) (currentByte!14427 bitStream!19)) ((_ sign_extend 32) (currentBit!14422 bitStream!19)) nBits!480))))

(declare-fun b!310890 () Bool)

(declare-datatypes ((tuple2!23434 0))(
  ( (tuple2!23435 (_1!13310 Bool) (_2!13310 BitStream!13556)) )
))
(declare-fun lt!440697 () tuple2!23434)

(declare-datatypes ((List!1004 0))(
  ( (Nil!1001) (Cons!1000 (h!1119 Bool) (t!1889 List!1004)) )
))
(declare-fun length!501 (List!1004) Int)

(declare-datatypes ((tuple2!23436 0))(
  ( (tuple2!23437 (_1!13311 List!1004) (_2!13311 BitStream!13556)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13556 BitStream!13556 (_ BitVec 64)) List!1004)

(assert (=> b!310890 (= e!223385 (<= (length!501 (_1!13311 (tuple2!23437 (Cons!1000 (_1!13310 lt!440697) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13310 lt!440697) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13310 lt!440697)))) 0))))

(declare-fun readBit!0 (BitStream!13556) tuple2!23434)

(assert (=> b!310890 (= lt!440697 (readBit!0 bitStream!19))))

(assert (= (and start!68916 res!254841) b!310889))

(assert (= (and b!310889 res!254842) b!310887))

(assert (= (and b!310887 c!15159) b!310886))

(assert (= (and b!310887 (not c!15159)) b!310890))

(assert (= start!68916 b!310885))

(assert (= start!68916 b!310888))

(declare-fun m!448647 () Bool)

(assert (=> b!310888 m!448647))

(declare-fun m!448649 () Bool)

(assert (=> start!68916 m!448649))

(declare-fun m!448651 () Bool)

(assert (=> start!68916 m!448651))

(declare-fun m!448653 () Bool)

(assert (=> b!310889 m!448653))

(declare-fun m!448655 () Bool)

(assert (=> b!310890 m!448655))

(declare-fun m!448657 () Bool)

(assert (=> b!310890 m!448657))

(declare-fun m!448659 () Bool)

(assert (=> b!310890 m!448659))

(declare-fun m!448661 () Bool)

(assert (=> b!310885 m!448661))

(push 1)

(assert (not b!310885))

(assert (not b!310888))

(assert (not b!310890))

(assert (not start!68916))

(assert (not b!310889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102922 () Bool)

(assert (=> d!102922 (= (array_inv!7778 (buf!7839 thiss!1522)) (bvsge (size!8223 (buf!7839 thiss!1522)) #b00000000000000000000000000000000))))

(assert (=> b!310888 d!102922))

(declare-fun d!102928 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!102928 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8223 (buf!7839 bitStream!19))) ((_ sign_extend 32) (currentByte!14427 bitStream!19)) ((_ sign_extend 32) (currentBit!14422 bitStream!19)) nBits!480) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8223 (buf!7839 bitStream!19))) ((_ sign_extend 32) (currentByte!14427 bitStream!19)) ((_ sign_extend 32) (currentBit!14422 bitStream!19))) nBits!480))))

(declare-fun bs!26643 () Bool)

(assert (= bs!26643 d!102928))

(declare-fun m!448667 () Bool)

(assert (=> bs!26643 m!448667))

(assert (=> b!310889 d!102928))

(declare-fun d!102930 () Bool)

(assert (=> d!102930 (= (array_inv!7778 (buf!7839 bitStream!19)) (bvsge (size!8223 (buf!7839 bitStream!19)) #b00000000000000000000000000000000))))

(assert (=> b!310885 d!102930))

(declare-fun d!102932 () Bool)

(declare-fun size!8225 (List!1004) Int)

(assert (=> d!102932 (= (length!501 (_1!13311 (tuple2!23437 (Cons!1000 (_1!13310 lt!440697) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13310 lt!440697) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13310 lt!440697)))) (size!8225 (_1!13311 (tuple2!23437 (Cons!1000 (_1!13310 lt!440697) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13310 lt!440697) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13310 lt!440697)))))))

(declare-fun bs!26644 () Bool)

(assert (= bs!26644 d!102932))

(declare-fun m!448669 () Bool)

(assert (=> bs!26644 m!448669))

(assert (=> b!310890 d!102932))

(declare-fun d!102934 () Bool)

(declare-fun e!223397 () Bool)

(assert (=> d!102934 e!223397))

(declare-fun c!15171 () Bool)

(assert (=> d!102934 (= c!15171 (= (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!440715 () List!1004)

(declare-fun e!223396 () tuple2!23436)

(assert (=> d!102934 (= lt!440715 (_1!13311 e!223396))))

(declare-fun c!15170 () Bool)

(assert (=> d!102934 (= c!15170 (= (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!102934 (bvsge (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!102934 (= (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13310 lt!440697) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!440715)))

(declare-fun b!310914 () Bool)

(assert (=> b!310914 (= e!223397 (> (length!501 lt!440715) 0))))

(declare-fun b!310913 () Bool)

(declare-fun isEmpty!275 (List!1004) Bool)

(assert (=> b!310913 (= e!223397 (isEmpty!275 lt!440715))))

(declare-fun b!310911 () Bool)

(assert (=> b!310911 (= e!223396 (tuple2!23437 Nil!1001 (_2!13310 lt!440697)))))

(declare-fun lt!440714 () (_ BitVec 64))

(declare-fun b!310912 () Bool)

(declare-fun lt!440713 () tuple2!23434)

(assert (=> b!310912 (= e!223396 (tuple2!23437 (Cons!1000 (_1!13310 lt!440713) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13310 lt!440713) (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440714))) (_2!13310 lt!440713)))))

(assert (=> b!310912 (= lt!440713 (readBit!0 (_2!13310 lt!440697)))))

(assert (=> b!310912 (= lt!440714 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!102934 c!15170) b!310911))

(assert (= (and d!102934 (not c!15170)) b!310912))

(assert (= (and d!102934 c!15171) b!310913))

(assert (= (and d!102934 (not c!15171)) b!310914))

(declare-fun m!448681 () Bool)

(assert (=> b!310914 m!448681))

(declare-fun m!448683 () Bool)

(assert (=> b!310913 m!448683))

(declare-fun m!448685 () Bool)

(assert (=> b!310912 m!448685))

(declare-fun m!448687 () Bool)

(assert (=> b!310912 m!448687))

(assert (=> b!310890 d!102934))

(declare-fun d!102940 () Bool)

(declare-fun e!223421 () Bool)

(assert (=> d!102940 e!223421))

(declare-fun res!254848 () Bool)

(assert (=> d!102940 (=> (not res!254848) (not e!223421))))

(declare-datatypes ((Unit!21521 0))(
  ( (Unit!21522) )
))
(declare-datatypes ((tuple2!23440 0))(
  ( (tuple2!23441 (_1!13313 Unit!21521) (_2!13313 BitStream!13556)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13556) tuple2!23440)

(assert (=> d!102940 (= res!254848 (= (buf!7839 (_2!13313 (increaseBitIndex!0 bitStream!19))) (buf!7839 bitStream!19)))))

(declare-fun lt!440766 () Bool)

(assert (=> d!102940 (= lt!440766 (not (= (bvand ((_ sign_extend 24) (select (arr!9306 (buf!7839 bitStream!19)) (currentByte!14427 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14422 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440760 () tuple2!23434)

(assert (=> d!102940 (= lt!440760 (tuple2!23435 (not (= (bvand ((_ sign_extend 24) (select (arr!9306 (buf!7839 bitStream!19)) (currentByte!14427 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14422 bitStream!19)))) #b00000000000000000000000000000000)) (_2!13313 (increaseBitIndex!0 bitStream!19))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!102940 (validate_offset_bit!0 ((_ sign_extend 32) (size!8223 (buf!7839 bitStream!19))) ((_ sign_extend 32) (currentByte!14427 bitStream!19)) ((_ sign_extend 32) (currentBit!14422 bitStream!19)))))

(assert (=> d!102940 (= (readBit!0 bitStream!19) lt!440760)))

(declare-fun lt!440765 () (_ BitVec 64))

(declare-fun lt!440761 () (_ BitVec 64))

(declare-fun b!310932 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!310932 (= e!223421 (= (bitIndex!0 (size!8223 (buf!7839 (_2!13313 (increaseBitIndex!0 bitStream!19)))) (currentByte!14427 (_2!13313 (increaseBitIndex!0 bitStream!19))) (currentBit!14422 (_2!13313 (increaseBitIndex!0 bitStream!19)))) (bvadd lt!440761 lt!440765)))))

(assert (=> b!310932 (or (not (= (bvand lt!440761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440765 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440761 lt!440765) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310932 (= lt!440765 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!310932 (= lt!440761 (bitIndex!0 (size!8223 (buf!7839 bitStream!19)) (currentByte!14427 bitStream!19) (currentBit!14422 bitStream!19)))))

(declare-fun lt!440762 () Bool)

(assert (=> b!310932 (= lt!440762 (not (= (bvand ((_ sign_extend 24) (select (arr!9306 (buf!7839 bitStream!19)) (currentByte!14427 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14422 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440764 () Bool)

(assert (=> b!310932 (= lt!440764 (not (= (bvand ((_ sign_extend 24) (select (arr!9306 (buf!7839 bitStream!19)) (currentByte!14427 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14422 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440763 () Bool)

(assert (=> b!310932 (= lt!440763 (not (= (bvand ((_ sign_extend 24) (select (arr!9306 (buf!7839 bitStream!19)) (currentByte!14427 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14422 bitStream!19)))) #b00000000000000000000000000000000)))))

(assert (= (and d!102940 res!254848) b!310932))

(declare-fun m!448713 () Bool)

(assert (=> d!102940 m!448713))

(declare-fun m!448715 () Bool)

(assert (=> d!102940 m!448715))

(declare-fun m!448717 () Bool)

(assert (=> d!102940 m!448717))

(declare-fun m!448719 () Bool)

(assert (=> d!102940 m!448719))

(assert (=> b!310932 m!448717))

(assert (=> b!310932 m!448715))

(declare-fun m!448721 () Bool)

(assert (=> b!310932 m!448721))

(declare-fun m!448723 () Bool)

(assert (=> b!310932 m!448723))

(assert (=> b!310932 m!448713))

(assert (=> b!310890 d!102940))

(declare-fun d!102948 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!102948 (= (inv!12 bitStream!19) (invariant!0 (currentBit!14422 bitStream!19) (currentByte!14427 bitStream!19) (size!8223 (buf!7839 bitStream!19))))))

(declare-fun bs!26648 () Bool)

(assert (= bs!26648 d!102948))

(declare-fun m!448725 () Bool)

(assert (=> bs!26648 m!448725))

(assert (=> start!68916 d!102948))

(declare-fun d!102950 () Bool)

(assert (=> d!102950 (= (inv!12 thiss!1522) (invariant!0 (currentBit!14422 thiss!1522) (currentByte!14427 thiss!1522) (size!8223 (buf!7839 thiss!1522))))))

(declare-fun bs!26649 () Bool)

(assert (= bs!26649 d!102950))

(declare-fun m!448727 () Bool)

(assert (=> bs!26649 m!448727))

(assert (=> start!68916 d!102950))

(push 1)

(assert (not d!102950))

(assert (not d!102948))

(assert (not d!102928))

(assert (not d!102940))

(assert (not b!310932))

(assert (not b!310913))

(assert (not b!310912))

(assert (not b!310914))

(assert (not d!102932))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102980 () Bool)

(assert (=> d!102980 (= (remainingBits!0 ((_ sign_extend 32) (size!8223 (buf!7839 bitStream!19))) ((_ sign_extend 32) (currentByte!14427 bitStream!19)) ((_ sign_extend 32) (currentBit!14422 bitStream!19))) (bvsub (bvmul ((_ sign_extend 32) (size!8223 (buf!7839 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14427 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14422 bitStream!19)))))))

(assert (=> d!102928 d!102980))

(declare-fun d!102982 () Bool)

(declare-fun e!223436 () Bool)

(assert (=> d!102982 e!223436))

(declare-fun res!254870 () Bool)

(assert (=> d!102982 (=> (not res!254870) (not e!223436))))

(declare-fun lt!440846 () (_ BitVec 64))

(declare-fun lt!440847 () (_ BitVec 64))

(declare-fun lt!440843 () (_ BitVec 64))

(assert (=> d!102982 (= res!254870 (= lt!440846 (bvsub lt!440847 lt!440843)))))

(assert (=> d!102982 (or (= (bvand lt!440847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440843 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440847 lt!440843) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102982 (= lt!440843 (remainingBits!0 ((_ sign_extend 32) (size!8223 (buf!7839 (_2!13313 (increaseBitIndex!0 bitStream!19))))) ((_ sign_extend 32) (currentByte!14427 (_2!13313 (increaseBitIndex!0 bitStream!19)))) ((_ sign_extend 32) (currentBit!14422 (_2!13313 (increaseBitIndex!0 bitStream!19))))))))

(declare-fun lt!440845 () (_ BitVec 64))

(declare-fun lt!440848 () (_ BitVec 64))

(assert (=> d!102982 (= lt!440847 (bvmul lt!440845 lt!440848))))

(assert (=> d!102982 (or (= lt!440845 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440848 (bvsdiv (bvmul lt!440845 lt!440848) lt!440845)))))

(assert (=> d!102982 (= lt!440848 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!102982 (= lt!440845 ((_ sign_extend 32) (size!8223 (buf!7839 (_2!13313 (increaseBitIndex!0 bitStream!19))))))))

(assert (=> d!102982 (= lt!440846 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14427 (_2!13313 (increaseBitIndex!0 bitStream!19)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14422 (_2!13313 (increaseBitIndex!0 bitStream!19))))))))

(assert (=> d!102982 (invariant!0 (currentBit!14422 (_2!13313 (increaseBitIndex!0 bitStream!19))) (currentByte!14427 (_2!13313 (increaseBitIndex!0 bitStream!19))) (size!8223 (buf!7839 (_2!13313 (increaseBitIndex!0 bitStream!19)))))))

(assert (=> d!102982 (= (bitIndex!0 (size!8223 (buf!7839 (_2!13313 (increaseBitIndex!0 bitStream!19)))) (currentByte!14427 (_2!13313 (increaseBitIndex!0 bitStream!19))) (currentBit!14422 (_2!13313 (increaseBitIndex!0 bitStream!19)))) lt!440846)))

(declare-fun b!310957 () Bool)

(declare-fun res!254869 () Bool)

(assert (=> b!310957 (=> (not res!254869) (not e!223436))))

(assert (=> b!310957 (= res!254869 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440846))))

(declare-fun b!310958 () Bool)

(declare-fun lt!440844 () (_ BitVec 64))

(assert (=> b!310958 (= e!223436 (bvsle lt!440846 (bvmul lt!440844 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!310958 (or (= lt!440844 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440844 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440844)))))

(assert (=> b!310958 (= lt!440844 ((_ sign_extend 32) (size!8223 (buf!7839 (_2!13313 (increaseBitIndex!0 bitStream!19))))))))

(assert (= (and d!102982 res!254870) b!310957))

(assert (= (and b!310957 res!254869) b!310958))

(declare-fun m!448777 () Bool)

(assert (=> d!102982 m!448777))

(declare-fun m!448779 () Bool)

(assert (=> d!102982 m!448779))

(assert (=> b!310932 d!102982))

(declare-fun d!102994 () Bool)

(declare-fun e!223453 () Bool)

(assert (=> d!102994 e!223453))

(declare-fun res!254893 () Bool)

(assert (=> d!102994 (=> (not res!254893) (not e!223453))))

(declare-fun lt!440919 () (_ BitVec 64))

(declare-fun lt!440921 () tuple2!23440)

(declare-fun lt!440918 () (_ BitVec 64))

(assert (=> d!102994 (= res!254893 (= (bvadd lt!440919 lt!440918) (bitIndex!0 (size!8223 (buf!7839 (_2!13313 lt!440921))) (currentByte!14427 (_2!13313 lt!440921)) (currentBit!14422 (_2!13313 lt!440921)))))))

(assert (=> d!102994 (or (not (= (bvand lt!440919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440918 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440919 lt!440918) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102994 (= lt!440918 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!102994 (= lt!440919 (bitIndex!0 (size!8223 (buf!7839 bitStream!19)) (currentByte!14427 bitStream!19) (currentBit!14422 bitStream!19)))))

(declare-fun Unit!21527 () Unit!21521)

(declare-fun Unit!21528 () Unit!21521)

(assert (=> d!102994 (= lt!440921 (ite (bvslt (currentBit!14422 bitStream!19) #b00000000000000000000000000000111) (tuple2!23441 Unit!21527 (BitStream!13557 (buf!7839 bitStream!19) (currentByte!14427 bitStream!19) (bvadd (currentBit!14422 bitStream!19) #b00000000000000000000000000000001))) (tuple2!23441 Unit!21528 (BitStream!13557 (buf!7839 bitStream!19) (bvadd (currentByte!14427 bitStream!19) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!102994 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!8223 (buf!7839 bitStream!19))) ((_ sign_extend 32) (currentByte!14427 bitStream!19)) ((_ sign_extend 32) (currentBit!14422 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!102994 (= (increaseBitIndex!0 bitStream!19) lt!440921)))

(declare-fun b!310990 () Bool)

(declare-fun res!254892 () Bool)

(assert (=> b!310990 (=> (not res!254892) (not e!223453))))

(declare-fun lt!440920 () (_ BitVec 64))

(declare-fun lt!440917 () (_ BitVec 64))

(assert (=> b!310990 (= res!254892 (= (bvsub lt!440920 lt!440917) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!310990 (or (= (bvand lt!440920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440917 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440920 lt!440917) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310990 (= lt!440917 (remainingBits!0 ((_ sign_extend 32) (size!8223 (buf!7839 (_2!13313 lt!440921)))) ((_ sign_extend 32) (currentByte!14427 (_2!13313 lt!440921))) ((_ sign_extend 32) (currentBit!14422 (_2!13313 lt!440921)))))))

(assert (=> b!310990 (= lt!440920 (remainingBits!0 ((_ sign_extend 32) (size!8223 (buf!7839 bitStream!19))) ((_ sign_extend 32) (currentByte!14427 bitStream!19)) ((_ sign_extend 32) (currentBit!14422 bitStream!19))))))

(declare-fun b!310991 () Bool)

(assert (=> b!310991 (= e!223453 (= (size!8223 (buf!7839 bitStream!19)) (size!8223 (buf!7839 (_2!13313 lt!440921)))))))

(assert (= (and d!102994 res!254893) b!310990))

(assert (= (and b!310990 res!254892) b!310991))

(declare-fun m!448813 () Bool)

(assert (=> d!102994 m!448813))

(assert (=> d!102994 m!448721))

(assert (=> d!102994 m!448667))

(declare-fun m!448815 () Bool)

(assert (=> b!310990 m!448815))

(assert (=> b!310990 m!448667))

(assert (=> b!310932 d!102994))

(declare-fun d!103012 () Bool)

(declare-fun e!223456 () Bool)

(assert (=> d!103012 e!223456))

(declare-fun res!254895 () Bool)

(assert (=> d!103012 (=> (not res!254895) (not e!223456))))

(declare-fun lt!440927 () (_ BitVec 64))

(declare-fun lt!440928 () (_ BitVec 64))

(declare-fun lt!440924 () (_ BitVec 64))

(assert (=> d!103012 (= res!254895 (= lt!440927 (bvsub lt!440928 lt!440924)))))

(assert (=> d!103012 (or (= (bvand lt!440928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440924 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440928 lt!440924) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103012 (= lt!440924 (remainingBits!0 ((_ sign_extend 32) (size!8223 (buf!7839 bitStream!19))) ((_ sign_extend 32) (currentByte!14427 bitStream!19)) ((_ sign_extend 32) (currentBit!14422 bitStream!19))))))

(declare-fun lt!440926 () (_ BitVec 64))

(declare-fun lt!440929 () (_ BitVec 64))

(assert (=> d!103012 (= lt!440928 (bvmul lt!440926 lt!440929))))

(assert (=> d!103012 (or (= lt!440926 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440929 (bvsdiv (bvmul lt!440926 lt!440929) lt!440926)))))

(assert (=> d!103012 (= lt!440929 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103012 (= lt!440926 ((_ sign_extend 32) (size!8223 (buf!7839 bitStream!19))))))

(assert (=> d!103012 (= lt!440927 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14427 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14422 bitStream!19))))))

(assert (=> d!103012 (invariant!0 (currentBit!14422 bitStream!19) (currentByte!14427 bitStream!19) (size!8223 (buf!7839 bitStream!19)))))

(assert (=> d!103012 (= (bitIndex!0 (size!8223 (buf!7839 bitStream!19)) (currentByte!14427 bitStream!19) (currentBit!14422 bitStream!19)) lt!440927)))

(declare-fun b!310996 () Bool)

(declare-fun res!254894 () Bool)

(assert (=> b!310996 (=> (not res!254894) (not e!223456))))

(assert (=> b!310996 (= res!254894 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440927))))

(declare-fun b!310997 () Bool)

(declare-fun lt!440925 () (_ BitVec 64))

(assert (=> b!310997 (= e!223456 (bvsle lt!440927 (bvmul lt!440925 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!310997 (or (= lt!440925 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440925 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440925)))))

(assert (=> b!310997 (= lt!440925 ((_ sign_extend 32) (size!8223 (buf!7839 bitStream!19))))))

(assert (= (and d!103012 res!254895) b!310996))

(assert (= (and b!310996 res!254894) b!310997))

(assert (=> d!103012 m!448667))

(assert (=> d!103012 m!448725))

(assert (=> b!310932 d!103012))

(declare-fun d!103014 () Bool)

(assert (=> d!103014 (= (invariant!0 (currentBit!14422 bitStream!19) (currentByte!14427 bitStream!19) (size!8223 (buf!7839 bitStream!19))) (and (bvsge (currentBit!14422 bitStream!19) #b00000000000000000000000000000000) (bvslt (currentBit!14422 bitStream!19) #b00000000000000000000000000001000) (bvsge (currentByte!14427 bitStream!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!14427 bitStream!19) (size!8223 (buf!7839 bitStream!19))) (and (= (currentBit!14422 bitStream!19) #b00000000000000000000000000000000) (= (currentByte!14427 bitStream!19) (size!8223 (buf!7839 bitStream!19)))))))))

(assert (=> d!102948 d!103014))

(declare-fun d!103020 () Bool)

(declare-fun e!223459 () Bool)

(assert (=> d!103020 e!223459))

(declare-fun c!15189 () Bool)

(assert (=> d!103020 (= c!15189 (= (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440714) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!440933 () List!1004)

(declare-fun e!223458 () tuple2!23436)

(assert (=> d!103020 (= lt!440933 (_1!13311 e!223458))))

(declare-fun c!15188 () Bool)

(assert (=> d!103020 (= c!15188 (= (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440714) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!103020 (bvsge (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440714) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!103020 (= (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13310 lt!440713) (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440714)) lt!440933)))

(declare-fun b!311003 () Bool)

(assert (=> b!311003 (= e!223459 (> (length!501 lt!440933) 0))))

(declare-fun b!311002 () Bool)

(assert (=> b!311002 (= e!223459 (isEmpty!275 lt!440933))))

(declare-fun b!311000 () Bool)

(assert (=> b!311000 (= e!223458 (tuple2!23437 Nil!1001 (_2!13310 lt!440713)))))

(declare-fun b!311001 () Bool)

(declare-fun lt!440931 () tuple2!23434)

(declare-fun lt!440932 () (_ BitVec 64))

(assert (=> b!311001 (= e!223458 (tuple2!23437 (Cons!1000 (_1!13310 lt!440931) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13310 lt!440931) (bvsub (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440714) lt!440932))) (_2!13310 lt!440931)))))

(assert (=> b!311001 (= lt!440931 (readBit!0 (_2!13310 lt!440713)))))

(assert (=> b!311001 (= lt!440932 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!103020 c!15188) b!311000))

(assert (= (and d!103020 (not c!15188)) b!311001))

(assert (= (and d!103020 c!15189) b!311002))

(assert (= (and d!103020 (not c!15189)) b!311003))

(declare-fun m!448819 () Bool)

(assert (=> b!311003 m!448819))

(declare-fun m!448821 () Bool)

(assert (=> b!311002 m!448821))

(declare-fun m!448823 () Bool)

(assert (=> b!311001 m!448823))

(declare-fun m!448825 () Bool)

(assert (=> b!311001 m!448825))

(assert (=> b!310912 d!103020))

(declare-fun d!103022 () Bool)

(declare-fun e!223460 () Bool)

(assert (=> d!103022 e!223460))

(declare-fun res!254896 () Bool)

(assert (=> d!103022 (=> (not res!254896) (not e!223460))))

(assert (=> d!103022 (= res!254896 (= (buf!7839 (_2!13313 (increaseBitIndex!0 (_2!13310 lt!440697)))) (buf!7839 (_2!13310 lt!440697))))))

(declare-fun lt!440940 () Bool)

(assert (=> d!103022 (= lt!440940 (not (= (bvand ((_ sign_extend 24) (select (arr!9306 (buf!7839 (_2!13310 lt!440697))) (currentByte!14427 (_2!13310 lt!440697)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14422 (_2!13310 lt!440697))))) #b00000000000000000000000000000000)))))

(declare-fun lt!440934 () tuple2!23434)

(assert (=> d!103022 (= lt!440934 (tuple2!23435 (not (= (bvand ((_ sign_extend 24) (select (arr!9306 (buf!7839 (_2!13310 lt!440697))) (currentByte!14427 (_2!13310 lt!440697)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14422 (_2!13310 lt!440697))))) #b00000000000000000000000000000000)) (_2!13313 (increaseBitIndex!0 (_2!13310 lt!440697)))))))

(assert (=> d!103022 (validate_offset_bit!0 ((_ sign_extend 32) (size!8223 (buf!7839 (_2!13310 lt!440697)))) ((_ sign_extend 32) (currentByte!14427 (_2!13310 lt!440697))) ((_ sign_extend 32) (currentBit!14422 (_2!13310 lt!440697))))))

(assert (=> d!103022 (= (readBit!0 (_2!13310 lt!440697)) lt!440934)))

(declare-fun lt!440935 () (_ BitVec 64))

(declare-fun b!311004 () Bool)

(declare-fun lt!440939 () (_ BitVec 64))

(assert (=> b!311004 (= e!223460 (= (bitIndex!0 (size!8223 (buf!7839 (_2!13313 (increaseBitIndex!0 (_2!13310 lt!440697))))) (currentByte!14427 (_2!13313 (increaseBitIndex!0 (_2!13310 lt!440697)))) (currentBit!14422 (_2!13313 (increaseBitIndex!0 (_2!13310 lt!440697))))) (bvadd lt!440935 lt!440939)))))

(assert (=> b!311004 (or (not (= (bvand lt!440935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440939 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440935 lt!440939) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!311004 (= lt!440939 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!311004 (= lt!440935 (bitIndex!0 (size!8223 (buf!7839 (_2!13310 lt!440697))) (currentByte!14427 (_2!13310 lt!440697)) (currentBit!14422 (_2!13310 lt!440697))))))

(declare-fun lt!440936 () Bool)

(assert (=> b!311004 (= lt!440936 (not (= (bvand ((_ sign_extend 24) (select (arr!9306 (buf!7839 (_2!13310 lt!440697))) (currentByte!14427 (_2!13310 lt!440697)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14422 (_2!13310 lt!440697))))) #b00000000000000000000000000000000)))))

(declare-fun lt!440938 () Bool)

(assert (=> b!311004 (= lt!440938 (not (= (bvand ((_ sign_extend 24) (select (arr!9306 (buf!7839 (_2!13310 lt!440697))) (currentByte!14427 (_2!13310 lt!440697)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14422 (_2!13310 lt!440697))))) #b00000000000000000000000000000000)))))

(declare-fun lt!440937 () Bool)

(assert (=> b!311004 (= lt!440937 (not (= (bvand ((_ sign_extend 24) (select (arr!9306 (buf!7839 (_2!13310 lt!440697))) (currentByte!14427 (_2!13310 lt!440697)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14422 (_2!13310 lt!440697))))) #b00000000000000000000000000000000)))))

(assert (= (and d!103022 res!254896) b!311004))

(declare-fun m!448827 () Bool)

(assert (=> d!103022 m!448827))

(declare-fun m!448829 () Bool)

(assert (=> d!103022 m!448829))

(declare-fun m!448831 () Bool)

(assert (=> d!103022 m!448831))

(declare-fun m!448833 () Bool)

(assert (=> d!103022 m!448833))

(assert (=> b!311004 m!448831))

(assert (=> b!311004 m!448829))

(declare-fun m!448835 () Bool)

(assert (=> b!311004 m!448835))

(declare-fun m!448837 () Bool)

(assert (=> b!311004 m!448837))

(assert (=> b!311004 m!448827))

(assert (=> b!310912 d!103022))

(declare-fun d!103024 () Bool)

(assert (=> d!103024 (= (isEmpty!275 lt!440715) (is-Nil!1001 lt!440715))))

(assert (=> b!310913 d!103024))

(assert (=> d!102940 d!102994))

(declare-fun d!103026 () Bool)

(assert (=> d!103026 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8223 (buf!7839 bitStream!19))) ((_ sign_extend 32) (currentByte!14427 bitStream!19)) ((_ sign_extend 32) (currentBit!14422 bitStream!19))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8223 (buf!7839 bitStream!19))) ((_ sign_extend 32) (currentByte!14427 bitStream!19)) ((_ sign_extend 32) (currentBit!14422 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!26657 () Bool)

(assert (= bs!26657 d!103026))

(assert (=> bs!26657 m!448667))

(assert (=> d!102940 d!103026))

(declare-fun d!103028 () Bool)

(declare-fun lt!440943 () Int)

(assert (=> d!103028 (>= lt!440943 0)))

(declare-fun e!223463 () Int)

(assert (=> d!103028 (= lt!440943 e!223463)))

(declare-fun c!15192 () Bool)

(assert (=> d!103028 (= c!15192 (is-Nil!1001 (_1!13311 (tuple2!23437 (Cons!1000 (_1!13310 lt!440697) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13310 lt!440697) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13310 lt!440697)))))))

(assert (=> d!103028 (= (size!8225 (_1!13311 (tuple2!23437 (Cons!1000 (_1!13310 lt!440697) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13310 lt!440697) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13310 lt!440697)))) lt!440943)))

(declare-fun b!311009 () Bool)

(assert (=> b!311009 (= e!223463 0)))

(declare-fun b!311010 () Bool)

(assert (=> b!311010 (= e!223463 (+ 1 (size!8225 (t!1889 (_1!13311 (tuple2!23437 (Cons!1000 (_1!13310 lt!440697) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13310 lt!440697) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13310 lt!440697)))))))))

(assert (= (and d!103028 c!15192) b!311009))

(assert (= (and d!103028 (not c!15192)) b!311010))

(declare-fun m!448839 () Bool)

(assert (=> b!311010 m!448839))

(assert (=> d!102932 d!103028))

(declare-fun d!103030 () Bool)

(assert (=> d!103030 (= (length!501 lt!440715) (size!8225 lt!440715))))

(declare-fun bs!26658 () Bool)

(assert (= bs!26658 d!103030))

(declare-fun m!448841 () Bool)

(assert (=> bs!26658 m!448841))

(assert (=> b!310914 d!103030))

(declare-fun d!103032 () Bool)

(assert (=> d!103032 (= (invariant!0 (currentBit!14422 thiss!1522) (currentByte!14427 thiss!1522) (size!8223 (buf!7839 thiss!1522))) (and (bvsge (currentBit!14422 thiss!1522) #b00000000000000000000000000000000) (bvslt (currentBit!14422 thiss!1522) #b00000000000000000000000000001000) (bvsge (currentByte!14427 thiss!1522) #b00000000000000000000000000000000) (or (bvslt (currentByte!14427 thiss!1522) (size!8223 (buf!7839 thiss!1522))) (and (= (currentBit!14422 thiss!1522) #b00000000000000000000000000000000) (= (currentByte!14427 thiss!1522) (size!8223 (buf!7839 thiss!1522)))))))))

(assert (=> d!102950 d!103032))

(push 1)

(assert (not b!311003))

(assert (not b!311004))

(assert (not d!103030))

(assert (not b!310990))

(assert (not d!103026))

(assert (not d!102994))

(assert (not d!103012))

(assert (not b!311002))

(assert (not b!311001))

(assert (not d!102982))

(assert (not b!311010))

(assert (not d!103022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

