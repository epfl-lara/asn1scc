; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18178 () Bool)

(assert start!18178)

(declare-fun b!89756 () Bool)

(declare-fun res!73953 () Bool)

(declare-fun e!59243 () Bool)

(assert (=> b!89756 (=> (not res!73953) (not e!59243))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!89756 (= res!73953 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!89757 () Bool)

(declare-fun res!73951 () Bool)

(declare-fun e!59238 () Bool)

(assert (=> b!89757 (=> (not res!73951) (not e!59238))))

(declare-datatypes ((array!4227 0))(
  ( (array!4228 (arr!2544 (Array (_ BitVec 32) (_ BitVec 8))) (size!1907 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3376 0))(
  ( (BitStream!3377 (buf!2297 array!4227) (currentByte!4560 (_ BitVec 32)) (currentBit!4555 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3376)

(declare-datatypes ((Unit!5800 0))(
  ( (Unit!5801) )
))
(declare-datatypes ((tuple2!7510 0))(
  ( (tuple2!7511 (_1!3991 Unit!5800) (_2!3991 BitStream!3376)) )
))
(declare-fun lt!136769 () tuple2!7510)

(declare-fun isPrefixOf!0 (BitStream!3376 BitStream!3376) Bool)

(assert (=> b!89757 (= res!73951 (isPrefixOf!0 thiss!1152 (_2!3991 lt!136769)))))

(declare-fun b!89758 () Bool)

(declare-fun res!73954 () Bool)

(assert (=> b!89758 (=> (not res!73954) (not e!59243))))

(declare-fun thiss!1151 () BitStream!3376)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!89758 (= res!73954 (invariant!0 (currentBit!4555 thiss!1151) (currentByte!4560 thiss!1151) (size!1907 (buf!2297 thiss!1151))))))

(declare-fun b!89759 () Bool)

(declare-fun e!59241 () Bool)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-datatypes ((tuple3!424 0))(
  ( (tuple3!425 (_1!3992 Unit!5800) (_2!3992 BitStream!3376) (_3!236 (_ BitVec 32))) )
))
(declare-fun lt!136773 () tuple3!424)

(assert (=> b!89759 (= e!59241 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!236 lt!136773) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!236 lt!136773)) #b10000000000000000000000000000000))))))

(declare-fun b!89760 () Bool)

(declare-fun e!59234 () Bool)

(declare-fun e!59242 () Bool)

(assert (=> b!89760 (= e!59234 (not e!59242))))

(declare-fun res!73960 () Bool)

(assert (=> b!89760 (=> res!73960 e!59242)))

(assert (=> b!89760 (= res!73960 (not (invariant!0 (currentBit!4555 (_2!3991 lt!136769)) (currentByte!4560 (_2!3991 lt!136769)) (size!1907 (buf!2297 (_2!3991 lt!136769))))))))

(declare-fun e!59236 () Bool)

(assert (=> b!89760 e!59236))

(declare-fun res!73955 () Bool)

(assert (=> b!89760 (=> (not res!73955) (not e!59236))))

(assert (=> b!89760 (= res!73955 (= (size!1907 (buf!2297 thiss!1152)) (size!1907 (buf!2297 (_2!3991 lt!136769)))))))

(declare-fun lt!136767 () Bool)

(declare-fun appendBit!0 (BitStream!3376 Bool) tuple2!7510)

(assert (=> b!89760 (= lt!136769 (appendBit!0 thiss!1152 lt!136767))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!89760 (= lt!136767 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89761 () Bool)

(declare-fun e!59240 () Bool)

(declare-fun array_inv!1753 (array!4227) Bool)

(assert (=> b!89761 (= e!59240 (array_inv!1753 (buf!2297 thiss!1152)))))

(declare-fun b!89762 () Bool)

(assert (=> b!89762 (= e!59236 e!59238)))

(declare-fun res!73967 () Bool)

(assert (=> b!89762 (=> (not res!73967) (not e!59238))))

(declare-fun lt!136772 () (_ BitVec 64))

(declare-fun lt!136768 () (_ BitVec 64))

(assert (=> b!89762 (= res!73967 (= lt!136772 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136768)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!89762 (= lt!136772 (bitIndex!0 (size!1907 (buf!2297 (_2!3991 lt!136769))) (currentByte!4560 (_2!3991 lt!136769)) (currentBit!4555 (_2!3991 lt!136769))))))

(declare-fun b!89763 () Bool)

(declare-fun res!73959 () Bool)

(assert (=> b!89763 (=> (not res!73959) (not e!59243))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89763 (= res!73959 (validate_offset_bits!1 ((_ sign_extend 32) (size!1907 (buf!2297 thiss!1151))) ((_ sign_extend 32) (currentByte!4560 thiss!1151)) ((_ sign_extend 32) (currentBit!4555 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!89764 () Bool)

(declare-fun res!73956 () Bool)

(assert (=> b!89764 (=> (not res!73956) (not e!59234))))

(assert (=> b!89764 (= res!73956 (validate_offset_bits!1 ((_ sign_extend 32) (size!1907 (buf!2297 thiss!1152))) ((_ sign_extend 32) (currentByte!4560 thiss!1152)) ((_ sign_extend 32) (currentBit!4555 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!89765 () Bool)

(declare-fun res!73961 () Bool)

(assert (=> b!89765 (=> (not res!73961) (not e!59234))))

(assert (=> b!89765 (= res!73961 (bvslt i!576 nBits!336))))

(declare-fun b!89766 () Bool)

(declare-fun e!59244 () Bool)

(declare-datatypes ((tuple2!7512 0))(
  ( (tuple2!7513 (_1!3993 BitStream!3376) (_2!3993 Bool)) )
))
(declare-fun lt!136770 () tuple2!7512)

(assert (=> b!89766 (= e!59244 (= (bitIndex!0 (size!1907 (buf!2297 (_1!3993 lt!136770))) (currentByte!4560 (_1!3993 lt!136770)) (currentBit!4555 (_1!3993 lt!136770))) lt!136772))))

(declare-fun res!73962 () Bool)

(assert (=> start!18178 (=> (not res!73962) (not e!59243))))

(assert (=> start!18178 (= res!73962 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18178 e!59243))

(declare-fun inv!12 (BitStream!3376) Bool)

(assert (=> start!18178 (and (inv!12 thiss!1152) e!59240)))

(declare-fun e!59237 () Bool)

(assert (=> start!18178 (and (inv!12 thiss!1151) e!59237)))

(assert (=> start!18178 true))

(declare-fun b!89767 () Bool)

(assert (=> b!89767 (= e!59238 e!59244)))

(declare-fun res!73964 () Bool)

(assert (=> b!89767 (=> (not res!73964) (not e!59244))))

(assert (=> b!89767 (= res!73964 (and (= (_2!3993 lt!136770) lt!136767) (= (_1!3993 lt!136770) (_2!3991 lt!136769))))))

(declare-fun readBitPure!0 (BitStream!3376) tuple2!7512)

(declare-fun readerFrom!0 (BitStream!3376 (_ BitVec 32) (_ BitVec 32)) BitStream!3376)

(assert (=> b!89767 (= lt!136770 (readBitPure!0 (readerFrom!0 (_2!3991 lt!136769) (currentBit!4555 thiss!1152) (currentByte!4560 thiss!1152))))))

(declare-fun b!89768 () Bool)

(declare-fun res!73966 () Bool)

(assert (=> b!89768 (=> res!73966 e!59242)))

(assert (=> b!89768 (= res!73966 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!89769 () Bool)

(declare-fun res!73965 () Bool)

(assert (=> b!89769 (=> res!73965 e!59241)))

(assert (=> b!89769 (= res!73965 (not (invariant!0 (currentBit!4555 (_2!3992 lt!136773)) (currentByte!4560 (_2!3992 lt!136773)) (size!1907 (buf!2297 (_2!3992 lt!136773))))))))

(declare-fun b!89770 () Bool)

(assert (=> b!89770 (= e!59237 (array_inv!1753 (buf!2297 thiss!1151)))))

(declare-fun b!89771 () Bool)

(assert (=> b!89771 (= e!59243 e!59234)))

(declare-fun res!73968 () Bool)

(assert (=> b!89771 (=> (not res!73968) (not e!59234))))

(declare-fun lt!136771 () (_ BitVec 64))

(assert (=> b!89771 (= res!73968 (= lt!136768 (bvadd lt!136771 ((_ sign_extend 32) i!576))))))

(assert (=> b!89771 (= lt!136768 (bitIndex!0 (size!1907 (buf!2297 thiss!1152)) (currentByte!4560 thiss!1152) (currentBit!4555 thiss!1152)))))

(assert (=> b!89771 (= lt!136771 (bitIndex!0 (size!1907 (buf!2297 thiss!1151)) (currentByte!4560 thiss!1151) (currentBit!4555 thiss!1151)))))

(declare-fun b!89772 () Bool)

(declare-fun res!73963 () Bool)

(assert (=> b!89772 (=> (not res!73963) (not e!59243))))

(assert (=> b!89772 (= res!73963 (and (bvsle i!576 nBits!336) (= (size!1907 (buf!2297 thiss!1152)) (size!1907 (buf!2297 thiss!1151)))))))

(declare-fun b!89773 () Bool)

(declare-fun res!73957 () Bool)

(assert (=> b!89773 (=> (not res!73957) (not e!59243))))

(assert (=> b!89773 (= res!73957 (invariant!0 (currentBit!4555 thiss!1152) (currentByte!4560 thiss!1152) (size!1907 (buf!2297 thiss!1152))))))

(declare-fun b!89774 () Bool)

(assert (=> b!89774 (= e!59242 e!59241)))

(declare-fun res!73958 () Bool)

(assert (=> b!89774 (=> res!73958 e!59241)))

(assert (=> b!89774 (= res!73958 (bvslt (_3!236 lt!136773) #b00000000000000000000000000000000))))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3376 (_ BitVec 64) BitStream!3376 (_ BitVec 32)) tuple3!424)

(assert (=> b!89774 (= lt!136773 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3991 lt!136769) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!89775 () Bool)

(declare-fun res!73952 () Bool)

(assert (=> b!89775 (=> res!73952 e!59241)))

(assert (=> b!89775 (= res!73952 (not (= (bitIndex!0 (size!1907 (buf!2297 (_2!3992 lt!136773))) (currentByte!4560 (_2!3992 lt!136773)) (currentBit!4555 (_2!3992 lt!136773))) (bvadd lt!136771 ((_ sign_extend 32) (_3!236 lt!136773))))))))

(declare-fun b!89776 () Bool)

(declare-fun res!73969 () Bool)

(assert (=> b!89776 (=> res!73969 e!59241)))

(assert (=> b!89776 (= res!73969 (or (bvsgt (_3!236 lt!136773) nBits!336) (not (= (size!1907 (buf!2297 (_2!3992 lt!136773))) (size!1907 (buf!2297 thiss!1151))))))))

(assert (= (and start!18178 res!73962) b!89763))

(assert (= (and b!89763 res!73959) b!89758))

(assert (= (and b!89758 res!73954) b!89756))

(assert (= (and b!89756 res!73953) b!89773))

(assert (= (and b!89773 res!73957) b!89772))

(assert (= (and b!89772 res!73963) b!89771))

(assert (= (and b!89771 res!73968) b!89764))

(assert (= (and b!89764 res!73956) b!89765))

(assert (= (and b!89765 res!73961) b!89760))

(assert (= (and b!89760 res!73955) b!89762))

(assert (= (and b!89762 res!73967) b!89757))

(assert (= (and b!89757 res!73951) b!89767))

(assert (= (and b!89767 res!73964) b!89766))

(assert (= (and b!89760 (not res!73960)) b!89768))

(assert (= (and b!89768 (not res!73966)) b!89774))

(assert (= (and b!89774 (not res!73958)) b!89769))

(assert (= (and b!89769 (not res!73965)) b!89776))

(assert (= (and b!89776 (not res!73969)) b!89775))

(assert (= (and b!89775 (not res!73952)) b!89759))

(assert (= start!18178 b!89761))

(assert (= start!18178 b!89770))

(declare-fun m!134465 () Bool)

(assert (=> b!89766 m!134465))

(declare-fun m!134467 () Bool)

(assert (=> b!89770 m!134467))

(declare-fun m!134469 () Bool)

(assert (=> b!89761 m!134469))

(declare-fun m!134471 () Bool)

(assert (=> b!89775 m!134471))

(declare-fun m!134473 () Bool)

(assert (=> b!89760 m!134473))

(declare-fun m!134475 () Bool)

(assert (=> b!89760 m!134475))

(declare-fun m!134477 () Bool)

(assert (=> b!89764 m!134477))

(declare-fun m!134479 () Bool)

(assert (=> b!89773 m!134479))

(declare-fun m!134481 () Bool)

(assert (=> b!89763 m!134481))

(declare-fun m!134483 () Bool)

(assert (=> b!89771 m!134483))

(declare-fun m!134485 () Bool)

(assert (=> b!89771 m!134485))

(declare-fun m!134487 () Bool)

(assert (=> start!18178 m!134487))

(declare-fun m!134489 () Bool)

(assert (=> start!18178 m!134489))

(declare-fun m!134491 () Bool)

(assert (=> b!89758 m!134491))

(declare-fun m!134493 () Bool)

(assert (=> b!89769 m!134493))

(declare-fun m!134495 () Bool)

(assert (=> b!89762 m!134495))

(declare-fun m!134497 () Bool)

(assert (=> b!89757 m!134497))

(declare-fun m!134499 () Bool)

(assert (=> b!89767 m!134499))

(assert (=> b!89767 m!134499))

(declare-fun m!134501 () Bool)

(assert (=> b!89767 m!134501))

(declare-fun m!134503 () Bool)

(assert (=> b!89774 m!134503))

(push 1)

(assert (not b!89758))

(assert (not b!89774))

(assert (not b!89767))

(assert (not b!89766))

(assert (not b!89760))

(assert (not b!89773))

(assert (not b!89761))

(assert (not b!89757))

(assert (not b!89764))

(assert (not b!89763))

(assert (not b!89762))

(assert (not b!89771))

(assert (not b!89775))

(assert (not b!89770))

(assert (not b!89769))

(assert (not start!18178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

