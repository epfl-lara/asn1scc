; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18182 () Bool)

(assert start!18182)

(declare-fun b!89882 () Bool)

(declare-fun res!74068 () Bool)

(declare-fun e!59307 () Bool)

(assert (=> b!89882 (=> (not res!74068) (not e!59307))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!89882 (= res!74068 (bvslt i!576 nBits!336))))

(declare-fun b!89883 () Bool)

(declare-fun e!59310 () Bool)

(assert (=> b!89883 (= e!59307 (not e!59310))))

(declare-fun res!74083 () Bool)

(assert (=> b!89883 (=> res!74083 e!59310)))

(declare-datatypes ((array!4231 0))(
  ( (array!4232 (arr!2546 (Array (_ BitVec 32) (_ BitVec 8))) (size!1909 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3380 0))(
  ( (BitStream!3381 (buf!2299 array!4231) (currentByte!4562 (_ BitVec 32)) (currentBit!4557 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5804 0))(
  ( (Unit!5805) )
))
(declare-datatypes ((tuple2!7518 0))(
  ( (tuple2!7519 (_1!3997 Unit!5804) (_2!3997 BitStream!3380)) )
))
(declare-fun lt!136810 () tuple2!7518)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!89883 (= res!74083 (not (invariant!0 (currentBit!4557 (_2!3997 lt!136810)) (currentByte!4562 (_2!3997 lt!136810)) (size!1909 (buf!2299 (_2!3997 lt!136810))))))))

(declare-fun e!59306 () Bool)

(assert (=> b!89883 e!59306))

(declare-fun res!74078 () Bool)

(assert (=> b!89883 (=> (not res!74078) (not e!59306))))

(declare-fun thiss!1152 () BitStream!3380)

(assert (=> b!89883 (= res!74078 (= (size!1909 (buf!2299 thiss!1152)) (size!1909 (buf!2299 (_2!3997 lt!136810)))))))

(declare-fun lt!136815 () Bool)

(declare-fun appendBit!0 (BitStream!3380 Bool) tuple2!7518)

(assert (=> b!89883 (= lt!136810 (appendBit!0 thiss!1152 lt!136815))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!89883 (= lt!136815 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89884 () Bool)

(declare-fun e!59304 () Bool)

(declare-fun thiss!1151 () BitStream!3380)

(declare-fun array_inv!1755 (array!4231) Bool)

(assert (=> b!89884 (= e!59304 (array_inv!1755 (buf!2299 thiss!1151)))))

(declare-fun b!89885 () Bool)

(declare-fun res!74065 () Bool)

(declare-fun e!59301 () Bool)

(assert (=> b!89885 (=> (not res!74065) (not e!59301))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89885 (= res!74065 (validate_offset_bits!1 ((_ sign_extend 32) (size!1909 (buf!2299 thiss!1151))) ((_ sign_extend 32) (currentByte!4562 thiss!1151)) ((_ sign_extend 32) (currentBit!4557 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!89886 () Bool)

(declare-fun res!74074 () Bool)

(assert (=> b!89886 (=> (not res!74074) (not e!59301))))

(assert (=> b!89886 (= res!74074 (invariant!0 (currentBit!4557 thiss!1151) (currentByte!4562 thiss!1151) (size!1909 (buf!2299 thiss!1151))))))

(declare-fun b!89887 () Bool)

(declare-fun res!74072 () Bool)

(assert (=> b!89887 (=> (not res!74072) (not e!59301))))

(assert (=> b!89887 (= res!74072 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!89888 () Bool)

(declare-fun e!59302 () Bool)

(declare-datatypes ((tuple3!428 0))(
  ( (tuple3!429 (_1!3998 Unit!5804) (_2!3998 BitStream!3380) (_3!238 (_ BitVec 32))) )
))
(declare-fun lt!136813 () tuple3!428)

(assert (=> b!89888 (= e!59302 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!238 lt!136813) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!238 lt!136813)) #b10000000000000000000000000000000))))))

(declare-fun b!89889 () Bool)

(declare-fun e!59308 () Bool)

(assert (=> b!89889 (= e!59306 e!59308)))

(declare-fun res!74066 () Bool)

(assert (=> b!89889 (=> (not res!74066) (not e!59308))))

(declare-fun lt!136809 () (_ BitVec 64))

(declare-fun lt!136814 () (_ BitVec 64))

(assert (=> b!89889 (= res!74066 (= lt!136809 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136814)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!89889 (= lt!136809 (bitIndex!0 (size!1909 (buf!2299 (_2!3997 lt!136810))) (currentByte!4562 (_2!3997 lt!136810)) (currentBit!4557 (_2!3997 lt!136810))))))

(declare-fun b!89890 () Bool)

(declare-fun e!59309 () Bool)

(assert (=> b!89890 (= e!59309 (array_inv!1755 (buf!2299 thiss!1152)))))

(declare-fun b!89891 () Bool)

(declare-fun res!74069 () Bool)

(assert (=> b!89891 (=> (not res!74069) (not e!59301))))

(assert (=> b!89891 (= res!74069 (invariant!0 (currentBit!4557 thiss!1152) (currentByte!4562 thiss!1152) (size!1909 (buf!2299 thiss!1152))))))

(declare-fun b!89892 () Bool)

(declare-fun e!59303 () Bool)

(declare-datatypes ((tuple2!7520 0))(
  ( (tuple2!7521 (_1!3999 BitStream!3380) (_2!3999 Bool)) )
))
(declare-fun lt!136812 () tuple2!7520)

(assert (=> b!89892 (= e!59303 (= (bitIndex!0 (size!1909 (buf!2299 (_1!3999 lt!136812))) (currentByte!4562 (_1!3999 lt!136812)) (currentBit!4557 (_1!3999 lt!136812))) lt!136809))))

(declare-fun b!89893 () Bool)

(declare-fun res!74081 () Bool)

(assert (=> b!89893 (=> res!74081 e!59302)))

(assert (=> b!89893 (= res!74081 (not (invariant!0 (currentBit!4557 (_2!3998 lt!136813)) (currentByte!4562 (_2!3998 lt!136813)) (size!1909 (buf!2299 (_2!3998 lt!136813))))))))

(declare-fun b!89894 () Bool)

(declare-fun res!74070 () Bool)

(assert (=> b!89894 (=> (not res!74070) (not e!59307))))

(assert (=> b!89894 (= res!74070 (validate_offset_bits!1 ((_ sign_extend 32) (size!1909 (buf!2299 thiss!1152))) ((_ sign_extend 32) (currentByte!4562 thiss!1152)) ((_ sign_extend 32) (currentBit!4557 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!89895 () Bool)

(declare-fun res!74075 () Bool)

(assert (=> b!89895 (=> (not res!74075) (not e!59308))))

(declare-fun isPrefixOf!0 (BitStream!3380 BitStream!3380) Bool)

(assert (=> b!89895 (= res!74075 (isPrefixOf!0 thiss!1152 (_2!3997 lt!136810)))))

(declare-fun b!89897 () Bool)

(declare-fun res!74067 () Bool)

(assert (=> b!89897 (=> res!74067 e!59310)))

(assert (=> b!89897 (= res!74067 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!89898 () Bool)

(assert (=> b!89898 (= e!59310 e!59302)))

(declare-fun res!74071 () Bool)

(assert (=> b!89898 (=> res!74071 e!59302)))

(assert (=> b!89898 (= res!74071 (bvslt (_3!238 lt!136813) #b00000000000000000000000000000000))))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3380 (_ BitVec 64) BitStream!3380 (_ BitVec 32)) tuple3!428)

(assert (=> b!89898 (= lt!136813 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3997 lt!136810) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!89899 () Bool)

(declare-fun res!74080 () Bool)

(assert (=> b!89899 (=> res!74080 e!59302)))

(declare-fun lt!136811 () (_ BitVec 64))

(assert (=> b!89899 (= res!74080 (not (= (bitIndex!0 (size!1909 (buf!2299 (_2!3998 lt!136813))) (currentByte!4562 (_2!3998 lt!136813)) (currentBit!4557 (_2!3998 lt!136813))) (bvadd lt!136811 ((_ sign_extend 32) (_3!238 lt!136813))))))))

(declare-fun b!89900 () Bool)

(declare-fun res!74073 () Bool)

(assert (=> b!89900 (=> res!74073 e!59302)))

(assert (=> b!89900 (= res!74073 (or (bvsgt (_3!238 lt!136813) nBits!336) (not (= (size!1909 (buf!2299 (_2!3998 lt!136813))) (size!1909 (buf!2299 thiss!1151))))))))

(declare-fun b!89901 () Bool)

(declare-fun res!74077 () Bool)

(assert (=> b!89901 (=> (not res!74077) (not e!59301))))

(assert (=> b!89901 (= res!74077 (and (bvsle i!576 nBits!336) (= (size!1909 (buf!2299 thiss!1152)) (size!1909 (buf!2299 thiss!1151)))))))

(declare-fun b!89902 () Bool)

(assert (=> b!89902 (= e!59308 e!59303)))

(declare-fun res!74076 () Bool)

(assert (=> b!89902 (=> (not res!74076) (not e!59303))))

(assert (=> b!89902 (= res!74076 (and (= (_2!3999 lt!136812) lt!136815) (= (_1!3999 lt!136812) (_2!3997 lt!136810))))))

(declare-fun readBitPure!0 (BitStream!3380) tuple2!7520)

(declare-fun readerFrom!0 (BitStream!3380 (_ BitVec 32) (_ BitVec 32)) BitStream!3380)

(assert (=> b!89902 (= lt!136812 (readBitPure!0 (readerFrom!0 (_2!3997 lt!136810) (currentBit!4557 thiss!1152) (currentByte!4562 thiss!1152))))))

(declare-fun b!89896 () Bool)

(assert (=> b!89896 (= e!59301 e!59307)))

(declare-fun res!74082 () Bool)

(assert (=> b!89896 (=> (not res!74082) (not e!59307))))

(assert (=> b!89896 (= res!74082 (= lt!136814 (bvadd lt!136811 ((_ sign_extend 32) i!576))))))

(assert (=> b!89896 (= lt!136814 (bitIndex!0 (size!1909 (buf!2299 thiss!1152)) (currentByte!4562 thiss!1152) (currentBit!4557 thiss!1152)))))

(assert (=> b!89896 (= lt!136811 (bitIndex!0 (size!1909 (buf!2299 thiss!1151)) (currentByte!4562 thiss!1151) (currentBit!4557 thiss!1151)))))

(declare-fun res!74079 () Bool)

(assert (=> start!18182 (=> (not res!74079) (not e!59301))))

(assert (=> start!18182 (= res!74079 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18182 e!59301))

(declare-fun inv!12 (BitStream!3380) Bool)

(assert (=> start!18182 (and (inv!12 thiss!1152) e!59309)))

(assert (=> start!18182 (and (inv!12 thiss!1151) e!59304)))

(assert (=> start!18182 true))

(assert (= (and start!18182 res!74079) b!89885))

(assert (= (and b!89885 res!74065) b!89886))

(assert (= (and b!89886 res!74074) b!89887))

(assert (= (and b!89887 res!74072) b!89891))

(assert (= (and b!89891 res!74069) b!89901))

(assert (= (and b!89901 res!74077) b!89896))

(assert (= (and b!89896 res!74082) b!89894))

(assert (= (and b!89894 res!74070) b!89882))

(assert (= (and b!89882 res!74068) b!89883))

(assert (= (and b!89883 res!74078) b!89889))

(assert (= (and b!89889 res!74066) b!89895))

(assert (= (and b!89895 res!74075) b!89902))

(assert (= (and b!89902 res!74076) b!89892))

(assert (= (and b!89883 (not res!74083)) b!89897))

(assert (= (and b!89897 (not res!74067)) b!89898))

(assert (= (and b!89898 (not res!74071)) b!89893))

(assert (= (and b!89893 (not res!74081)) b!89900))

(assert (= (and b!89900 (not res!74073)) b!89899))

(assert (= (and b!89899 (not res!74080)) b!89888))

(assert (= start!18182 b!89890))

(assert (= start!18182 b!89884))

(declare-fun m!134545 () Bool)

(assert (=> b!89896 m!134545))

(declare-fun m!134547 () Bool)

(assert (=> b!89896 m!134547))

(declare-fun m!134549 () Bool)

(assert (=> b!89894 m!134549))

(declare-fun m!134551 () Bool)

(assert (=> b!89902 m!134551))

(assert (=> b!89902 m!134551))

(declare-fun m!134553 () Bool)

(assert (=> b!89902 m!134553))

(declare-fun m!134555 () Bool)

(assert (=> b!89884 m!134555))

(declare-fun m!134557 () Bool)

(assert (=> b!89886 m!134557))

(declare-fun m!134559 () Bool)

(assert (=> start!18182 m!134559))

(declare-fun m!134561 () Bool)

(assert (=> start!18182 m!134561))

(declare-fun m!134563 () Bool)

(assert (=> b!89883 m!134563))

(declare-fun m!134565 () Bool)

(assert (=> b!89883 m!134565))

(declare-fun m!134567 () Bool)

(assert (=> b!89890 m!134567))

(declare-fun m!134569 () Bool)

(assert (=> b!89898 m!134569))

(declare-fun m!134571 () Bool)

(assert (=> b!89892 m!134571))

(declare-fun m!134573 () Bool)

(assert (=> b!89889 m!134573))

(declare-fun m!134575 () Bool)

(assert (=> b!89893 m!134575))

(declare-fun m!134577 () Bool)

(assert (=> b!89899 m!134577))

(declare-fun m!134579 () Bool)

(assert (=> b!89895 m!134579))

(declare-fun m!134581 () Bool)

(assert (=> b!89885 m!134581))

(declare-fun m!134583 () Bool)

(assert (=> b!89891 m!134583))

(push 1)

(assert (not b!89884))

(assert (not b!89895))

(assert (not b!89891))

(assert (not b!89892))

(assert (not start!18182))

(assert (not b!89883))

(assert (not b!89886))

(assert (not b!89898))

(assert (not b!89899))

(assert (not b!89902))

(assert (not b!89893))

(assert (not b!89894))

(assert (not b!89885))

(assert (not b!89896))

(assert (not b!89890))

(assert (not b!89889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

