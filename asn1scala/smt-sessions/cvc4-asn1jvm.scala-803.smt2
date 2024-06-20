; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23328 () Bool)

(assert start!23328)

(declare-fun b!118428 () Bool)

(declare-fun e!77610 () Bool)

(declare-fun e!77611 () Bool)

(assert (=> b!118428 (= e!77610 e!77611)))

(declare-fun res!97999 () Bool)

(assert (=> b!118428 (=> (not res!97999) (not e!77611))))

(declare-fun lt!182163 () (_ BitVec 64))

(declare-fun lt!182179 () (_ BitVec 64))

(assert (=> b!118428 (= res!97999 (= lt!182163 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!182179)))))

(declare-datatypes ((array!5313 0))(
  ( (array!5314 (arr!3002 (Array (_ BitVec 32) (_ BitVec 8))) (size!2409 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4292 0))(
  ( (BitStream!4293 (buf!2828 array!5313) (currentByte!5483 (_ BitVec 32)) (currentBit!5478 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7289 0))(
  ( (Unit!7290) )
))
(declare-datatypes ((tuple2!9908 0))(
  ( (tuple2!9909 (_1!5219 Unit!7289) (_2!5219 BitStream!4292)) )
))
(declare-fun lt!182183 () tuple2!9908)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118428 (= lt!182163 (bitIndex!0 (size!2409 (buf!2828 (_2!5219 lt!182183))) (currentByte!5483 (_2!5219 lt!182183)) (currentBit!5478 (_2!5219 lt!182183))))))

(declare-fun thiss!1305 () BitStream!4292)

(assert (=> b!118428 (= lt!182179 (bitIndex!0 (size!2409 (buf!2828 thiss!1305)) (currentByte!5483 thiss!1305) (currentBit!5478 thiss!1305)))))

(declare-fun b!118429 () Bool)

(declare-fun e!77613 () Bool)

(declare-datatypes ((tuple2!9910 0))(
  ( (tuple2!9911 (_1!5220 BitStream!4292) (_2!5220 Bool)) )
))
(declare-fun lt!182171 () tuple2!9910)

(assert (=> b!118429 (= e!77613 (= (bitIndex!0 (size!2409 (buf!2828 (_1!5220 lt!182171))) (currentByte!5483 (_1!5220 lt!182171)) (currentBit!5478 (_1!5220 lt!182171))) lt!182163))))

(declare-fun b!118430 () Bool)

(declare-fun e!77612 () Bool)

(declare-fun lt!182164 () tuple2!9908)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!118430 (= e!77612 (invariant!0 (currentBit!5478 thiss!1305) (currentByte!5483 thiss!1305) (size!2409 (buf!2828 (_2!5219 lt!182164)))))))

(declare-fun b!118431 () Bool)

(declare-fun e!77614 () Bool)

(declare-fun e!77615 () Bool)

(assert (=> b!118431 (= e!77614 e!77615)))

(declare-fun res!98003 () Bool)

(assert (=> b!118431 (=> (not res!98003) (not e!77615))))

(declare-fun lt!182177 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118431 (= res!98003 (validate_offset_bits!1 ((_ sign_extend 32) (size!2409 (buf!2828 thiss!1305))) ((_ sign_extend 32) (currentByte!5483 thiss!1305)) ((_ sign_extend 32) (currentBit!5478 thiss!1305)) lt!182177))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!118431 (= lt!182177 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!118432 () Bool)

(declare-fun res!98005 () Bool)

(declare-fun e!77616 () Bool)

(assert (=> b!118432 (=> res!98005 e!77616)))

(declare-datatypes ((tuple2!9912 0))(
  ( (tuple2!9913 (_1!5221 BitStream!4292) (_2!5221 BitStream!4292)) )
))
(declare-fun lt!182181 () tuple2!9912)

(assert (=> b!118432 (= res!98005 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2409 (buf!2828 (_1!5221 lt!182181)))) ((_ sign_extend 32) (currentByte!5483 (_1!5221 lt!182181))) ((_ sign_extend 32) (currentBit!5478 (_1!5221 lt!182181))) lt!182177)))))

(declare-fun b!118433 () Bool)

(declare-fun e!77617 () Bool)

(declare-fun array_inv!2211 (array!5313) Bool)

