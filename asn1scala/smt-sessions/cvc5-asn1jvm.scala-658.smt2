; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18484 () Bool)

(assert start!18484)

(declare-fun b!91741 () Bool)

(declare-fun e!60316 () Bool)

(declare-datatypes ((array!4290 0))(
  ( (array!4291 (arr!2568 (Array (_ BitVec 32) (_ BitVec 8))) (size!1934 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3424 0))(
  ( (BitStream!3425 (buf!2321 array!4290) (currentByte!4623 (_ BitVec 32)) (currentBit!4618 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3424)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91741 (= e!60316 (not (invariant!0 (currentBit!4618 bitStream1!8) (currentByte!4623 bitStream1!8) (size!1934 (buf!2321 bitStream1!8)))))))

(declare-fun b!91742 () Bool)

(declare-fun res!75750 () Bool)

(assert (=> b!91742 (=> (not res!75750) (not e!60316))))

(declare-datatypes ((List!818 0))(
  ( (Nil!815) (Cons!814 (h!933 Bool) (t!1568 List!818)) )
))
(declare-fun listBits!13 () List!818)

(declare-fun length!409 (List!818) Int)

(assert (=> b!91742 (= res!75750 (> (length!409 listBits!13) 0))))

(declare-fun b!91743 () Bool)

(declare-fun e!60315 () Bool)

(declare-fun array_inv!1777 (array!4290) Bool)

(assert (=> b!91743 (= e!60315 (array_inv!1777 (buf!2321 bitStream1!8)))))

(declare-fun b!91744 () Bool)

(declare-fun e!60314 () Bool)

(declare-fun bitStream2!8 () BitStream!3424)

(assert (=> b!91744 (= e!60314 (array_inv!1777 (buf!2321 bitStream2!8)))))

(declare-fun b!91745 () Bool)

(declare-fun res!75745 () Bool)

(assert (=> b!91745 (=> (not res!75745) (not e!60316))))

(declare-fun base!8 () BitStream!3424)

(declare-fun isPrefixOf!0 (BitStream!3424 BitStream!3424) Bool)

(assert (=> b!91745 (= res!75745 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!91746 () Bool)

(declare-fun res!75747 () Bool)

(assert (=> b!91746 (=> (not res!75747) (not e!60316))))

(assert (=> b!91746 (= res!75747 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun res!75748 () Bool)

(assert (=> start!18484 (=> (not res!75748) (not e!60316))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18484 (= res!75748 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18484 e!60316))

(assert (=> start!18484 true))

(declare-fun inv!12 (BitStream!3424) Bool)

(assert (=> start!18484 (and (inv!12 bitStream1!8) e!60315)))

(assert (=> start!18484 (and (inv!12 bitStream2!8) e!60314)))

(declare-fun e!60313 () Bool)

(assert (=> start!18484 (and (inv!12 base!8) e!60313)))

(declare-fun b!91747 () Bool)

(declare-fun res!75746 () Bool)

(assert (=> b!91747 (=> (not res!75746) (not e!60316))))

(assert (=> b!91747 (= res!75746 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!91748 () Bool)

(declare-fun res!75751 () Bool)

(assert (=> b!91748 (=> (not res!75751) (not e!60316))))

(assert (=> b!91748 (= res!75751 (and (= (buf!2321 bitStream1!8) (buf!2321 bitStream2!8)) (= (buf!2321 bitStream1!8) (buf!2321 base!8))))))

(declare-fun b!91749 () Bool)

(declare-fun res!75749 () Bool)

(assert (=> b!91749 (=> (not res!75749) (not e!60316))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91749 (= res!75749 (bvslt (bitIndex!0 (size!1934 (buf!2321 base!8)) (currentByte!4623 base!8) (currentBit!4618 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!91750 () Bool)

(assert (=> b!91750 (= e!60313 (array_inv!1777 (buf!2321 base!8)))))

(assert (= (and start!18484 res!75748) b!91742))

(assert (= (and b!91742 res!75750) b!91747))

(assert (= (and b!91747 res!75746) b!91745))

(assert (= (and b!91745 res!75745) b!91746))

(assert (= (and b!91746 res!75747) b!91748))

(assert (= (and b!91748 res!75751) b!91749))

(assert (= (and b!91749 res!75749) b!91741))

(assert (= start!18484 b!91743))

(assert (= start!18484 b!91744))

(assert (= start!18484 b!91750))

(declare-fun m!135845 () Bool)

(assert (=> b!91745 m!135845))

(declare-fun m!135847 () Bool)

(assert (=> b!91746 m!135847))

(declare-fun m!135849 () Bool)

(assert (=> b!91744 m!135849))

(declare-fun m!135851 () Bool)

(assert (=> b!91742 m!135851))

(declare-fun m!135853 () Bool)

(assert (=> start!18484 m!135853))

(declare-fun m!135855 () Bool)

(assert (=> start!18484 m!135855))

(declare-fun m!135857 () Bool)

(assert (=> start!18484 m!135857))

(declare-fun m!135859 () Bool)

(assert (=> b!91747 m!135859))

(declare-fun m!135861 () Bool)

(assert (=> b!91741 m!135861))

(declare-fun m!135863 () Bool)

(assert (=> b!91743 m!135863))

(declare-fun m!135865 () Bool)

(assert (=> b!91750 m!135865))

(declare-fun m!135867 () Bool)

(assert (=> b!91749 m!135867))

(push 1)

(assert (not b!91749))

(assert (not b!91743))

(assert (not b!91742))

(assert (not b!91746))

(assert (not b!91745))

(assert (not b!91741))

(assert (not b!91744))

(assert (not b!91750))

(assert (not start!18484))

(assert (not b!91747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28552 () Bool)

(declare-fun res!75808 () Bool)

(declare-fun e!60369 () Bool)

(assert (=> d!28552 (=> (not res!75808) (not e!60369))))

(assert (=> d!28552 (= res!75808 (= (size!1934 (buf!2321 bitStream1!8)) (size!1934 (buf!2321 base!8))))))

(assert (=> d!28552 (= (isPrefixOf!0 bitStream1!8 base!8) e!60369)))

(declare-fun b!91823 () Bool)

(declare-fun res!75807 () Bool)

(assert (=> b!91823 (=> (not res!75807) (not e!60369))))

(assert (=> b!91823 (= res!75807 (bvsle (bitIndex!0 (size!1934 (buf!2321 bitStream1!8)) (currentByte!4623 bitStream1!8) (currentBit!4618 bitStream1!8)) (bitIndex!0 (size!1934 (buf!2321 base!8)) (currentByte!4623 base!8) (currentBit!4618 base!8))))))

(declare-fun b!91824 () Bool)

(declare-fun e!60370 () Bool)

(assert (=> b!91824 (= e!60369 e!60370)))

(declare-fun res!75806 () Bool)

(assert (=> b!91824 (=> res!75806 e!60370)))

(assert (=> b!91824 (= res!75806 (= (size!1934 (buf!2321 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91825 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4290 array!4290 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91825 (= e!60370 (arrayBitRangesEq!0 (buf!2321 bitStream1!8) (buf!2321 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1934 (buf!2321 bitStream1!8)) (currentByte!4623 bitStream1!8) (currentBit!4618 bitStream1!8))))))

(assert (= (and d!28552 res!75808) b!91823))

(assert (= (and b!91823 res!75807) b!91824))

(assert (= (and b!91824 (not res!75806)) b!91825))

(declare-fun m!135917 () Bool)

(assert (=> b!91823 m!135917))

(assert (=> b!91823 m!135867))

(assert (=> b!91825 m!135917))

(assert (=> b!91825 m!135917))

(declare-fun m!135919 () Bool)

(assert (=> b!91825 m!135919))

(assert (=> b!91747 d!28552))

(declare-fun d!28558 () Bool)

(declare-fun size!1937 (List!818) Int)

(assert (=> d!28558 (= (length!409 listBits!13) (size!1937 listBits!13))))

(declare-fun bs!7046 () Bool)

(assert (= bs!7046 d!28558))

(declare-fun m!135921 () Bool)

(assert (=> bs!7046 m!135921))

(assert (=> b!91742 d!28558))

(declare-fun d!28560 () Bool)

(assert (=> d!28560 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4618 bitStream1!8) (currentByte!4623 bitStream1!8) (size!1934 (buf!2321 bitStream1!8))))))

(declare-fun bs!7047 () Bool)

(assert (= bs!7047 d!28560))

(assert (=> bs!7047 m!135861))

(assert (=> start!18484 d!28560))

(declare-fun d!28562 () Bool)

(assert (=> d!28562 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4618 bitStream2!8) (currentByte!4623 bitStream2!8) (size!1934 (buf!2321 bitStream2!8))))))

(declare-fun bs!7048 () Bool)

(assert (= bs!7048 d!28562))

(declare-fun m!135923 () Bool)

(assert (=> bs!7048 m!135923))

(assert (=> start!18484 d!28562))

(declare-fun d!28564 () Bool)

(assert (=> d!28564 (= (inv!12 base!8) (invariant!0 (currentBit!4618 base!8) (currentByte!4623 base!8) (size!1934 (buf!2321 base!8))))))

(declare-fun bs!7049 () Bool)

(assert (= bs!7049 d!28564))

(declare-fun m!135925 () Bool)

(assert (=> bs!7049 m!135925))

(assert (=> start!18484 d!28564))

(declare-fun d!28566 () Bool)

(assert (=> d!28566 (= (array_inv!1777 (buf!2321 bitStream1!8)) (bvsge (size!1934 (buf!2321 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!91743 d!28566))

(declare-fun d!28570 () Bool)

(declare-fun e!60391 () Bool)

(assert (=> d!28570 e!60391))

(declare-fun res!75842 () Bool)

(assert (=> d!28570 (=> (not res!75842) (not e!60391))))

(declare-fun lt!137950 () (_ BitVec 64))

(declare-fun lt!137948 () (_ BitVec 64))

(declare-fun lt!137947 () (_ BitVec 64))

(assert (=> d!28570 (= res!75842 (= lt!137950 (bvsub lt!137948 lt!137947)))))

(assert (=> d!28570 (or (= (bvand lt!137948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137947 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137948 lt!137947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28570 (= lt!137947 (remainingBits!0 ((_ sign_extend 32) (size!1934 (buf!2321 base!8))) ((_ sign_extend 32) (currentByte!4623 base!8)) ((_ sign_extend 32) (currentBit!4618 base!8))))))

(declare-fun lt!137951 () (_ BitVec 64))

(declare-fun lt!137949 () (_ BitVec 64))

(assert (=> d!28570 (= lt!137948 (bvmul lt!137951 lt!137949))))

(assert (=> d!28570 (or (= lt!137951 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137949 (bvsdiv (bvmul lt!137951 lt!137949) lt!137951)))))

(assert (=> d!28570 (= lt!137949 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28570 (= lt!137951 ((_ sign_extend 32) (size!1934 (buf!2321 base!8))))))

(assert (=> d!28570 (= lt!137950 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4623 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4618 base!8))))))

(assert (=> d!28570 (invariant!0 (currentBit!4618 base!8) (currentByte!4623 base!8) (size!1934 (buf!2321 base!8)))))

(assert (=> d!28570 (= (bitIndex!0 (size!1934 (buf!2321 base!8)) (currentByte!4623 base!8) (currentBit!4618 base!8)) lt!137950)))

(declare-fun b!91858 () Bool)

(declare-fun res!75841 () Bool)

(assert (=> b!91858 (=> (not res!75841) (not e!60391))))

(assert (=> b!91858 (= res!75841 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137950))))

(declare-fun b!91859 () Bool)

(declare-fun lt!137952 () (_ BitVec 64))

(assert (=> b!91859 (= e!60391 (bvsle lt!137950 (bvmul lt!137952 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91859 (or (= lt!137952 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137952 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137952)))))

(assert (=> b!91859 (= lt!137952 ((_ sign_extend 32) (size!1934 (buf!2321 base!8))))))

(assert (= (and d!28570 res!75842) b!91858))

(assert (= (and b!91858 res!75841) b!91859))

(declare-fun m!135953 () Bool)

(assert (=> d!28570 m!135953))

(assert (=> d!28570 m!135925))

(assert (=> b!91749 d!28570))

(declare-fun d!28598 () Bool)

(assert (=> d!28598 (= (array_inv!1777 (buf!2321 bitStream2!8)) (bvsge (size!1934 (buf!2321 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!91744 d!28598))

(declare-fun d!28600 () Bool)

(declare-fun res!75845 () Bool)

(declare-fun e!60392 () Bool)

(assert (=> d!28600 (=> (not res!75845) (not e!60392))))

(assert (=> d!28600 (= res!75845 (= (size!1934 (buf!2321 bitStream2!8)) (size!1934 (buf!2321 base!8))))))

(assert (=> d!28600 (= (isPrefixOf!0 bitStream2!8 base!8) e!60392)))

(declare-fun b!91860 () Bool)

(declare-fun res!75844 () Bool)

(assert (=> b!91860 (=> (not res!75844) (not e!60392))))

(assert (=> b!91860 (= res!75844 (bvsle (bitIndex!0 (size!1934 (buf!2321 bitStream2!8)) (currentByte!4623 bitStream2!8) (currentBit!4618 bitStream2!8)) (bitIndex!0 (size!1934 (buf!2321 base!8)) (currentByte!4623 base!8) (currentBit!4618 base!8))))))

(declare-fun b!91861 () Bool)

(declare-fun e!60393 () Bool)

(assert (=> b!91861 (= e!60392 e!60393)))

(declare-fun res!75843 () Bool)

(assert (=> b!91861 (=> res!75843 e!60393)))

(assert (=> b!91861 (= res!75843 (= (size!1934 (buf!2321 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!91862 () Bool)

(assert (=> b!91862 (= e!60393 (arrayBitRangesEq!0 (buf!2321 bitStream2!8) (buf!2321 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1934 (buf!2321 bitStream2!8)) (currentByte!4623 bitStream2!8) (currentBit!4618 bitStream2!8))))))

(assert (= (and d!28600 res!75845) b!91860))

(assert (= (and b!91860 res!75844) b!91861))

(assert (= (and b!91861 (not res!75843)) b!91862))

(declare-fun m!135955 () Bool)

(assert (=> b!91860 m!135955))

(assert (=> b!91860 m!135867))

(assert (=> b!91862 m!135955))

(assert (=> b!91862 m!135955))

(declare-fun m!135957 () Bool)

(assert (=> b!91862 m!135957))

(assert (=> b!91745 d!28600))

(declare-fun d!28602 () Bool)

(assert (=> d!28602 (= (array_inv!1777 (buf!2321 base!8)) (bvsge (size!1934 (buf!2321 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!91750 d!28602))

(declare-fun d!28604 () Bool)

(assert (=> d!28604 (= (invariant!0 (currentBit!4618 bitStream1!8) (currentByte!4623 bitStream1!8) (size!1934 (buf!2321 bitStream1!8))) (and (bvsge (currentBit!4618 bitStream1!8) #b00000000000000000000000000000000) (bvslt (currentBit!4618 bitStream1!8) #b00000000000000000000000000001000) (bvsge (currentByte!4623 bitStream1!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4623 bitStream1!8) (size!1934 (buf!2321 bitStream1!8))) (and (= (currentBit!4618 bitStream1!8) #b00000000000000000000000000000000) (= (currentByte!4623 bitStream1!8) (size!1934 (buf!2321 bitStream1!8)))))))))

(assert (=> b!91741 d!28604))

(declare-fun d!28610 () Bool)

(declare-fun res!75854 () Bool)

(declare-fun e!60397 () Bool)

(assert (=> d!28610 (=> (not res!75854) (not e!60397))))

(assert (=> d!28610 (= res!75854 (= (size!1934 (buf!2321 bitStream1!8)) (size!1934 (buf!2321 bitStream2!8))))))

(assert (=> d!28610 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60397)))

(declare-fun b!91869 () Bool)

(declare-fun res!75853 () Bool)

(assert (=> b!91869 (=> (not res!75853) (not e!60397))))

(assert (=> b!91869 (= res!75853 (bvsle (bitIndex!0 (size!1934 (buf!2321 bitStream1!8)) (currentByte!4623 bitStream1!8) (currentBit!4618 bitStream1!8)) (bitIndex!0 (size!1934 (buf!2321 bitStream2!8)) (currentByte!4623 bitStream2!8) (currentBit!4618 bitStream2!8))))))

(declare-fun b!91870 () Bool)

(declare-fun e!60398 () Bool)

(assert (=> b!91870 (= e!60397 e!60398)))

(declare-fun res!75852 () Bool)

(assert (=> b!91870 (=> res!75852 e!60398)))

(assert (=> b!91870 (= res!75852 (= (size!1934 (buf!2321 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91871 () Bool)

(assert (=> b!91871 (= e!60398 (arrayBitRangesEq!0 (buf!2321 bitStream1!8) (buf!2321 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1934 (buf!2321 bitStream1!8)) (currentByte!4623 bitStream1!8) (currentBit!4618 bitStream1!8))))))

(assert (= (and d!28610 res!75854) b!91869))

(assert (= (and b!91869 res!75853) b!91870))

(assert (= (and b!91870 (not res!75852)) b!91871))

(assert (=> b!91869 m!135917))

(assert (=> b!91869 m!135955))

(assert (=> b!91871 m!135917))

(assert (=> b!91871 m!135917))

(declare-fun m!135963 () Bool)

(assert (=> b!91871 m!135963))

(assert (=> b!91746 d!28610))

(push 1)

(assert (not d!28562))

(assert (not d!28560))

(assert (not b!91871))

(assert (not d!28570))

(assert (not b!91825))

(assert (not b!91862))

(assert (not d!28564))

(assert (not b!91869))

(assert (not b!91860))

(assert (not d!28558))

(assert (not b!91823))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