(assert (=> b!118433 (= e!77617 (array_inv!2211 (buf!2828 thiss!1305)))))

(declare-fun b!118434 () Bool)

(declare-fun lt!182174 () (_ BitVec 64))

(declare-fun lt!182169 () (_ BitVec 64))

(assert (=> b!118434 (= e!77616 (= (bvand lt!182174 lt!182169) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!118435 () Bool)

(declare-fun res!97998 () Bool)

(assert (=> b!118435 (=> (not res!97998) (not e!77611))))

(declare-fun isPrefixOf!0 (BitStream!4292 BitStream!4292) Bool)

(assert (=> b!118435 (= res!97998 (isPrefixOf!0 thiss!1305 (_2!5219 lt!182183)))))

(declare-fun b!118436 () Bool)

(assert (=> b!118436 (= e!77611 e!77613)))

(declare-fun res!97996 () Bool)

(assert (=> b!118436 (=> (not res!97996) (not e!77613))))

(declare-fun lt!182167 () Bool)

(assert (=> b!118436 (= res!97996 (and (= (_2!5220 lt!182171) lt!182167) (= (_1!5220 lt!182171) (_2!5219 lt!182183))))))

(declare-fun readBitPure!0 (BitStream!4292) tuple2!9910)

(declare-fun readerFrom!0 (BitStream!4292 (_ BitVec 32) (_ BitVec 32)) BitStream!4292)

(assert (=> b!118436 (= lt!182171 (readBitPure!0 (readerFrom!0 (_2!5219 lt!182183) (currentBit!5478 thiss!1305) (currentByte!5483 thiss!1305))))))

(declare-fun res!98006 () Bool)

(assert (=> start!23328 (=> (not res!98006) (not e!77614))))

(assert (=> start!23328 (= res!98006 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23328 e!77614))

(assert (=> start!23328 true))

(declare-fun inv!12 (BitStream!4292) Bool)

(assert (=> start!23328 (and (inv!12 thiss!1305) e!77617)))

(declare-fun b!118437 () Bool)

(declare-fun res!98000 () Bool)

(assert (=> b!118437 (=> (not res!98000) (not e!77615))))

(assert (=> b!118437 (= res!98000 (bvslt i!615 nBits!396))))

(declare-fun b!118438 () Bool)

(declare-fun res!98004 () Bool)

(assert (=> b!118438 (=> (not res!98004) (not e!77615))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118438 (= res!98004 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!118439 () Bool)

(declare-fun res!98001 () Bool)

(assert (=> b!118439 (=> (not res!98001) (not e!77612))))

(assert (=> b!118439 (= res!98001 (invariant!0 (currentBit!5478 thiss!1305) (currentByte!5483 thiss!1305) (size!2409 (buf!2828 (_2!5219 lt!182183)))))))

(declare-fun b!118440 () Bool)

(assert (=> b!118440 (= e!77615 (not e!77616))))

(declare-fun res!98007 () Bool)

(assert (=> b!118440 (=> res!98007 e!77616)))

(declare-fun lt!182178 () tuple2!9910)

(declare-fun lt!182173 () tuple2!9912)

(declare-fun lt!182165 () (_ BitVec 64))

(declare-datatypes ((tuple2!9914 0))(
  ( (tuple2!9915 (_1!5222 BitStream!4292) (_2!5222 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9914)

(assert (=> b!118440 (= res!98007 (not (= (_1!5222 (readNLeastSignificantBitsLoopPure!0 (_1!5221 lt!182173) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!182174 (ite (_2!5220 lt!182178) lt!182165 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5221 lt!182173))))))

(declare-fun lt!182182 () (_ BitVec 64))

(assert (=> b!118440 (validate_offset_bits!1 ((_ sign_extend 32) (size!2409 (buf!2828 (_2!5219 lt!182164)))) ((_ sign_extend 32) (currentByte!5483 (_2!5219 lt!182183))) ((_ sign_extend 32) (currentBit!5478 (_2!5219 lt!182183))) lt!182182)))

(declare-fun lt!182184 () Unit!7289)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4292 array!5313 (_ BitVec 64)) Unit!7289)

(assert (=> b!118440 (= lt!182184 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5219 lt!182183) (buf!2828 (_2!5219 lt!182164)) lt!182182))))

(assert (=> b!118440 (= lt!182182 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!182175 () tuple2!9914)

(assert (=> b!118440 (= lt!182175 (readNLeastSignificantBitsLoopPure!0 (_1!5221 lt!182181) nBits!396 i!615 lt!182174))))

(assert (=> b!118440 (validate_offset_bits!1 ((_ sign_extend 32) (size!2409 (buf!2828 (_2!5219 lt!182164)))) ((_ sign_extend 32) (currentByte!5483 thiss!1305)) ((_ sign_extend 32) (currentBit!5478 thiss!1305)) lt!182177)))

(declare-fun lt!182176 () Unit!7289)

(assert (=> b!118440 (= lt!182176 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2828 (_2!5219 lt!182164)) lt!182177))))

(assert (=> b!118440 (= lt!182174 (bvand v!199 (bvnot lt!182169)))))

(assert (=> b!118440 (= lt!182169 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!118440 (= (_2!5220 lt!182178) lt!182167)))

(assert (=> b!118440 (= lt!182178 (readBitPure!0 (_1!5221 lt!182181)))))

(declare-fun reader!0 (BitStream!4292 BitStream!4292) tuple2!9912)

(assert (=> b!118440 (= lt!182173 (reader!0 (_2!5219 lt!182183) (_2!5219 lt!182164)))))

(assert (=> b!118440 (= lt!182181 (reader!0 thiss!1305 (_2!5219 lt!182164)))))

(declare-fun e!77619 () Bool)

(assert (=> b!118440 e!77619))

(declare-fun res!98002 () Bool)

(assert (=> b!118440 (=> (not res!98002) (not e!77619))))

(declare-fun lt!182180 () tuple2!9910)

(declare-fun lt!182170 () tuple2!9910)

(assert (=> b!118440 (= res!98002 (= (bitIndex!0 (size!2409 (buf!2828 (_1!5220 lt!182180))) (currentByte!5483 (_1!5220 lt!182180)) (currentBit!5478 (_1!5220 lt!182180))) (bitIndex!0 (size!2409 (buf!2828 (_1!5220 lt!182170))) (currentByte!5483 (_1!5220 lt!182170)) (currentBit!5478 (_1!5220 lt!182170)))))))

(declare-fun lt!182172 () Unit!7289)

(declare-fun lt!182166 () BitStream!4292)

(declare-fun readBitPrefixLemma!0 (BitStream!4292 BitStream!4292) Unit!7289)

(assert (=> b!118440 (= lt!182172 (readBitPrefixLemma!0 lt!182166 (_2!5219 lt!182164)))))

(assert (=> b!118440 (= lt!182170 (readBitPure!0 (BitStream!4293 (buf!2828 (_2!5219 lt!182164)) (currentByte!5483 thiss!1305) (currentBit!5478 thiss!1305))))))

(assert (=> b!118440 (= lt!182180 (readBitPure!0 lt!182166))))

(assert (=> b!118440 (= lt!182166 (BitStream!4293 (buf!2828 (_2!5219 lt!182183)) (currentByte!5483 thiss!1305) (currentBit!5478 thiss!1305)))))

(assert (=> b!118440 e!77612))

(declare-fun res!97995 () Bool)

(assert (=> b!118440 (=> (not res!97995) (not e!77612))))

(assert (=> b!118440 (= res!97995 (isPrefixOf!0 thiss!1305 (_2!5219 lt!182164)))))

(declare-fun lt!182168 () Unit!7289)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4292 BitStream!4292 BitStream!4292) Unit!7289)

(assert (=> b!118440 (= lt!182168 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5219 lt!182183) (_2!5219 lt!182164)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4292 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9908)

(assert (=> b!118440 (= lt!182164 (appendNLeastSignificantBitsLoop!0 (_2!5219 lt!182183) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!118440 e!77610))

(declare-fun res!97997 () Bool)

(assert (=> b!118440 (=> (not res!97997) (not e!77610))))

(assert (=> b!118440 (= res!97997 (= (size!2409 (buf!2828 thiss!1305)) (size!2409 (buf!2828 (_2!5219 lt!182183)))))))

(declare-fun appendBit!0 (BitStream!4292 Bool) tuple2!9908)

(assert (=> b!118440 (= lt!182183 (appendBit!0 thiss!1305 lt!182167))))

(assert (=> b!118440 (= lt!182167 (not (= (bvand v!199 lt!182165) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118440 (= lt!182165 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!118441 () Bool)

(assert (=> b!118441 (= e!77619 (= (_2!5220 lt!182180) (_2!5220 lt!182170)))))

(assert (= (and start!23328 res!98006) b!118431))

(assert (= (and b!118431 res!98003) b!118438))

(assert (= (and b!118438 res!98004) b!118437))

(assert (= (and b!118437 res!98000) b!118440))

(assert (= (and b!118440 res!97997) b!118428))

(assert (= (and b!118428 res!97999) b!118435))

(assert (= (and b!118435 res!97998) b!118436))

(assert (= (and b!118436 res!97996) b!118429))

(assert (= (and b!118440 res!97995) b!118439))

(assert (= (and b!118439 res!98001) b!118430))

(assert (= (and b!118440 res!98002) b!118441))

(assert (= (and b!118440 (not res!98007)) b!118432))

(assert (= (and b!118432 (not res!98005)) b!118434))

(assert (= start!23328 b!118433))

(declare-fun m!177901 () Bool)

(assert (=> b!118438 m!177901))

(declare-fun m!177903 () Bool)

(assert (=> b!118435 m!177903))

(declare-fun m!177905 () Bool)

(assert (=> b!118439 m!177905))

(declare-fun m!177907 () Bool)

(assert (=> b!118433 m!177907))

(declare-fun m!177909 () Bool)

(assert (=> b!118429 m!177909))

(declare-fun m!177911 () Bool)

(assert (=> b!118436 m!177911))

(assert (=> b!118436 m!177911))

(declare-fun m!177913 () Bool)

(assert (=> b!118436 m!177913))

(declare-fun m!177915 () Bool)

(assert (=> b!118428 m!177915))

(declare-fun m!177917 () Bool)

(assert (=> b!118428 m!177917))

(declare-fun m!177919 () Bool)

(assert (=> b!118430 m!177919))

(declare-fun m!177921 () Bool)

(assert (=> b!118432 m!177921))

(declare-fun m!177923 () Bool)

(assert (=> b!118440 m!177923))

(declare-fun m!177925 () Bool)

(assert (=> b!118440 m!177925))

(declare-fun m!177927 () Bool)

(assert (=> b!118440 m!177927))

(declare-fun m!177929 () Bool)

(assert (=> b!118440 m!177929))

(declare-fun m!177931 () Bool)

(assert (=> b!118440 m!177931))

(declare-fun m!177933 () Bool)

(assert (=> b!118440 m!177933))

(declare-fun m!177935 () Bool)

(assert (=> b!118440 m!177935))

(declare-fun m!177937 () Bool)

(assert (=> b!118440 m!177937))

(declare-fun m!177939 () Bool)

(assert (=> b!118440 m!177939))

(declare-fun m!177941 () Bool)

(assert (=> b!118440 m!177941))

(declare-fun m!177943 () Bool)

(assert (=> b!118440 m!177943))

(declare-fun m!177945 () Bool)

(assert (=> b!118440 m!177945))

(declare-fun m!177947 () Bool)

(assert (=> b!118440 m!177947))

(declare-fun m!177949 () Bool)

(assert (=> b!118440 m!177949))

(declare-fun m!177951 () Bool)

(assert (=> b!118440 m!177951))

(declare-fun m!177953 () Bool)

(assert (=> b!118440 m!177953))

(declare-fun m!177955 () Bool)

(assert (=> b!118440 m!177955))

(declare-fun m!177957 () Bool)

(assert (=> b!118440 m!177957))

(declare-fun m!177959 () Bool)

(assert (=> b!118440 m!177959))

(declare-fun m!177961 () Bool)

(assert (=> b!118431 m!177961))

(declare-fun m!177963 () Bool)

(assert (=> start!23328 m!177963))

(push 1)

(assert (not b!118436))

(assert (not b!118439))

(assert (not b!118429))

(assert (not b!118440))

(assert (not b!118428))

(assert (not b!118433))

(assert (not start!23328))

(assert (not b!118431))

(assert (not b!118438))

(assert (not b!118435))

(assert (not b!118432))

(assert (not b!118430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

