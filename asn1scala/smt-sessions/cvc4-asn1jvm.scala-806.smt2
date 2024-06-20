; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23454 () Bool)

(assert start!23454)

(declare-fun res!98593 () Bool)

(declare-fun e!78077 () Bool)

(assert (=> start!23454 (=> (not res!98593) (not e!78077))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!23454 (= res!98593 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23454 e!78077))

(assert (=> start!23454 true))

(declare-datatypes ((array!5334 0))(
  ( (array!5335 (arr!3011 (Array (_ BitVec 32) (_ BitVec 8))) (size!2418 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4310 0))(
  ( (BitStream!4311 (buf!2840 array!5334) (currentByte!5501 (_ BitVec 32)) (currentBit!5496 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4310)

(declare-fun e!78073 () Bool)

(declare-fun inv!12 (BitStream!4310) Bool)

(assert (=> start!23454 (and (inv!12 thiss!1305) e!78073)))

(declare-fun b!119107 () Bool)

(declare-fun res!98590 () Bool)

(declare-fun e!78071 () Bool)

(assert (=> b!119107 (=> (not res!98590) (not e!78071))))

(declare-datatypes ((Unit!7331 0))(
  ( (Unit!7332) )
))
(declare-datatypes ((tuple2!9992 0))(
  ( (tuple2!9993 (_1!5261 Unit!7331) (_2!5261 BitStream!4310)) )
))
(declare-fun lt!183817 () tuple2!9992)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!119107 (= res!98590 (invariant!0 (currentBit!5496 thiss!1305) (currentByte!5501 thiss!1305) (size!2418 (buf!2840 (_2!5261 lt!183817)))))))

(declare-fun b!119108 () Bool)

(declare-fun e!78074 () Bool)

(declare-datatypes ((tuple2!9994 0))(
  ( (tuple2!9995 (_1!5262 BitStream!4310) (_2!5262 Bool)) )
))
(declare-fun lt!183816 () tuple2!9994)

(declare-fun lt!183828 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119108 (= e!78074 (= (bitIndex!0 (size!2418 (buf!2840 (_1!5262 lt!183816))) (currentByte!5501 (_1!5262 lt!183816)) (currentBit!5496 (_1!5262 lt!183816))) lt!183828))))

(declare-fun b!119109 () Bool)

(declare-fun res!98591 () Bool)

(declare-fun e!78078 () Bool)

(assert (=> b!119109 (=> (not res!98591) (not e!78078))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119109 (= res!98591 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!119110 () Bool)

(declare-fun lt!183827 () tuple2!9992)

(assert (=> b!119110 (= e!78071 (invariant!0 (currentBit!5496 thiss!1305) (currentByte!5501 thiss!1305) (size!2418 (buf!2840 (_2!5261 lt!183827)))))))

(declare-fun b!119111 () Bool)

(declare-fun e!78075 () Bool)

(declare-datatypes ((tuple2!9996 0))(
  ( (tuple2!9997 (_1!5263 BitStream!4310) (_2!5263 BitStream!4310)) )
))
(declare-fun lt!183823 () tuple2!9996)

(declare-fun withMovedBitIndex!0 (BitStream!4310 (_ BitVec 64)) BitStream!4310)

(assert (=> b!119111 (= e!78075 (= (_1!5263 lt!183823) (withMovedBitIndex!0 (_2!5263 lt!183823) (bvsub (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)) (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183827))) (currentByte!5501 (_2!5261 lt!183827)) (currentBit!5496 (_2!5261 lt!183827)))))))))

(declare-datatypes ((tuple2!9998 0))(
  ( (tuple2!9999 (_1!5264 BitStream!4310) (_2!5264 (_ BitVec 64))) )
))
(declare-fun lt!183833 () tuple2!9998)

(declare-fun lt!183834 () tuple2!9998)

(assert (=> b!119111 (and (= (_2!5264 lt!183833) (_2!5264 lt!183834)) (= (_1!5264 lt!183833) (_1!5264 lt!183834)))))

(declare-fun lt!183832 () Unit!7331)

(declare-fun lt!183822 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7331)

(assert (=> b!119111 (= lt!183832 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5263 lt!183823) nBits!396 i!615 lt!183822))))

(declare-fun lt!183837 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9998)

(assert (=> b!119111 (= lt!183834 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5263 lt!183823) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183837))))

(declare-fun b!119112 () Bool)

(declare-fun e!78070 () Bool)

(declare-fun lt!183819 () tuple2!9994)

(declare-fun lt!183835 () tuple2!9994)

(assert (=> b!119112 (= e!78070 (= (_2!5262 lt!183819) (_2!5262 lt!183835)))))

(declare-fun b!119113 () Bool)

(declare-fun e!78076 () Bool)

(declare-fun e!78069 () Bool)

(assert (=> b!119113 (= e!78076 e!78069)))

(declare-fun res!98592 () Bool)

(assert (=> b!119113 (=> (not res!98592) (not e!78069))))

(declare-fun lt!183829 () (_ BitVec 64))

(assert (=> b!119113 (= res!98592 (= lt!183828 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!183829)))))

(assert (=> b!119113 (= lt!183828 (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183817))) (currentByte!5501 (_2!5261 lt!183817)) (currentBit!5496 (_2!5261 lt!183817))))))

(assert (=> b!119113 (= lt!183829 (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)))))

(declare-fun b!119114 () Bool)

(assert (=> b!119114 (= e!78069 e!78074)))

(declare-fun res!98587 () Bool)

(assert (=> b!119114 (=> (not res!98587) (not e!78074))))

(declare-fun lt!183830 () Bool)

(assert (=> b!119114 (= res!98587 (and (= (_2!5262 lt!183816) lt!183830) (= (_1!5262 lt!183816) (_2!5261 lt!183817))))))

(declare-fun readBitPure!0 (BitStream!4310) tuple2!9994)

(declare-fun readerFrom!0 (BitStream!4310 (_ BitVec 32) (_ BitVec 32)) BitStream!4310)

(assert (=> b!119114 (= lt!183816 (readBitPure!0 (readerFrom!0 (_2!5261 lt!183817) (currentBit!5496 thiss!1305) (currentByte!5501 thiss!1305))))))

(declare-fun b!119115 () Bool)

(declare-fun array_inv!2220 (array!5334) Bool)

(assert (=> b!119115 (= e!78073 (array_inv!2220 (buf!2840 thiss!1305)))))

(declare-fun b!119116 () Bool)

(declare-fun res!98596 () Bool)

(assert (=> b!119116 (=> (not res!98596) (not e!78078))))

(assert (=> b!119116 (= res!98596 (bvslt i!615 nBits!396))))

(declare-fun b!119117 () Bool)

(assert (=> b!119117 (= e!78077 e!78078)))

(declare-fun res!98588 () Bool)

(assert (=> b!119117 (=> (not res!98588) (not e!78078))))

(declare-fun lt!183814 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119117 (= res!98588 (validate_offset_bits!1 ((_ sign_extend 32) (size!2418 (buf!2840 thiss!1305))) ((_ sign_extend 32) (currentByte!5501 thiss!1305)) ((_ sign_extend 32) (currentBit!5496 thiss!1305)) lt!183814))))

(assert (=> b!119117 (= lt!183814 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!119118 () Bool)

(declare-fun res!98589 () Bool)

(assert (=> b!119118 (=> (not res!98589) (not e!78069))))

(declare-fun isPrefixOf!0 (BitStream!4310 BitStream!4310) Bool)

(assert (=> b!119118 (= res!98589 (isPrefixOf!0 thiss!1305 (_2!5261 lt!183817)))))

(declare-fun b!119119 () Bool)

(assert (=> b!119119 (= e!78078 (not e!78075))))

(declare-fun res!98594 () Bool)

(assert (=> b!119119 (=> res!98594 e!78075)))

(declare-fun lt!183818 () tuple2!9996)

(assert (=> b!119119 (= res!98594 (not (= (_1!5264 (readNLeastSignificantBitsLoopPure!0 (_1!5263 lt!183818) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183837)) (_2!5263 lt!183818))))))

(declare-fun lt!183826 () (_ BitVec 64))

(assert (=> b!119119 (validate_offset_bits!1 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183827)))) ((_ sign_extend 32) (currentByte!5501 (_2!5261 lt!183817))) ((_ sign_extend 32) (currentBit!5496 (_2!5261 lt!183817))) lt!183826)))

(declare-fun lt!183825 () Unit!7331)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4310 array!5334 (_ BitVec 64)) Unit!7331)

(assert (=> b!119119 (= lt!183825 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5261 lt!183817) (buf!2840 (_2!5261 lt!183827)) lt!183826))))

(assert (=> b!119119 (= lt!183826 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!183831 () (_ BitVec 64))

(declare-fun lt!183815 () tuple2!9994)

(assert (=> b!119119 (= lt!183837 (bvor lt!183822 (ite (_2!5262 lt!183815) lt!183831 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119119 (= lt!183833 (readNLeastSignificantBitsLoopPure!0 (_1!5263 lt!183823) nBits!396 i!615 lt!183822))))

(assert (=> b!119119 (validate_offset_bits!1 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183827)))) ((_ sign_extend 32) (currentByte!5501 thiss!1305)) ((_ sign_extend 32) (currentBit!5496 thiss!1305)) lt!183814)))

(declare-fun lt!183836 () Unit!7331)

(assert (=> b!119119 (= lt!183836 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2840 (_2!5261 lt!183827)) lt!183814))))

(assert (=> b!119119 (= lt!183822 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!119119 (= (_2!5262 lt!183815) lt!183830)))

(assert (=> b!119119 (= lt!183815 (readBitPure!0 (_1!5263 lt!183823)))))

(declare-fun reader!0 (BitStream!4310 BitStream!4310) tuple2!9996)

(assert (=> b!119119 (= lt!183818 (reader!0 (_2!5261 lt!183817) (_2!5261 lt!183827)))))

(assert (=> b!119119 (= lt!183823 (reader!0 thiss!1305 (_2!5261 lt!183827)))))

(assert (=> b!119119 e!78070))

(declare-fun res!98595 () Bool)

(assert (=> b!119119 (=> (not res!98595) (not e!78070))))

(assert (=> b!119119 (= res!98595 (= (bitIndex!0 (size!2418 (buf!2840 (_1!5262 lt!183819))) (currentByte!5501 (_1!5262 lt!183819)) (currentBit!5496 (_1!5262 lt!183819))) (bitIndex!0 (size!2418 (buf!2840 (_1!5262 lt!183835))) (currentByte!5501 (_1!5262 lt!183835)) (currentBit!5496 (_1!5262 lt!183835)))))))

(declare-fun lt!183824 () Unit!7331)

(declare-fun lt!183821 () BitStream!4310)

(declare-fun readBitPrefixLemma!0 (BitStream!4310 BitStream!4310) Unit!7331)

(assert (=> b!119119 (= lt!183824 (readBitPrefixLemma!0 lt!183821 (_2!5261 lt!183827)))))

(assert (=> b!119119 (= lt!183835 (readBitPure!0 (BitStream!4311 (buf!2840 (_2!5261 lt!183827)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305))))))

(assert (=> b!119119 (= lt!183819 (readBitPure!0 lt!183821))))

(assert (=> b!119119 (= lt!183821 (BitStream!4311 (buf!2840 (_2!5261 lt!183817)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)))))

(assert (=> b!119119 e!78071))

(declare-fun res!98598 () Bool)

(assert (=> b!119119 (=> (not res!98598) (not e!78071))))

(assert (=> b!119119 (= res!98598 (isPrefixOf!0 thiss!1305 (_2!5261 lt!183827)))))

(declare-fun lt!183820 () Unit!7331)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4310 BitStream!4310 BitStream!4310) Unit!7331)

(assert (=> b!119119 (= lt!183820 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5261 lt!183817) (_2!5261 lt!183827)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4310 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9992)

(assert (=> b!119119 (= lt!183827 (appendNLeastSignificantBitsLoop!0 (_2!5261 lt!183817) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!119119 e!78076))

(declare-fun res!98597 () Bool)

(assert (=> b!119119 (=> (not res!98597) (not e!78076))))

(assert (=> b!119119 (= res!98597 (= (size!2418 (buf!2840 thiss!1305)) (size!2418 (buf!2840 (_2!5261 lt!183817)))))))

(declare-fun appendBit!0 (BitStream!4310 Bool) tuple2!9992)

(assert (=> b!119119 (= lt!183817 (appendBit!0 thiss!1305 lt!183830))))

(assert (=> b!119119 (= lt!183830 (not (= (bvand v!199 lt!183831) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119119 (= lt!183831 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(assert (= (and start!23454 res!98593) b!119117))

(assert (= (and b!119117 res!98588) b!119109))

(assert (= (and b!119109 res!98591) b!119116))

(assert (= (and b!119116 res!98596) b!119119))

(assert (= (and b!119119 res!98597) b!119113))

(assert (= (and b!119113 res!98592) b!119118))

(assert (= (and b!119118 res!98589) b!119114))

(assert (= (and b!119114 res!98587) b!119108))

(assert (= (and b!119119 res!98598) b!119107))

(assert (= (and b!119107 res!98590) b!119110))

(assert (= (and b!119119 res!98595) b!119112))

(assert (= (and b!119119 (not res!98594)) b!119111))

(assert (= start!23454 b!119115))

(declare-fun m!179195 () Bool)

(assert (=> b!119117 m!179195))

(declare-fun m!179197 () Bool)

(assert (=> b!119110 m!179197))

(declare-fun m!179199 () Bool)

(assert (=> start!23454 m!179199))

(declare-fun m!179201 () Bool)

(assert (=> b!119113 m!179201))

(declare-fun m!179203 () Bool)

(assert (=> b!119113 m!179203))

(declare-fun m!179205 () Bool)

(assert (=> b!119111 m!179205))

(declare-fun m!179207 () Bool)

(assert (=> b!119111 m!179207))

(assert (=> b!119111 m!179203))

(assert (=> b!119111 m!179205))

(declare-fun m!179209 () Bool)

(assert (=> b!119111 m!179209))

(declare-fun m!179211 () Bool)

(assert (=> b!119111 m!179211))

(declare-fun m!179213 () Bool)

(assert (=> b!119111 m!179213))

(declare-fun m!179215 () Bool)

(assert (=> b!119115 m!179215))

(declare-fun m!179217 () Bool)

(assert (=> b!119114 m!179217))

(assert (=> b!119114 m!179217))

(declare-fun m!179219 () Bool)

(assert (=> b!119114 m!179219))

(declare-fun m!179221 () Bool)

(assert (=> b!119118 m!179221))

(declare-fun m!179223 () Bool)

(assert (=> b!119109 m!179223))

(declare-fun m!179225 () Bool)

(assert (=> b!119107 m!179225))

(declare-fun m!179227 () Bool)

(assert (=> b!119108 m!179227))

(declare-fun m!179229 () Bool)

(assert (=> b!119119 m!179229))

(declare-fun m!179231 () Bool)

(assert (=> b!119119 m!179231))

(declare-fun m!179233 () Bool)

(assert (=> b!119119 m!179233))

(declare-fun m!179235 () Bool)

(assert (=> b!119119 m!179235))

(declare-fun m!179237 () Bool)

(assert (=> b!119119 m!179237))

(declare-fun m!179239 () Bool)

(assert (=> b!119119 m!179239))

(declare-fun m!179241 () Bool)

(assert (=> b!119119 m!179241))

(declare-fun m!179243 () Bool)

(assert (=> b!119119 m!179243))

(declare-fun m!179245 () Bool)

(assert (=> b!119119 m!179245))

(declare-fun m!179247 () Bool)

(assert (=> b!119119 m!179247))

(declare-fun m!179249 () Bool)

(assert (=> b!119119 m!179249))

(declare-fun m!179251 () Bool)

(assert (=> b!119119 m!179251))

(declare-fun m!179253 () Bool)

(assert (=> b!119119 m!179253))

(declare-fun m!179255 () Bool)

(assert (=> b!119119 m!179255))

(declare-fun m!179257 () Bool)

(assert (=> b!119119 m!179257))

(declare-fun m!179259 () Bool)

(assert (=> b!119119 m!179259))

(declare-fun m!179261 () Bool)

(assert (=> b!119119 m!179261))

(declare-fun m!179263 () Bool)

(assert (=> b!119119 m!179263))

(declare-fun m!179265 () Bool)

(assert (=> b!119119 m!179265))

(push 1)

(assert (not b!119111))

(assert (not b!119117))

(assert (not b!119110))

(assert (not b!119115))

(assert (not b!119108))

(assert (not start!23454))

(assert (not b!119119))

(assert (not b!119113))

(assert (not b!119114))

(assert (not b!119109))

(assert (not b!119107))

(assert (not b!119118))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!38146 () Bool)

(declare-fun lt!183983 () tuple2!9998)

(declare-fun lt!183986 () tuple2!9998)

(assert (=> d!38146 (and (= (_2!5264 lt!183983) (_2!5264 lt!183986)) (= (_1!5264 lt!183983) (_1!5264 lt!183986)))))

(declare-fun lt!183984 () Bool)

(declare-fun lt!183985 () (_ BitVec 64))

(declare-fun lt!183988 () Unit!7331)

(declare-fun lt!183987 () BitStream!4310)

(declare-fun choose!45 (BitStream!4310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9998 tuple2!9998 BitStream!4310 (_ BitVec 64) Bool BitStream!4310 (_ BitVec 64) tuple2!9998 tuple2!9998 BitStream!4310 (_ BitVec 64)) Unit!7331)

(assert (=> d!38146 (= lt!183988 (choose!45 (_1!5263 lt!183823) nBits!396 i!615 lt!183822 lt!183983 (tuple2!9999 (_1!5264 lt!183983) (_2!5264 lt!183983)) (_1!5264 lt!183983) (_2!5264 lt!183983) lt!183984 lt!183987 lt!183985 lt!183986 (tuple2!9999 (_1!5264 lt!183986) (_2!5264 lt!183986)) (_1!5264 lt!183986) (_2!5264 lt!183986)))))

(assert (=> d!38146 (= lt!183986 (readNLeastSignificantBitsLoopPure!0 lt!183987 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!183985))))

(assert (=> d!38146 (= lt!183985 (bvor lt!183822 (ite lt!183984 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38146 (= lt!183987 (withMovedBitIndex!0 (_1!5263 lt!183823) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38146 (= lt!183984 (_2!5262 (readBitPure!0 (_1!5263 lt!183823))))))

(assert (=> d!38146 (= lt!183983 (readNLeastSignificantBitsLoopPure!0 (_1!5263 lt!183823) nBits!396 i!615 lt!183822))))

(assert (=> d!38146 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5263 lt!183823) nBits!396 i!615 lt!183822) lt!183988)))

(declare-fun bs!9234 () Bool)

(assert (= bs!9234 d!38146))

(assert (=> bs!9234 m!179235))

(declare-fun m!179369 () Bool)

(assert (=> bs!9234 m!179369))

(assert (=> bs!9234 m!179251))

(declare-fun m!179371 () Bool)

(assert (=> bs!9234 m!179371))

(assert (=> bs!9234 m!179205))

(assert (=> b!119111 d!38146))

(declare-fun d!38148 () Bool)

(declare-fun e!78109 () Bool)

(assert (=> d!38148 e!78109))

(declare-fun res!98646 () Bool)

(assert (=> d!38148 (=> (not res!98646) (not e!78109))))

(declare-fun lt!183994 () (_ BitVec 64))

(declare-fun lt!183993 () BitStream!4310)

(assert (=> d!38148 (= res!98646 (= (bvadd lt!183994 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2418 (buf!2840 lt!183993)) (currentByte!5501 lt!183993) (currentBit!5496 lt!183993))))))

(assert (=> d!38148 (or (not (= (bvand lt!183994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!183994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!183994 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38148 (= lt!183994 (bitIndex!0 (size!2418 (buf!2840 (_1!5263 lt!183823))) (currentByte!5501 (_1!5263 lt!183823)) (currentBit!5496 (_1!5263 lt!183823))))))

(declare-fun moveBitIndex!0 (BitStream!4310 (_ BitVec 64)) tuple2!9992)

(assert (=> d!38148 (= lt!183993 (_2!5261 (moveBitIndex!0 (_1!5263 lt!183823) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4310 (_ BitVec 64)) Bool)

(assert (=> d!38148 (moveBitIndexPrecond!0 (_1!5263 lt!183823) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38148 (= (withMovedBitIndex!0 (_1!5263 lt!183823) #b0000000000000000000000000000000000000000000000000000000000000001) lt!183993)))

(declare-fun b!119176 () Bool)

(assert (=> b!119176 (= e!78109 (= (size!2418 (buf!2840 (_1!5263 lt!183823))) (size!2418 (buf!2840 lt!183993))))))

(assert (= (and d!38148 res!98646) b!119176))

(declare-fun m!179373 () Bool)

(assert (=> d!38148 m!179373))

(declare-fun m!179375 () Bool)

(assert (=> d!38148 m!179375))

(declare-fun m!179377 () Bool)

(assert (=> d!38148 m!179377))

(declare-fun m!179379 () Bool)

(assert (=> d!38148 m!179379))

(assert (=> b!119111 d!38148))

(declare-fun d!38150 () Bool)

(declare-datatypes ((tuple2!10004 0))(
  ( (tuple2!10005 (_1!5267 (_ BitVec 64)) (_2!5267 BitStream!4310)) )
))
(declare-fun lt!183997 () tuple2!10004)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10004)

(assert (=> d!38150 (= lt!183997 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5263 lt!183823) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183837))))

(assert (=> d!38150 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5263 lt!183823) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183837) (tuple2!9999 (_2!5267 lt!183997) (_1!5267 lt!183997)))))

(declare-fun bs!9235 () Bool)

(assert (= bs!9235 d!38150))

(assert (=> bs!9235 m!179205))

(declare-fun m!179381 () Bool)

(assert (=> bs!9235 m!179381))

(assert (=> b!119111 d!38150))

(declare-fun d!38152 () Bool)

(declare-fun e!78112 () Bool)

(assert (=> d!38152 e!78112))

(declare-fun res!98651 () Bool)

(assert (=> d!38152 (=> (not res!98651) (not e!78112))))

(declare-fun lt!184015 () (_ BitVec 64))

(declare-fun lt!184014 () (_ BitVec 64))

(declare-fun lt!184011 () (_ BitVec 64))

(assert (=> d!38152 (= res!98651 (= lt!184014 (bvsub lt!184011 lt!184015)))))

(assert (=> d!38152 (or (= (bvand lt!184011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184015 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184011 lt!184015) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!38152 (= lt!184015 (remainingBits!0 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183827)))) ((_ sign_extend 32) (currentByte!5501 (_2!5261 lt!183827))) ((_ sign_extend 32) (currentBit!5496 (_2!5261 lt!183827)))))))

(declare-fun lt!184010 () (_ BitVec 64))

(declare-fun lt!184013 () (_ BitVec 64))

(assert (=> d!38152 (= lt!184011 (bvmul lt!184010 lt!184013))))

(assert (=> d!38152 (or (= lt!184010 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184013 (bvsdiv (bvmul lt!184010 lt!184013) lt!184010)))))

(assert (=> d!38152 (= lt!184013 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38152 (= lt!184010 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183827)))))))

(assert (=> d!38152 (= lt!184014 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5501 (_2!5261 lt!183827))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5496 (_2!5261 lt!183827)))))))

(assert (=> d!38152 (invariant!0 (currentBit!5496 (_2!5261 lt!183827)) (currentByte!5501 (_2!5261 lt!183827)) (size!2418 (buf!2840 (_2!5261 lt!183827))))))

(assert (=> d!38152 (= (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183827))) (currentByte!5501 (_2!5261 lt!183827)) (currentBit!5496 (_2!5261 lt!183827))) lt!184014)))

(declare-fun b!119181 () Bool)

(declare-fun res!98652 () Bool)

(assert (=> b!119181 (=> (not res!98652) (not e!78112))))

(assert (=> b!119181 (= res!98652 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184014))))

(declare-fun b!119182 () Bool)

(declare-fun lt!184012 () (_ BitVec 64))

(assert (=> b!119182 (= e!78112 (bvsle lt!184014 (bvmul lt!184012 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119182 (or (= lt!184012 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184012 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184012)))))

(assert (=> b!119182 (= lt!184012 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183827)))))))

(assert (= (and d!38152 res!98651) b!119181))

(assert (= (and b!119181 res!98652) b!119182))

(declare-fun m!179383 () Bool)

(assert (=> d!38152 m!179383))

(declare-fun m!179385 () Bool)

(assert (=> d!38152 m!179385))

(assert (=> b!119111 d!38152))

(declare-fun d!38154 () Bool)

(declare-fun e!78113 () Bool)

(assert (=> d!38154 e!78113))

(declare-fun res!98653 () Bool)

(assert (=> d!38154 (=> (not res!98653) (not e!78113))))

(declare-fun lt!184016 () BitStream!4310)

(declare-fun lt!184017 () (_ BitVec 64))

(assert (=> d!38154 (= res!98653 (= (bvadd lt!184017 (bvsub (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)) (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183827))) (currentByte!5501 (_2!5261 lt!183827)) (currentBit!5496 (_2!5261 lt!183827))))) (bitIndex!0 (size!2418 (buf!2840 lt!184016)) (currentByte!5501 lt!184016) (currentBit!5496 lt!184016))))))

(assert (=> d!38154 (or (not (= (bvand lt!184017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)) (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183827))) (currentByte!5501 (_2!5261 lt!183827)) (currentBit!5496 (_2!5261 lt!183827)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!184017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!184017 (bvsub (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)) (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183827))) (currentByte!5501 (_2!5261 lt!183827)) (currentBit!5496 (_2!5261 lt!183827))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38154 (= lt!184017 (bitIndex!0 (size!2418 (buf!2840 (_2!5263 lt!183823))) (currentByte!5501 (_2!5263 lt!183823)) (currentBit!5496 (_2!5263 lt!183823))))))

(assert (=> d!38154 (= lt!184016 (_2!5261 (moveBitIndex!0 (_2!5263 lt!183823) (bvsub (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)) (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183827))) (currentByte!5501 (_2!5261 lt!183827)) (currentBit!5496 (_2!5261 lt!183827)))))))))

(assert (=> d!38154 (moveBitIndexPrecond!0 (_2!5263 lt!183823) (bvsub (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)) (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183827))) (currentByte!5501 (_2!5261 lt!183827)) (currentBit!5496 (_2!5261 lt!183827)))))))

(assert (=> d!38154 (= (withMovedBitIndex!0 (_2!5263 lt!183823) (bvsub (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)) (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183827))) (currentByte!5501 (_2!5261 lt!183827)) (currentBit!5496 (_2!5261 lt!183827))))) lt!184016)))

(declare-fun b!119183 () Bool)

(assert (=> b!119183 (= e!78113 (= (size!2418 (buf!2840 (_2!5263 lt!183823))) (size!2418 (buf!2840 lt!184016))))))

(assert (= (and d!38154 res!98653) b!119183))

(declare-fun m!179387 () Bool)

(assert (=> d!38154 m!179387))

(declare-fun m!179389 () Bool)

(assert (=> d!38154 m!179389))

(declare-fun m!179391 () Bool)

(assert (=> d!38154 m!179391))

(declare-fun m!179393 () Bool)

(assert (=> d!38154 m!179393))

(assert (=> b!119111 d!38154))

(declare-fun d!38156 () Bool)

(declare-fun e!78114 () Bool)

(assert (=> d!38156 e!78114))

(declare-fun res!98654 () Bool)

(assert (=> d!38156 (=> (not res!98654) (not e!78114))))

(declare-fun lt!184023 () (_ BitVec 64))

(declare-fun lt!184022 () (_ BitVec 64))

(declare-fun lt!184019 () (_ BitVec 64))

(assert (=> d!38156 (= res!98654 (= lt!184022 (bvsub lt!184019 lt!184023)))))

(assert (=> d!38156 (or (= (bvand lt!184019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184023 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184019 lt!184023) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38156 (= lt!184023 (remainingBits!0 ((_ sign_extend 32) (size!2418 (buf!2840 thiss!1305))) ((_ sign_extend 32) (currentByte!5501 thiss!1305)) ((_ sign_extend 32) (currentBit!5496 thiss!1305))))))

(declare-fun lt!184018 () (_ BitVec 64))

(declare-fun lt!184021 () (_ BitVec 64))

(assert (=> d!38156 (= lt!184019 (bvmul lt!184018 lt!184021))))

(assert (=> d!38156 (or (= lt!184018 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184021 (bvsdiv (bvmul lt!184018 lt!184021) lt!184018)))))

(assert (=> d!38156 (= lt!184021 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38156 (= lt!184018 ((_ sign_extend 32) (size!2418 (buf!2840 thiss!1305))))))

(assert (=> d!38156 (= lt!184022 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5501 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5496 thiss!1305))))))

(assert (=> d!38156 (invariant!0 (currentBit!5496 thiss!1305) (currentByte!5501 thiss!1305) (size!2418 (buf!2840 thiss!1305)))))

(assert (=> d!38156 (= (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)) lt!184022)))

(declare-fun b!119184 () Bool)

(declare-fun res!98655 () Bool)

(assert (=> b!119184 (=> (not res!98655) (not e!78114))))

(assert (=> b!119184 (= res!98655 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184022))))

(declare-fun b!119185 () Bool)

(declare-fun lt!184020 () (_ BitVec 64))

(assert (=> b!119185 (= e!78114 (bvsle lt!184022 (bvmul lt!184020 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119185 (or (= lt!184020 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184020 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184020)))))

(assert (=> b!119185 (= lt!184020 ((_ sign_extend 32) (size!2418 (buf!2840 thiss!1305))))))

(assert (= (and d!38156 res!98654) b!119184))

(assert (= (and b!119184 res!98655) b!119185))

(declare-fun m!179395 () Bool)

(assert (=> d!38156 m!179395))

(declare-fun m!179397 () Bool)

(assert (=> d!38156 m!179397))

(assert (=> b!119111 d!38156))

(declare-fun d!38158 () Bool)

(assert (=> d!38158 (= (invariant!0 (currentBit!5496 thiss!1305) (currentByte!5501 thiss!1305) (size!2418 (buf!2840 (_2!5261 lt!183827)))) (and (bvsge (currentBit!5496 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5496 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5501 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5501 thiss!1305) (size!2418 (buf!2840 (_2!5261 lt!183827)))) (and (= (currentBit!5496 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5501 thiss!1305) (size!2418 (buf!2840 (_2!5261 lt!183827))))))))))

(assert (=> b!119110 d!38158))

(declare-fun d!38160 () Bool)

(assert (=> d!38160 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5496 thiss!1305) (currentByte!5501 thiss!1305) (size!2418 (buf!2840 thiss!1305))))))

(declare-fun bs!9236 () Bool)

(assert (= bs!9236 d!38160))

(assert (=> bs!9236 m!179397))

(assert (=> start!23454 d!38160))

(declare-fun d!38162 () Bool)

(declare-fun e!78115 () Bool)

(assert (=> d!38162 e!78115))

(declare-fun res!98656 () Bool)

(assert (=> d!38162 (=> (not res!98656) (not e!78115))))

(declare-fun lt!184028 () (_ BitVec 64))

(declare-fun lt!184029 () (_ BitVec 64))

(declare-fun lt!184025 () (_ BitVec 64))

(assert (=> d!38162 (= res!98656 (= lt!184028 (bvsub lt!184025 lt!184029)))))

(assert (=> d!38162 (or (= (bvand lt!184025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184029 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184025 lt!184029) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38162 (= lt!184029 (remainingBits!0 ((_ sign_extend 32) (size!2418 (buf!2840 (_1!5262 lt!183816)))) ((_ sign_extend 32) (currentByte!5501 (_1!5262 lt!183816))) ((_ sign_extend 32) (currentBit!5496 (_1!5262 lt!183816)))))))

(declare-fun lt!184024 () (_ BitVec 64))

(declare-fun lt!184027 () (_ BitVec 64))

(assert (=> d!38162 (= lt!184025 (bvmul lt!184024 lt!184027))))

(assert (=> d!38162 (or (= lt!184024 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184027 (bvsdiv (bvmul lt!184024 lt!184027) lt!184024)))))

(assert (=> d!38162 (= lt!184027 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38162 (= lt!184024 ((_ sign_extend 32) (size!2418 (buf!2840 (_1!5262 lt!183816)))))))

(assert (=> d!38162 (= lt!184028 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5501 (_1!5262 lt!183816))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5496 (_1!5262 lt!183816)))))))

(assert (=> d!38162 (invariant!0 (currentBit!5496 (_1!5262 lt!183816)) (currentByte!5501 (_1!5262 lt!183816)) (size!2418 (buf!2840 (_1!5262 lt!183816))))))

(assert (=> d!38162 (= (bitIndex!0 (size!2418 (buf!2840 (_1!5262 lt!183816))) (currentByte!5501 (_1!5262 lt!183816)) (currentBit!5496 (_1!5262 lt!183816))) lt!184028)))

(declare-fun b!119186 () Bool)

(declare-fun res!98657 () Bool)

(assert (=> b!119186 (=> (not res!98657) (not e!78115))))

(assert (=> b!119186 (= res!98657 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184028))))

(declare-fun b!119187 () Bool)

(declare-fun lt!184026 () (_ BitVec 64))

(assert (=> b!119187 (= e!78115 (bvsle lt!184028 (bvmul lt!184026 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119187 (or (= lt!184026 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184026 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184026)))))

(assert (=> b!119187 (= lt!184026 ((_ sign_extend 32) (size!2418 (buf!2840 (_1!5262 lt!183816)))))))

(assert (= (and d!38162 res!98656) b!119186))

(assert (= (and b!119186 res!98657) b!119187))

(declare-fun m!179399 () Bool)

(assert (=> d!38162 m!179399))

(declare-fun m!179401 () Bool)

(assert (=> d!38162 m!179401))

(assert (=> b!119108 d!38162))

(declare-fun d!38164 () Bool)

(assert (=> d!38164 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!119119 d!38164))

(declare-fun d!38166 () Bool)

(assert (=> d!38166 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183827)))) ((_ sign_extend 32) (currentByte!5501 thiss!1305)) ((_ sign_extend 32) (currentBit!5496 thiss!1305)) lt!183814) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183827)))) ((_ sign_extend 32) (currentByte!5501 thiss!1305)) ((_ sign_extend 32) (currentBit!5496 thiss!1305))) lt!183814))))

(declare-fun bs!9237 () Bool)

(assert (= bs!9237 d!38166))

(declare-fun m!179403 () Bool)

(assert (=> bs!9237 m!179403))

(assert (=> b!119119 d!38166))

(declare-fun d!38168 () Bool)

(assert (=> d!38168 (validate_offset_bits!1 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183827)))) ((_ sign_extend 32) (currentByte!5501 thiss!1305)) ((_ sign_extend 32) (currentBit!5496 thiss!1305)) lt!183814)))

(declare-fun lt!184032 () Unit!7331)

(declare-fun choose!9 (BitStream!4310 array!5334 (_ BitVec 64) BitStream!4310) Unit!7331)

(assert (=> d!38168 (= lt!184032 (choose!9 thiss!1305 (buf!2840 (_2!5261 lt!183827)) lt!183814 (BitStream!4311 (buf!2840 (_2!5261 lt!183827)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305))))))

(assert (=> d!38168 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2840 (_2!5261 lt!183827)) lt!183814) lt!184032)))

(declare-fun bs!9238 () Bool)

(assert (= bs!9238 d!38168))

(assert (=> bs!9238 m!179239))

(declare-fun m!179405 () Bool)

(assert (=> bs!9238 m!179405))

(assert (=> b!119119 d!38168))

(declare-fun b!119198 () Bool)

(declare-fun e!78120 () Unit!7331)

(declare-fun lt!184086 () Unit!7331)

(assert (=> b!119198 (= e!78120 lt!184086)))

(declare-fun lt!184085 () (_ BitVec 64))

(assert (=> b!119198 (= lt!184085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184073 () (_ BitVec 64))

(assert (=> b!119198 (= lt!184073 (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5334 array!5334 (_ BitVec 64) (_ BitVec 64)) Unit!7331)

(assert (=> b!119198 (= lt!184086 (arrayBitRangesEqSymmetric!0 (buf!2840 thiss!1305) (buf!2840 (_2!5261 lt!183827)) lt!184085 lt!184073))))

(declare-fun arrayBitRangesEq!0 (array!5334 array!5334 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119198 (arrayBitRangesEq!0 (buf!2840 (_2!5261 lt!183827)) (buf!2840 thiss!1305) lt!184085 lt!184073)))

(declare-fun b!119199 () Bool)

(declare-fun res!98664 () Bool)

(declare-fun e!78121 () Bool)

(assert (=> b!119199 (=> (not res!98664) (not e!78121))))

(declare-fun lt!184091 () tuple2!9996)

(assert (=> b!119199 (= res!98664 (isPrefixOf!0 (_2!5263 lt!184091) (_2!5261 lt!183827)))))

(declare-fun lt!184077 () (_ BitVec 64))

(declare-fun b!119200 () Bool)

(declare-fun lt!184080 () (_ BitVec 64))

(assert (=> b!119200 (= e!78121 (= (_1!5263 lt!184091) (withMovedBitIndex!0 (_2!5263 lt!184091) (bvsub lt!184077 lt!184080))))))

(assert (=> b!119200 (or (= (bvand lt!184077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184080 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184077 lt!184080) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119200 (= lt!184080 (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183827))) (currentByte!5501 (_2!5261 lt!183827)) (currentBit!5496 (_2!5261 lt!183827))))))

(assert (=> b!119200 (= lt!184077 (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)))))

(declare-fun d!38170 () Bool)

(assert (=> d!38170 e!78121))

(declare-fun res!98666 () Bool)

(assert (=> d!38170 (=> (not res!98666) (not e!78121))))

(assert (=> d!38170 (= res!98666 (isPrefixOf!0 (_1!5263 lt!184091) (_2!5263 lt!184091)))))

(declare-fun lt!184076 () BitStream!4310)

(assert (=> d!38170 (= lt!184091 (tuple2!9997 lt!184076 (_2!5261 lt!183827)))))

(declare-fun lt!184081 () Unit!7331)

(declare-fun lt!184092 () Unit!7331)

(assert (=> d!38170 (= lt!184081 lt!184092)))

(assert (=> d!38170 (isPrefixOf!0 lt!184076 (_2!5261 lt!183827))))

(assert (=> d!38170 (= lt!184092 (lemmaIsPrefixTransitive!0 lt!184076 (_2!5261 lt!183827) (_2!5261 lt!183827)))))

(declare-fun lt!184079 () Unit!7331)

(declare-fun lt!184074 () Unit!7331)

(assert (=> d!38170 (= lt!184079 lt!184074)))

(assert (=> d!38170 (isPrefixOf!0 lt!184076 (_2!5261 lt!183827))))

(assert (=> d!38170 (= lt!184074 (lemmaIsPrefixTransitive!0 lt!184076 thiss!1305 (_2!5261 lt!183827)))))

(declare-fun lt!184075 () Unit!7331)

(assert (=> d!38170 (= lt!184075 e!78120)))

(declare-fun c!7157 () Bool)

(assert (=> d!38170 (= c!7157 (not (= (size!2418 (buf!2840 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!184083 () Unit!7331)

(declare-fun lt!184090 () Unit!7331)

(assert (=> d!38170 (= lt!184083 lt!184090)))

(assert (=> d!38170 (isPrefixOf!0 (_2!5261 lt!183827) (_2!5261 lt!183827))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4310) Unit!7331)

(assert (=> d!38170 (= lt!184090 (lemmaIsPrefixRefl!0 (_2!5261 lt!183827)))))

(declare-fun lt!184084 () Unit!7331)

(declare-fun lt!184088 () Unit!7331)

(assert (=> d!38170 (= lt!184084 lt!184088)))

(assert (=> d!38170 (= lt!184088 (lemmaIsPrefixRefl!0 (_2!5261 lt!183827)))))

(declare-fun lt!184089 () Unit!7331)

(declare-fun lt!184078 () Unit!7331)

(assert (=> d!38170 (= lt!184089 lt!184078)))

(assert (=> d!38170 (isPrefixOf!0 lt!184076 lt!184076)))

(assert (=> d!38170 (= lt!184078 (lemmaIsPrefixRefl!0 lt!184076))))

(declare-fun lt!184082 () Unit!7331)

(declare-fun lt!184087 () Unit!7331)

(assert (=> d!38170 (= lt!184082 lt!184087)))

(assert (=> d!38170 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!38170 (= lt!184087 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!38170 (= lt!184076 (BitStream!4311 (buf!2840 (_2!5261 lt!183827)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)))))

(assert (=> d!38170 (isPrefixOf!0 thiss!1305 (_2!5261 lt!183827))))

(assert (=> d!38170 (= (reader!0 thiss!1305 (_2!5261 lt!183827)) lt!184091)))

(declare-fun b!119201 () Bool)

(declare-fun res!98665 () Bool)

(assert (=> b!119201 (=> (not res!98665) (not e!78121))))

(assert (=> b!119201 (= res!98665 (isPrefixOf!0 (_1!5263 lt!184091) thiss!1305))))

(declare-fun b!119202 () Bool)

(declare-fun Unit!7341 () Unit!7331)

(assert (=> b!119202 (= e!78120 Unit!7341)))

(assert (= (and d!38170 c!7157) b!119198))

(assert (= (and d!38170 (not c!7157)) b!119202))

(assert (= (and d!38170 res!98666) b!119201))

(assert (= (and b!119201 res!98665) b!119199))

(assert (= (and b!119199 res!98664) b!119200))

(assert (=> b!119198 m!179203))

(declare-fun m!179407 () Bool)

(assert (=> b!119198 m!179407))

(declare-fun m!179409 () Bool)

(assert (=> b!119198 m!179409))

(declare-fun m!179411 () Bool)

(assert (=> b!119200 m!179411))

(assert (=> b!119200 m!179211))

(assert (=> b!119200 m!179203))

(declare-fun m!179413 () Bool)

(assert (=> b!119201 m!179413))

(declare-fun m!179415 () Bool)

(assert (=> b!119199 m!179415))

(declare-fun m!179417 () Bool)

(assert (=> d!38170 m!179417))

(declare-fun m!179419 () Bool)

(assert (=> d!38170 m!179419))

(declare-fun m!179421 () Bool)

(assert (=> d!38170 m!179421))

(declare-fun m!179423 () Bool)

(assert (=> d!38170 m!179423))

(declare-fun m!179425 () Bool)

(assert (=> d!38170 m!179425))

(declare-fun m!179427 () Bool)

(assert (=> d!38170 m!179427))

(declare-fun m!179429 () Bool)

(assert (=> d!38170 m!179429))

(assert (=> d!38170 m!179233))

(declare-fun m!179431 () Bool)

(assert (=> d!38170 m!179431))

(declare-fun m!179433 () Bool)

(assert (=> d!38170 m!179433))

(declare-fun m!179435 () Bool)

(assert (=> d!38170 m!179435))

(assert (=> b!119119 d!38170))

(declare-fun d!38172 () Bool)

(declare-fun e!78124 () Bool)

(assert (=> d!38172 e!78124))

(declare-fun res!98669 () Bool)

(assert (=> d!38172 (=> (not res!98669) (not e!78124))))

(declare-fun lt!184101 () tuple2!9994)

(declare-fun lt!184104 () tuple2!9994)

(assert (=> d!38172 (= res!98669 (= (bitIndex!0 (size!2418 (buf!2840 (_1!5262 lt!184101))) (currentByte!5501 (_1!5262 lt!184101)) (currentBit!5496 (_1!5262 lt!184101))) (bitIndex!0 (size!2418 (buf!2840 (_1!5262 lt!184104))) (currentByte!5501 (_1!5262 lt!184104)) (currentBit!5496 (_1!5262 lt!184104)))))))

(declare-fun lt!184103 () Unit!7331)

(declare-fun lt!184102 () BitStream!4310)

(declare-fun choose!50 (BitStream!4310 BitStream!4310 BitStream!4310 tuple2!9994 tuple2!9994 BitStream!4310 Bool tuple2!9994 tuple2!9994 BitStream!4310 Bool) Unit!7331)

(assert (=> d!38172 (= lt!184103 (choose!50 lt!183821 (_2!5261 lt!183827) lt!184102 lt!184101 (tuple2!9995 (_1!5262 lt!184101) (_2!5262 lt!184101)) (_1!5262 lt!184101) (_2!5262 lt!184101) lt!184104 (tuple2!9995 (_1!5262 lt!184104) (_2!5262 lt!184104)) (_1!5262 lt!184104) (_2!5262 lt!184104)))))

(assert (=> d!38172 (= lt!184104 (readBitPure!0 lt!184102))))

(assert (=> d!38172 (= lt!184101 (readBitPure!0 lt!183821))))

(assert (=> d!38172 (= lt!184102 (BitStream!4311 (buf!2840 (_2!5261 lt!183827)) (currentByte!5501 lt!183821) (currentBit!5496 lt!183821)))))

(assert (=> d!38172 (invariant!0 (currentBit!5496 lt!183821) (currentByte!5501 lt!183821) (size!2418 (buf!2840 (_2!5261 lt!183827))))))

(assert (=> d!38172 (= (readBitPrefixLemma!0 lt!183821 (_2!5261 lt!183827)) lt!184103)))

(declare-fun b!119205 () Bool)

(assert (=> b!119205 (= e!78124 (= (_2!5262 lt!184101) (_2!5262 lt!184104)))))

(assert (= (and d!38172 res!98669) b!119205))

(assert (=> d!38172 m!179241))

(declare-fun m!179437 () Bool)

(assert (=> d!38172 m!179437))

(declare-fun m!179439 () Bool)

(assert (=> d!38172 m!179439))

(declare-fun m!179441 () Bool)

(assert (=> d!38172 m!179441))

(declare-fun m!179443 () Bool)

(assert (=> d!38172 m!179443))

(declare-fun m!179445 () Bool)

(assert (=> d!38172 m!179445))

(assert (=> b!119119 d!38172))

(declare-fun d!38174 () Bool)

(declare-datatypes ((tuple2!10006 0))(
  ( (tuple2!10007 (_1!5268 Bool) (_2!5268 BitStream!4310)) )
))
(declare-fun lt!184107 () tuple2!10006)

(declare-fun readBit!0 (BitStream!4310) tuple2!10006)

(assert (=> d!38174 (= lt!184107 (readBit!0 lt!183821))))

(assert (=> d!38174 (= (readBitPure!0 lt!183821) (tuple2!9995 (_2!5268 lt!184107) (_1!5268 lt!184107)))))

(declare-fun bs!9239 () Bool)

(assert (= bs!9239 d!38174))

(declare-fun m!179447 () Bool)

(assert (=> bs!9239 m!179447))

(assert (=> b!119119 d!38174))

(declare-fun b!119218 () Bool)

(declare-fun e!78129 () Bool)

(declare-fun lt!184119 () tuple2!9994)

(declare-fun lt!184116 () tuple2!9992)

(assert (=> b!119218 (= e!78129 (= (bitIndex!0 (size!2418 (buf!2840 (_1!5262 lt!184119))) (currentByte!5501 (_1!5262 lt!184119)) (currentBit!5496 (_1!5262 lt!184119))) (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!184116))) (currentByte!5501 (_2!5261 lt!184116)) (currentBit!5496 (_2!5261 lt!184116)))))))

(declare-fun b!119216 () Bool)

(declare-fun res!98680 () Bool)

(declare-fun e!78130 () Bool)

(assert (=> b!119216 (=> (not res!98680) (not e!78130))))

(assert (=> b!119216 (= res!98680 (isPrefixOf!0 thiss!1305 (_2!5261 lt!184116)))))

(declare-fun b!119215 () Bool)

(declare-fun res!98681 () Bool)

(assert (=> b!119215 (=> (not res!98681) (not e!78130))))

(declare-fun lt!184117 () (_ BitVec 64))

(declare-fun lt!184118 () (_ BitVec 64))

(assert (=> b!119215 (= res!98681 (= (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!184116))) (currentByte!5501 (_2!5261 lt!184116)) (currentBit!5496 (_2!5261 lt!184116))) (bvadd lt!184117 lt!184118)))))

(assert (=> b!119215 (or (not (= (bvand lt!184117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184118 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!184117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!184117 lt!184118) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119215 (= lt!184118 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!119215 (= lt!184117 (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)))))

(declare-fun b!119217 () Bool)

(assert (=> b!119217 (= e!78130 e!78129)))

(declare-fun res!98679 () Bool)

(assert (=> b!119217 (=> (not res!98679) (not e!78129))))

(assert (=> b!119217 (= res!98679 (and (= (_2!5262 lt!184119) lt!183830) (= (_1!5262 lt!184119) (_2!5261 lt!184116))))))

(assert (=> b!119217 (= lt!184119 (readBitPure!0 (readerFrom!0 (_2!5261 lt!184116) (currentBit!5496 thiss!1305) (currentByte!5501 thiss!1305))))))

(declare-fun d!38176 () Bool)

(assert (=> d!38176 e!78130))

(declare-fun res!98678 () Bool)

(assert (=> d!38176 (=> (not res!98678) (not e!78130))))

(assert (=> d!38176 (= res!98678 (= (size!2418 (buf!2840 thiss!1305)) (size!2418 (buf!2840 (_2!5261 lt!184116)))))))

(declare-fun choose!16 (BitStream!4310 Bool) tuple2!9992)

(assert (=> d!38176 (= lt!184116 (choose!16 thiss!1305 lt!183830))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38176 (validate_offset_bit!0 ((_ sign_extend 32) (size!2418 (buf!2840 thiss!1305))) ((_ sign_extend 32) (currentByte!5501 thiss!1305)) ((_ sign_extend 32) (currentBit!5496 thiss!1305)))))

(assert (=> d!38176 (= (appendBit!0 thiss!1305 lt!183830) lt!184116)))

(assert (= (and d!38176 res!98678) b!119215))

(assert (= (and b!119215 res!98681) b!119216))

(assert (= (and b!119216 res!98680) b!119217))

(assert (= (and b!119217 res!98679) b!119218))

(declare-fun m!179449 () Bool)

(assert (=> b!119217 m!179449))

(assert (=> b!119217 m!179449))

(declare-fun m!179451 () Bool)

(assert (=> b!119217 m!179451))

(declare-fun m!179453 () Bool)

(assert (=> d!38176 m!179453))

(declare-fun m!179455 () Bool)

(assert (=> d!38176 m!179455))

(declare-fun m!179457 () Bool)

(assert (=> b!119215 m!179457))

(assert (=> b!119215 m!179203))

(declare-fun m!179459 () Bool)

(assert (=> b!119218 m!179459))

(assert (=> b!119218 m!179457))

(declare-fun m!179461 () Bool)

(assert (=> b!119216 m!179461))

(assert (=> b!119119 d!38176))

(declare-fun d!38178 () Bool)

(assert (=> d!38178 (isPrefixOf!0 thiss!1305 (_2!5261 lt!183827))))

(declare-fun lt!184122 () Unit!7331)

(declare-fun choose!30 (BitStream!4310 BitStream!4310 BitStream!4310) Unit!7331)

(assert (=> d!38178 (= lt!184122 (choose!30 thiss!1305 (_2!5261 lt!183817) (_2!5261 lt!183827)))))

(assert (=> d!38178 (isPrefixOf!0 thiss!1305 (_2!5261 lt!183817))))

(assert (=> d!38178 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5261 lt!183817) (_2!5261 lt!183827)) lt!184122)))

(declare-fun bs!9240 () Bool)

(assert (= bs!9240 d!38178))

(assert (=> bs!9240 m!179233))

(declare-fun m!179463 () Bool)

(assert (=> bs!9240 m!179463))

(assert (=> bs!9240 m!179221))

(assert (=> b!119119 d!38178))

(declare-fun d!38180 () Bool)

(declare-fun lt!184123 () tuple2!10006)

(assert (=> d!38180 (= lt!184123 (readBit!0 (_1!5263 lt!183823)))))

(assert (=> d!38180 (= (readBitPure!0 (_1!5263 lt!183823)) (tuple2!9995 (_2!5268 lt!184123) (_1!5268 lt!184123)))))

(declare-fun bs!9241 () Bool)

(assert (= bs!9241 d!38180))

(declare-fun m!179465 () Bool)

(assert (=> bs!9241 m!179465))

(assert (=> b!119119 d!38180))

(declare-fun b!119350 () Bool)

(declare-fun e!78207 () Bool)

(declare-fun lt!184561 () tuple2!9994)

(declare-fun lt!184542 () tuple2!9994)

(assert (=> b!119350 (= e!78207 (= (_2!5262 lt!184561) (_2!5262 lt!184542)))))

(declare-fun b!119351 () Bool)

(declare-fun e!78202 () tuple2!9992)

(declare-fun lt!184565 () tuple2!9992)

(declare-fun Unit!7342 () Unit!7331)

(assert (=> b!119351 (= e!78202 (tuple2!9993 Unit!7342 (_2!5261 lt!184565)))))

(declare-fun lt!184573 () Bool)

(assert (=> b!119351 (= lt!184573 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!184564 () tuple2!9992)

(assert (=> b!119351 (= lt!184564 (appendBit!0 (_2!5261 lt!183817) lt!184573))))

(declare-fun res!98794 () Bool)

(assert (=> b!119351 (= res!98794 (= (size!2418 (buf!2840 (_2!5261 lt!183817))) (size!2418 (buf!2840 (_2!5261 lt!184564)))))))

(declare-fun e!78203 () Bool)

(assert (=> b!119351 (=> (not res!98794) (not e!78203))))

(assert (=> b!119351 e!78203))

(declare-fun lt!184556 () tuple2!9992)

(assert (=> b!119351 (= lt!184556 lt!184564)))

(assert (=> b!119351 (= lt!184565 (appendNLeastSignificantBitsLoop!0 (_2!5261 lt!184556) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!184549 () Unit!7331)

(assert (=> b!119351 (= lt!184549 (lemmaIsPrefixTransitive!0 (_2!5261 lt!183817) (_2!5261 lt!184556) (_2!5261 lt!184565)))))

(declare-fun call!1550 () Bool)

(assert (=> b!119351 call!1550))

(declare-fun lt!184567 () Unit!7331)

(assert (=> b!119351 (= lt!184567 lt!184549)))

(assert (=> b!119351 (invariant!0 (currentBit!5496 (_2!5261 lt!183817)) (currentByte!5501 (_2!5261 lt!183817)) (size!2418 (buf!2840 (_2!5261 lt!184556))))))

(declare-fun lt!184560 () BitStream!4310)

(assert (=> b!119351 (= lt!184560 (BitStream!4311 (buf!2840 (_2!5261 lt!184556)) (currentByte!5501 (_2!5261 lt!183817)) (currentBit!5496 (_2!5261 lt!183817))))))

(assert (=> b!119351 (invariant!0 (currentBit!5496 lt!184560) (currentByte!5501 lt!184560) (size!2418 (buf!2840 (_2!5261 lt!184565))))))

(declare-fun lt!184538 () BitStream!4310)

(assert (=> b!119351 (= lt!184538 (BitStream!4311 (buf!2840 (_2!5261 lt!184565)) (currentByte!5501 lt!184560) (currentBit!5496 lt!184560)))))

(assert (=> b!119351 (= lt!184561 (readBitPure!0 lt!184560))))

(assert (=> b!119351 (= lt!184542 (readBitPure!0 lt!184538))))

(declare-fun lt!184569 () Unit!7331)

(assert (=> b!119351 (= lt!184569 (readBitPrefixLemma!0 lt!184560 (_2!5261 lt!184565)))))

(declare-fun res!98787 () Bool)

(assert (=> b!119351 (= res!98787 (= (bitIndex!0 (size!2418 (buf!2840 (_1!5262 lt!184561))) (currentByte!5501 (_1!5262 lt!184561)) (currentBit!5496 (_1!5262 lt!184561))) (bitIndex!0 (size!2418 (buf!2840 (_1!5262 lt!184542))) (currentByte!5501 (_1!5262 lt!184542)) (currentBit!5496 (_1!5262 lt!184542)))))))

(assert (=> b!119351 (=> (not res!98787) (not e!78207))))

(assert (=> b!119351 e!78207))

(declare-fun lt!184534 () Unit!7331)

(assert (=> b!119351 (= lt!184534 lt!184569)))

(declare-fun lt!184559 () tuple2!9996)

(assert (=> b!119351 (= lt!184559 (reader!0 (_2!5261 lt!183817) (_2!5261 lt!184565)))))

(declare-fun lt!184539 () tuple2!9996)

(assert (=> b!119351 (= lt!184539 (reader!0 (_2!5261 lt!184556) (_2!5261 lt!184565)))))

(declare-fun lt!184551 () tuple2!9994)

(assert (=> b!119351 (= lt!184551 (readBitPure!0 (_1!5263 lt!184559)))))

(assert (=> b!119351 (= (_2!5262 lt!184551) lt!184573)))

(declare-fun lt!184577 () Unit!7331)

(declare-fun Unit!7343 () Unit!7331)

(assert (=> b!119351 (= lt!184577 Unit!7343)))

(declare-fun lt!184543 () (_ BitVec 64))

(assert (=> b!119351 (= lt!184543 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!184552 () (_ BitVec 64))

(assert (=> b!119351 (= lt!184552 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!184547 () Unit!7331)

(assert (=> b!119351 (= lt!184547 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5261 lt!183817) (buf!2840 (_2!5261 lt!184565)) lt!184552))))

(assert (=> b!119351 (validate_offset_bits!1 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!184565)))) ((_ sign_extend 32) (currentByte!5501 (_2!5261 lt!183817))) ((_ sign_extend 32) (currentBit!5496 (_2!5261 lt!183817))) lt!184552)))

(declare-fun lt!184562 () Unit!7331)

(assert (=> b!119351 (= lt!184562 lt!184547)))

(declare-fun lt!184575 () tuple2!9998)

(assert (=> b!119351 (= lt!184575 (readNLeastSignificantBitsLoopPure!0 (_1!5263 lt!184559) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184543))))

(declare-fun lt!184548 () (_ BitVec 64))

(assert (=> b!119351 (= lt!184548 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!184563 () Unit!7331)

(assert (=> b!119351 (= lt!184563 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5261 lt!184556) (buf!2840 (_2!5261 lt!184565)) lt!184548))))

(assert (=> b!119351 (validate_offset_bits!1 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!184565)))) ((_ sign_extend 32) (currentByte!5501 (_2!5261 lt!184556))) ((_ sign_extend 32) (currentBit!5496 (_2!5261 lt!184556))) lt!184548)))

(declare-fun lt!184546 () Unit!7331)

(assert (=> b!119351 (= lt!184546 lt!184563)))

(declare-fun lt!184536 () tuple2!9998)

(assert (=> b!119351 (= lt!184536 (readNLeastSignificantBitsLoopPure!0 (_1!5263 lt!184539) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!184543 (ite (_2!5262 lt!184551) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!184578 () tuple2!9998)

(assert (=> b!119351 (= lt!184578 (readNLeastSignificantBitsLoopPure!0 (_1!5263 lt!184559) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184543))))

(declare-fun c!7171 () Bool)

(assert (=> b!119351 (= c!7171 (_2!5262 (readBitPure!0 (_1!5263 lt!184559))))))

(declare-fun lt!184535 () tuple2!9998)

(declare-fun e!78206 () (_ BitVec 64))

(assert (=> b!119351 (= lt!184535 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5263 lt!184559) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!184543 e!78206)))))

(declare-fun lt!184566 () Unit!7331)

(assert (=> b!119351 (= lt!184566 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5263 lt!184559) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184543))))

(assert (=> b!119351 (and (= (_2!5264 lt!184578) (_2!5264 lt!184535)) (= (_1!5264 lt!184578) (_1!5264 lt!184535)))))

(declare-fun lt!184571 () Unit!7331)

(assert (=> b!119351 (= lt!184571 lt!184566)))

(assert (=> b!119351 (= (_1!5263 lt!184559) (withMovedBitIndex!0 (_2!5263 lt!184559) (bvsub (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183817))) (currentByte!5501 (_2!5261 lt!183817)) (currentBit!5496 (_2!5261 lt!183817))) (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!184565))) (currentByte!5501 (_2!5261 lt!184565)) (currentBit!5496 (_2!5261 lt!184565))))))))

(declare-fun lt!184572 () Unit!7331)

(declare-fun Unit!7344 () Unit!7331)

(assert (=> b!119351 (= lt!184572 Unit!7344)))

(assert (=> b!119351 (= (_1!5263 lt!184539) (withMovedBitIndex!0 (_2!5263 lt!184539) (bvsub (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!184556))) (currentByte!5501 (_2!5261 lt!184556)) (currentBit!5496 (_2!5261 lt!184556))) (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!184565))) (currentByte!5501 (_2!5261 lt!184565)) (currentBit!5496 (_2!5261 lt!184565))))))))

(declare-fun lt!184557 () Unit!7331)

(declare-fun Unit!7345 () Unit!7331)

(assert (=> b!119351 (= lt!184557 Unit!7345)))

(assert (=> b!119351 (= (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183817))) (currentByte!5501 (_2!5261 lt!183817)) (currentBit!5496 (_2!5261 lt!183817))) (bvsub (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!184556))) (currentByte!5501 (_2!5261 lt!184556)) (currentBit!5496 (_2!5261 lt!184556))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!184540 () Unit!7331)

(declare-fun Unit!7346 () Unit!7331)

(assert (=> b!119351 (= lt!184540 Unit!7346)))

(assert (=> b!119351 (= (_2!5264 lt!184575) (_2!5264 lt!184536))))

(declare-fun lt!184574 () Unit!7331)

(declare-fun Unit!7347 () Unit!7331)

(assert (=> b!119351 (= lt!184574 Unit!7347)))

(assert (=> b!119351 (= (_1!5264 lt!184575) (_2!5263 lt!184559))))

(declare-fun b!119352 () Bool)

(declare-fun res!98793 () Bool)

(declare-fun e!78208 () Bool)

(assert (=> b!119352 (=> (not res!98793) (not e!78208))))

(declare-fun lt!184541 () tuple2!9992)

(declare-fun lt!184545 () (_ BitVec 64))

(declare-fun lt!184553 () (_ BitVec 64))

(assert (=> b!119352 (= res!98793 (= (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!184541))) (currentByte!5501 (_2!5261 lt!184541)) (currentBit!5496 (_2!5261 lt!184541))) (bvadd lt!184545 lt!184553)))))

(assert (=> b!119352 (or (not (= (bvand lt!184545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184553 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!184545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!184545 lt!184553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119352 (= lt!184553 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!119352 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119352 (= lt!184545 (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183817))) (currentByte!5501 (_2!5261 lt!183817)) (currentBit!5496 (_2!5261 lt!183817))))))

(declare-fun b!119353 () Bool)

(declare-fun lt!184537 () Unit!7331)

(assert (=> b!119353 (= e!78202 (tuple2!9993 lt!184537 (_2!5261 lt!183817)))))

(declare-fun lt!184576 () BitStream!4310)

(assert (=> b!119353 (= lt!184576 (_2!5261 lt!183817))))

(assert (=> b!119353 (= lt!184537 (lemmaIsPrefixRefl!0 lt!184576))))

(assert (=> b!119353 call!1550))

(declare-fun c!7172 () Bool)

(declare-fun bm!1547 () Bool)

(assert (=> bm!1547 (= call!1550 (isPrefixOf!0 (ite c!7172 (_2!5261 lt!183817) lt!184576) (ite c!7172 (_2!5261 lt!184565) lt!184576)))))

(declare-fun b!119354 () Bool)

(declare-fun e!78204 () Bool)

(declare-fun lt!184554 () tuple2!9994)

(assert (=> b!119354 (= e!78204 (= (bitIndex!0 (size!2418 (buf!2840 (_1!5262 lt!184554))) (currentByte!5501 (_1!5262 lt!184554)) (currentBit!5496 (_1!5262 lt!184554))) (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!184564))) (currentByte!5501 (_2!5261 lt!184564)) (currentBit!5496 (_2!5261 lt!184564)))))))

(declare-fun b!119355 () Bool)

(declare-fun res!98792 () Bool)

(assert (=> b!119355 (= res!98792 (= (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!184564))) (currentByte!5501 (_2!5261 lt!184564)) (currentBit!5496 (_2!5261 lt!184564))) (bvadd (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183817))) (currentByte!5501 (_2!5261 lt!183817)) (currentBit!5496 (_2!5261 lt!183817))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!119355 (=> (not res!98792) (not e!78203))))

(declare-fun b!119356 () Bool)

(assert (=> b!119356 (= e!78206 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184570 () tuple2!9996)

(declare-fun lt!184544 () tuple2!9998)

(declare-fun b!119357 () Bool)

(assert (=> b!119357 (= e!78208 (and (= (_2!5264 lt!184544) v!199) (= (_1!5264 lt!184544) (_2!5263 lt!184570))))))

(declare-fun lt!184568 () (_ BitVec 64))

(assert (=> b!119357 (= lt!184544 (readNLeastSignificantBitsLoopPure!0 (_1!5263 lt!184570) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184568))))

(declare-fun lt!184550 () Unit!7331)

(declare-fun lt!184558 () Unit!7331)

(assert (=> b!119357 (= lt!184550 lt!184558)))

(declare-fun lt!184555 () (_ BitVec 64))

(assert (=> b!119357 (validate_offset_bits!1 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!184541)))) ((_ sign_extend 32) (currentByte!5501 (_2!5261 lt!183817))) ((_ sign_extend 32) (currentBit!5496 (_2!5261 lt!183817))) lt!184555)))

(assert (=> b!119357 (= lt!184558 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5261 lt!183817) (buf!2840 (_2!5261 lt!184541)) lt!184555))))

(declare-fun e!78205 () Bool)

(assert (=> b!119357 e!78205))

(declare-fun res!98789 () Bool)

(assert (=> b!119357 (=> (not res!98789) (not e!78205))))

(assert (=> b!119357 (= res!98789 (and (= (size!2418 (buf!2840 (_2!5261 lt!183817))) (size!2418 (buf!2840 (_2!5261 lt!184541)))) (bvsge lt!184555 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119357 (= lt!184555 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!119357 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119357 (= lt!184568 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!119357 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119357 (= lt!184570 (reader!0 (_2!5261 lt!183817) (_2!5261 lt!184541)))))

(declare-fun d!38182 () Bool)

(assert (=> d!38182 e!78208))

(declare-fun res!98790 () Bool)

(assert (=> d!38182 (=> (not res!98790) (not e!78208))))

(assert (=> d!38182 (= res!98790 (= (size!2418 (buf!2840 (_2!5261 lt!183817))) (size!2418 (buf!2840 (_2!5261 lt!184541)))))))

(assert (=> d!38182 (= lt!184541 e!78202)))

(assert (=> d!38182 (= c!7172 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!38182 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!38182 (= (appendNLeastSignificantBitsLoop!0 (_2!5261 lt!183817) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!184541)))

(declare-fun b!119358 () Bool)

(assert (=> b!119358 (= lt!184554 (readBitPure!0 (readerFrom!0 (_2!5261 lt!184564) (currentBit!5496 (_2!5261 lt!183817)) (currentByte!5501 (_2!5261 lt!183817)))))))

(declare-fun res!98788 () Bool)

(assert (=> b!119358 (= res!98788 (and (= (_2!5262 lt!184554) lt!184573) (= (_1!5262 lt!184554) (_2!5261 lt!184564))))))

(assert (=> b!119358 (=> (not res!98788) (not e!78204))))

(assert (=> b!119358 (= e!78203 e!78204)))

(declare-fun b!119359 () Bool)

(declare-fun res!98795 () Bool)

(assert (=> b!119359 (=> (not res!98795) (not e!78208))))

(assert (=> b!119359 (= res!98795 (isPrefixOf!0 (_2!5261 lt!183817) (_2!5261 lt!184541)))))

(declare-fun b!119360 () Bool)

(assert (=> b!119360 (= e!78205 (validate_offset_bits!1 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183817)))) ((_ sign_extend 32) (currentByte!5501 (_2!5261 lt!183817))) ((_ sign_extend 32) (currentBit!5496 (_2!5261 lt!183817))) lt!184555))))

(declare-fun b!119361 () Bool)

(assert (=> b!119361 (= e!78206 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!119362 () Bool)

(declare-fun res!98791 () Bool)

(assert (=> b!119362 (= res!98791 (isPrefixOf!0 (_2!5261 lt!183817) (_2!5261 lt!184564)))))

(assert (=> b!119362 (=> (not res!98791) (not e!78203))))

(assert (= (and d!38182 c!7172) b!119351))

(assert (= (and d!38182 (not c!7172)) b!119353))

(assert (= (and b!119351 res!98794) b!119355))

(assert (= (and b!119355 res!98792) b!119362))

(assert (= (and b!119362 res!98791) b!119358))

(assert (= (and b!119358 res!98788) b!119354))

(assert (= (and b!119351 res!98787) b!119350))

(assert (= (and b!119351 c!7171) b!119361))

(assert (= (and b!119351 (not c!7171)) b!119356))

(assert (= (or b!119351 b!119353) bm!1547))

(assert (= (and d!38182 res!98790) b!119352))

(assert (= (and b!119352 res!98793) b!119359))

(assert (= (and b!119359 res!98795) b!119357))

(assert (= (and b!119357 res!98789) b!119360))

(declare-fun m!179677 () Bool)

(assert (=> b!119362 m!179677))

(declare-fun m!179679 () Bool)

(assert (=> bm!1547 m!179679))

(declare-fun m!179681 () Bool)

(assert (=> b!119353 m!179681))

(declare-fun m!179683 () Bool)

(assert (=> b!119354 m!179683))

(declare-fun m!179685 () Bool)

(assert (=> b!119354 m!179685))

(assert (=> b!119355 m!179685))

(assert (=> b!119355 m!179201))

(declare-fun m!179687 () Bool)

(assert (=> b!119359 m!179687))

(declare-fun m!179689 () Bool)

(assert (=> b!119360 m!179689))

(declare-fun m!179691 () Bool)

(assert (=> b!119351 m!179691))

(declare-fun m!179693 () Bool)

(assert (=> b!119351 m!179693))

(declare-fun m!179695 () Bool)

(assert (=> b!119351 m!179695))

(declare-fun m!179697 () Bool)

(assert (=> b!119351 m!179697))

(declare-fun m!179699 () Bool)

(assert (=> b!119351 m!179699))

(declare-fun m!179701 () Bool)

(assert (=> b!119351 m!179701))

(declare-fun m!179703 () Bool)

(assert (=> b!119351 m!179703))

(declare-fun m!179705 () Bool)

(assert (=> b!119351 m!179705))

(declare-fun m!179707 () Bool)

(assert (=> b!119351 m!179707))

(declare-fun m!179709 () Bool)

(assert (=> b!119351 m!179709))

(declare-fun m!179711 () Bool)

(assert (=> b!119351 m!179711))

(declare-fun m!179713 () Bool)

(assert (=> b!119351 m!179713))

(declare-fun m!179715 () Bool)

(assert (=> b!119351 m!179715))

(declare-fun m!179717 () Bool)

(assert (=> b!119351 m!179717))

(declare-fun m!179719 () Bool)

(assert (=> b!119351 m!179719))

(declare-fun m!179721 () Bool)

(assert (=> b!119351 m!179721))

(declare-fun m!179723 () Bool)

(assert (=> b!119351 m!179723))

(declare-fun m!179725 () Bool)

(assert (=> b!119351 m!179725))

(declare-fun m!179727 () Bool)

(assert (=> b!119351 m!179727))

(declare-fun m!179729 () Bool)

(assert (=> b!119351 m!179729))

(declare-fun m!179731 () Bool)

(assert (=> b!119351 m!179731))

(assert (=> b!119351 m!179201))

(declare-fun m!179733 () Bool)

(assert (=> b!119351 m!179733))

(declare-fun m!179735 () Bool)

(assert (=> b!119351 m!179735))

(assert (=> b!119351 m!179711))

(declare-fun m!179737 () Bool)

(assert (=> b!119351 m!179737))

(declare-fun m!179739 () Bool)

(assert (=> b!119351 m!179739))

(declare-fun m!179741 () Bool)

(assert (=> b!119351 m!179741))

(declare-fun m!179743 () Bool)

(assert (=> b!119351 m!179743))

(assert (=> b!119357 m!179691))

(declare-fun m!179745 () Bool)

(assert (=> b!119357 m!179745))

(declare-fun m!179747 () Bool)

(assert (=> b!119357 m!179747))

(declare-fun m!179749 () Bool)

(assert (=> b!119357 m!179749))

(declare-fun m!179751 () Bool)

(assert (=> b!119357 m!179751))

(declare-fun m!179753 () Bool)

(assert (=> b!119358 m!179753))

(assert (=> b!119358 m!179753))

(declare-fun m!179755 () Bool)

(assert (=> b!119358 m!179755))

(declare-fun m!179757 () Bool)

(assert (=> b!119352 m!179757))

(assert (=> b!119352 m!179201))

(assert (=> b!119119 d!38182))

(declare-fun d!38258 () Bool)

(declare-fun e!78209 () Bool)

(assert (=> d!38258 e!78209))

(declare-fun res!98796 () Bool)

(assert (=> d!38258 (=> (not res!98796) (not e!78209))))

(declare-fun lt!184583 () (_ BitVec 64))

(declare-fun lt!184580 () (_ BitVec 64))

(declare-fun lt!184584 () (_ BitVec 64))

(assert (=> d!38258 (= res!98796 (= lt!184583 (bvsub lt!184580 lt!184584)))))

(assert (=> d!38258 (or (= (bvand lt!184580 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184584 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184580 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184580 lt!184584) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38258 (= lt!184584 (remainingBits!0 ((_ sign_extend 32) (size!2418 (buf!2840 (_1!5262 lt!183835)))) ((_ sign_extend 32) (currentByte!5501 (_1!5262 lt!183835))) ((_ sign_extend 32) (currentBit!5496 (_1!5262 lt!183835)))))))

(declare-fun lt!184579 () (_ BitVec 64))

(declare-fun lt!184582 () (_ BitVec 64))

(assert (=> d!38258 (= lt!184580 (bvmul lt!184579 lt!184582))))

(assert (=> d!38258 (or (= lt!184579 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184582 (bvsdiv (bvmul lt!184579 lt!184582) lt!184579)))))

(assert (=> d!38258 (= lt!184582 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38258 (= lt!184579 ((_ sign_extend 32) (size!2418 (buf!2840 (_1!5262 lt!183835)))))))

(assert (=> d!38258 (= lt!184583 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5501 (_1!5262 lt!183835))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5496 (_1!5262 lt!183835)))))))

(assert (=> d!38258 (invariant!0 (currentBit!5496 (_1!5262 lt!183835)) (currentByte!5501 (_1!5262 lt!183835)) (size!2418 (buf!2840 (_1!5262 lt!183835))))))

(assert (=> d!38258 (= (bitIndex!0 (size!2418 (buf!2840 (_1!5262 lt!183835))) (currentByte!5501 (_1!5262 lt!183835)) (currentBit!5496 (_1!5262 lt!183835))) lt!184583)))

(declare-fun b!119363 () Bool)

(declare-fun res!98797 () Bool)

(assert (=> b!119363 (=> (not res!98797) (not e!78209))))

(assert (=> b!119363 (= res!98797 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184583))))

(declare-fun b!119364 () Bool)

(declare-fun lt!184581 () (_ BitVec 64))

(assert (=> b!119364 (= e!78209 (bvsle lt!184583 (bvmul lt!184581 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119364 (or (= lt!184581 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184581 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184581)))))

(assert (=> b!119364 (= lt!184581 ((_ sign_extend 32) (size!2418 (buf!2840 (_1!5262 lt!183835)))))))

(assert (= (and d!38258 res!98796) b!119363))

(assert (= (and b!119363 res!98797) b!119364))

(declare-fun m!179759 () Bool)

(assert (=> d!38258 m!179759))

(declare-fun m!179761 () Bool)

(assert (=> d!38258 m!179761))

(assert (=> b!119119 d!38258))

(declare-fun d!38260 () Bool)

(declare-fun res!98804 () Bool)

(declare-fun e!78214 () Bool)

(assert (=> d!38260 (=> (not res!98804) (not e!78214))))

(assert (=> d!38260 (= res!98804 (= (size!2418 (buf!2840 thiss!1305)) (size!2418 (buf!2840 (_2!5261 lt!183827)))))))

(assert (=> d!38260 (= (isPrefixOf!0 thiss!1305 (_2!5261 lt!183827)) e!78214)))

(declare-fun b!119371 () Bool)

(declare-fun res!98806 () Bool)

(assert (=> b!119371 (=> (not res!98806) (not e!78214))))

(assert (=> b!119371 (= res!98806 (bvsle (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)) (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183827))) (currentByte!5501 (_2!5261 lt!183827)) (currentBit!5496 (_2!5261 lt!183827)))))))

(declare-fun b!119372 () Bool)

(declare-fun e!78215 () Bool)

(assert (=> b!119372 (= e!78214 e!78215)))

(declare-fun res!98805 () Bool)

(assert (=> b!119372 (=> res!98805 e!78215)))

(assert (=> b!119372 (= res!98805 (= (size!2418 (buf!2840 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!119373 () Bool)

(assert (=> b!119373 (= e!78215 (arrayBitRangesEq!0 (buf!2840 thiss!1305) (buf!2840 (_2!5261 lt!183827)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305))))))

(assert (= (and d!38260 res!98804) b!119371))

(assert (= (and b!119371 res!98806) b!119372))

(assert (= (and b!119372 (not res!98805)) b!119373))

(assert (=> b!119371 m!179203))

(assert (=> b!119371 m!179211))

(assert (=> b!119373 m!179203))

(assert (=> b!119373 m!179203))

(declare-fun m!179763 () Bool)

(assert (=> b!119373 m!179763))

(assert (=> b!119119 d!38260))

(declare-fun d!38262 () Bool)

(declare-fun lt!184585 () tuple2!10006)

(assert (=> d!38262 (= lt!184585 (readBit!0 (BitStream!4311 (buf!2840 (_2!5261 lt!183827)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305))))))

(assert (=> d!38262 (= (readBitPure!0 (BitStream!4311 (buf!2840 (_2!5261 lt!183827)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305))) (tuple2!9995 (_2!5268 lt!184585) (_1!5268 lt!184585)))))

(declare-fun bs!9259 () Bool)

(assert (= bs!9259 d!38262))

(declare-fun m!179765 () Bool)

(assert (=> bs!9259 m!179765))

(assert (=> b!119119 d!38262))

(declare-fun d!38264 () Bool)

(assert (=> d!38264 (validate_offset_bits!1 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183827)))) ((_ sign_extend 32) (currentByte!5501 (_2!5261 lt!183817))) ((_ sign_extend 32) (currentBit!5496 (_2!5261 lt!183817))) lt!183826)))

(declare-fun lt!184586 () Unit!7331)

(assert (=> d!38264 (= lt!184586 (choose!9 (_2!5261 lt!183817) (buf!2840 (_2!5261 lt!183827)) lt!183826 (BitStream!4311 (buf!2840 (_2!5261 lt!183827)) (currentByte!5501 (_2!5261 lt!183817)) (currentBit!5496 (_2!5261 lt!183817)))))))

(assert (=> d!38264 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5261 lt!183817) (buf!2840 (_2!5261 lt!183827)) lt!183826) lt!184586)))

(declare-fun bs!9260 () Bool)

(assert (= bs!9260 d!38264))

(assert (=> bs!9260 m!179259))

(declare-fun m!179767 () Bool)

(assert (=> bs!9260 m!179767))

(assert (=> b!119119 d!38264))

(declare-fun d!38266 () Bool)

(assert (=> d!38266 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183827)))) ((_ sign_extend 32) (currentByte!5501 (_2!5261 lt!183817))) ((_ sign_extend 32) (currentBit!5496 (_2!5261 lt!183817))) lt!183826) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183827)))) ((_ sign_extend 32) (currentByte!5501 (_2!5261 lt!183817))) ((_ sign_extend 32) (currentBit!5496 (_2!5261 lt!183817)))) lt!183826))))

(declare-fun bs!9261 () Bool)

(assert (= bs!9261 d!38266))

(declare-fun m!179769 () Bool)

(assert (=> bs!9261 m!179769))

(assert (=> b!119119 d!38266))

(declare-fun d!38268 () Bool)

(declare-fun e!78216 () Bool)

(assert (=> d!38268 e!78216))

(declare-fun res!98807 () Bool)

(assert (=> d!38268 (=> (not res!98807) (not e!78216))))

(declare-fun lt!184591 () (_ BitVec 64))

(declare-fun lt!184592 () (_ BitVec 64))

(declare-fun lt!184588 () (_ BitVec 64))

(assert (=> d!38268 (= res!98807 (= lt!184591 (bvsub lt!184588 lt!184592)))))

(assert (=> d!38268 (or (= (bvand lt!184588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184592 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184588 lt!184592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38268 (= lt!184592 (remainingBits!0 ((_ sign_extend 32) (size!2418 (buf!2840 (_1!5262 lt!183819)))) ((_ sign_extend 32) (currentByte!5501 (_1!5262 lt!183819))) ((_ sign_extend 32) (currentBit!5496 (_1!5262 lt!183819)))))))

(declare-fun lt!184587 () (_ BitVec 64))

(declare-fun lt!184590 () (_ BitVec 64))

(assert (=> d!38268 (= lt!184588 (bvmul lt!184587 lt!184590))))

(assert (=> d!38268 (or (= lt!184587 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184590 (bvsdiv (bvmul lt!184587 lt!184590) lt!184587)))))

(assert (=> d!38268 (= lt!184590 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38268 (= lt!184587 ((_ sign_extend 32) (size!2418 (buf!2840 (_1!5262 lt!183819)))))))

(assert (=> d!38268 (= lt!184591 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5501 (_1!5262 lt!183819))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5496 (_1!5262 lt!183819)))))))

(assert (=> d!38268 (invariant!0 (currentBit!5496 (_1!5262 lt!183819)) (currentByte!5501 (_1!5262 lt!183819)) (size!2418 (buf!2840 (_1!5262 lt!183819))))))

(assert (=> d!38268 (= (bitIndex!0 (size!2418 (buf!2840 (_1!5262 lt!183819))) (currentByte!5501 (_1!5262 lt!183819)) (currentBit!5496 (_1!5262 lt!183819))) lt!184591)))

(declare-fun b!119374 () Bool)

(declare-fun res!98808 () Bool)

(assert (=> b!119374 (=> (not res!98808) (not e!78216))))

(assert (=> b!119374 (= res!98808 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184591))))

(declare-fun b!119375 () Bool)

(declare-fun lt!184589 () (_ BitVec 64))

(assert (=> b!119375 (= e!78216 (bvsle lt!184591 (bvmul lt!184589 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119375 (or (= lt!184589 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184589 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184589)))))

(assert (=> b!119375 (= lt!184589 ((_ sign_extend 32) (size!2418 (buf!2840 (_1!5262 lt!183819)))))))

(assert (= (and d!38268 res!98807) b!119374))

(assert (= (and b!119374 res!98808) b!119375))

(declare-fun m!179771 () Bool)

(assert (=> d!38268 m!179771))

(declare-fun m!179773 () Bool)

(assert (=> d!38268 m!179773))

(assert (=> b!119119 d!38268))

(declare-fun b!119376 () Bool)

(declare-fun e!78217 () Unit!7331)

(declare-fun lt!184606 () Unit!7331)

(assert (=> b!119376 (= e!78217 lt!184606)))

(declare-fun lt!184605 () (_ BitVec 64))

(assert (=> b!119376 (= lt!184605 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184593 () (_ BitVec 64))

(assert (=> b!119376 (= lt!184593 (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183817))) (currentByte!5501 (_2!5261 lt!183817)) (currentBit!5496 (_2!5261 lt!183817))))))

(assert (=> b!119376 (= lt!184606 (arrayBitRangesEqSymmetric!0 (buf!2840 (_2!5261 lt!183817)) (buf!2840 (_2!5261 lt!183827)) lt!184605 lt!184593))))

(assert (=> b!119376 (arrayBitRangesEq!0 (buf!2840 (_2!5261 lt!183827)) (buf!2840 (_2!5261 lt!183817)) lt!184605 lt!184593)))

(declare-fun b!119377 () Bool)

(declare-fun res!98809 () Bool)

(declare-fun e!78218 () Bool)

(assert (=> b!119377 (=> (not res!98809) (not e!78218))))

(declare-fun lt!184611 () tuple2!9996)

(assert (=> b!119377 (= res!98809 (isPrefixOf!0 (_2!5263 lt!184611) (_2!5261 lt!183827)))))

(declare-fun b!119378 () Bool)

(declare-fun lt!184597 () (_ BitVec 64))

(declare-fun lt!184600 () (_ BitVec 64))

(assert (=> b!119378 (= e!78218 (= (_1!5263 lt!184611) (withMovedBitIndex!0 (_2!5263 lt!184611) (bvsub lt!184597 lt!184600))))))

(assert (=> b!119378 (or (= (bvand lt!184597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184600 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184597 lt!184600) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119378 (= lt!184600 (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183827))) (currentByte!5501 (_2!5261 lt!183827)) (currentBit!5496 (_2!5261 lt!183827))))))

(assert (=> b!119378 (= lt!184597 (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183817))) (currentByte!5501 (_2!5261 lt!183817)) (currentBit!5496 (_2!5261 lt!183817))))))

(declare-fun d!38270 () Bool)

(assert (=> d!38270 e!78218))

(declare-fun res!98811 () Bool)

(assert (=> d!38270 (=> (not res!98811) (not e!78218))))

(assert (=> d!38270 (= res!98811 (isPrefixOf!0 (_1!5263 lt!184611) (_2!5263 lt!184611)))))

(declare-fun lt!184596 () BitStream!4310)

(assert (=> d!38270 (= lt!184611 (tuple2!9997 lt!184596 (_2!5261 lt!183827)))))

(declare-fun lt!184601 () Unit!7331)

(declare-fun lt!184612 () Unit!7331)

(assert (=> d!38270 (= lt!184601 lt!184612)))

(assert (=> d!38270 (isPrefixOf!0 lt!184596 (_2!5261 lt!183827))))

(assert (=> d!38270 (= lt!184612 (lemmaIsPrefixTransitive!0 lt!184596 (_2!5261 lt!183827) (_2!5261 lt!183827)))))

(declare-fun lt!184599 () Unit!7331)

(declare-fun lt!184594 () Unit!7331)

(assert (=> d!38270 (= lt!184599 lt!184594)))

(assert (=> d!38270 (isPrefixOf!0 lt!184596 (_2!5261 lt!183827))))

(assert (=> d!38270 (= lt!184594 (lemmaIsPrefixTransitive!0 lt!184596 (_2!5261 lt!183817) (_2!5261 lt!183827)))))

(declare-fun lt!184595 () Unit!7331)

(assert (=> d!38270 (= lt!184595 e!78217)))

(declare-fun c!7173 () Bool)

(assert (=> d!38270 (= c!7173 (not (= (size!2418 (buf!2840 (_2!5261 lt!183817))) #b00000000000000000000000000000000)))))

(declare-fun lt!184603 () Unit!7331)

(declare-fun lt!184610 () Unit!7331)

(assert (=> d!38270 (= lt!184603 lt!184610)))

(assert (=> d!38270 (isPrefixOf!0 (_2!5261 lt!183827) (_2!5261 lt!183827))))

(assert (=> d!38270 (= lt!184610 (lemmaIsPrefixRefl!0 (_2!5261 lt!183827)))))

(declare-fun lt!184604 () Unit!7331)

(declare-fun lt!184608 () Unit!7331)

(assert (=> d!38270 (= lt!184604 lt!184608)))

(assert (=> d!38270 (= lt!184608 (lemmaIsPrefixRefl!0 (_2!5261 lt!183827)))))

(declare-fun lt!184609 () Unit!7331)

(declare-fun lt!184598 () Unit!7331)

(assert (=> d!38270 (= lt!184609 lt!184598)))

(assert (=> d!38270 (isPrefixOf!0 lt!184596 lt!184596)))

(assert (=> d!38270 (= lt!184598 (lemmaIsPrefixRefl!0 lt!184596))))

(declare-fun lt!184602 () Unit!7331)

(declare-fun lt!184607 () Unit!7331)

(assert (=> d!38270 (= lt!184602 lt!184607)))

(assert (=> d!38270 (isPrefixOf!0 (_2!5261 lt!183817) (_2!5261 lt!183817))))

(assert (=> d!38270 (= lt!184607 (lemmaIsPrefixRefl!0 (_2!5261 lt!183817)))))

(assert (=> d!38270 (= lt!184596 (BitStream!4311 (buf!2840 (_2!5261 lt!183827)) (currentByte!5501 (_2!5261 lt!183817)) (currentBit!5496 (_2!5261 lt!183817))))))

(assert (=> d!38270 (isPrefixOf!0 (_2!5261 lt!183817) (_2!5261 lt!183827))))

(assert (=> d!38270 (= (reader!0 (_2!5261 lt!183817) (_2!5261 lt!183827)) lt!184611)))

(declare-fun b!119379 () Bool)

(declare-fun res!98810 () Bool)

(assert (=> b!119379 (=> (not res!98810) (not e!78218))))

(assert (=> b!119379 (= res!98810 (isPrefixOf!0 (_1!5263 lt!184611) (_2!5261 lt!183817)))))

(declare-fun b!119380 () Bool)

(declare-fun Unit!7348 () Unit!7331)

(assert (=> b!119380 (= e!78217 Unit!7348)))

(assert (= (and d!38270 c!7173) b!119376))

(assert (= (and d!38270 (not c!7173)) b!119380))

(assert (= (and d!38270 res!98811) b!119379))

(assert (= (and b!119379 res!98810) b!119377))

(assert (= (and b!119377 res!98809) b!119378))

(assert (=> b!119376 m!179201))

(declare-fun m!179775 () Bool)

(assert (=> b!119376 m!179775))

(declare-fun m!179777 () Bool)

(assert (=> b!119376 m!179777))

(declare-fun m!179779 () Bool)

(assert (=> b!119378 m!179779))

(assert (=> b!119378 m!179211))

(assert (=> b!119378 m!179201))

(declare-fun m!179781 () Bool)

(assert (=> b!119379 m!179781))

(declare-fun m!179783 () Bool)

(assert (=> b!119377 m!179783))

(declare-fun m!179785 () Bool)

(assert (=> d!38270 m!179785))

(declare-fun m!179787 () Bool)

(assert (=> d!38270 m!179787))

(declare-fun m!179789 () Bool)

(assert (=> d!38270 m!179789))

(declare-fun m!179791 () Bool)

(assert (=> d!38270 m!179791))

(declare-fun m!179793 () Bool)

(assert (=> d!38270 m!179793))

(declare-fun m!179795 () Bool)

(assert (=> d!38270 m!179795))

(declare-fun m!179797 () Bool)

(assert (=> d!38270 m!179797))

(declare-fun m!179799 () Bool)

(assert (=> d!38270 m!179799))

(assert (=> d!38270 m!179431))

(declare-fun m!179801 () Bool)

(assert (=> d!38270 m!179801))

(assert (=> d!38270 m!179435))

(assert (=> b!119119 d!38270))

(declare-fun lt!184613 () tuple2!10004)

(declare-fun d!38272 () Bool)

(assert (=> d!38272 (= lt!184613 (readNLeastSignificantBitsLoop!0 (_1!5263 lt!183818) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183837))))

(assert (=> d!38272 (= (readNLeastSignificantBitsLoopPure!0 (_1!5263 lt!183818) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183837) (tuple2!9999 (_2!5267 lt!184613) (_1!5267 lt!184613)))))

(declare-fun bs!9262 () Bool)

(assert (= bs!9262 d!38272))

(declare-fun m!179803 () Bool)

(assert (=> bs!9262 m!179803))

(assert (=> b!119119 d!38272))

(declare-fun d!38274 () Bool)

(declare-fun lt!184614 () tuple2!10004)

(assert (=> d!38274 (= lt!184614 (readNLeastSignificantBitsLoop!0 (_1!5263 lt!183823) nBits!396 i!615 lt!183822))))

(assert (=> d!38274 (= (readNLeastSignificantBitsLoopPure!0 (_1!5263 lt!183823) nBits!396 i!615 lt!183822) (tuple2!9999 (_2!5267 lt!184614) (_1!5267 lt!184614)))))

(declare-fun bs!9263 () Bool)

(assert (= bs!9263 d!38274))

(declare-fun m!179805 () Bool)

(assert (=> bs!9263 m!179805))

(assert (=> b!119119 d!38274))

(declare-fun d!38276 () Bool)

(declare-fun res!98812 () Bool)

(declare-fun e!78219 () Bool)

(assert (=> d!38276 (=> (not res!98812) (not e!78219))))

(assert (=> d!38276 (= res!98812 (= (size!2418 (buf!2840 thiss!1305)) (size!2418 (buf!2840 (_2!5261 lt!183817)))))))

(assert (=> d!38276 (= (isPrefixOf!0 thiss!1305 (_2!5261 lt!183817)) e!78219)))

(declare-fun b!119381 () Bool)

(declare-fun res!98814 () Bool)

(assert (=> b!119381 (=> (not res!98814) (not e!78219))))

(assert (=> b!119381 (= res!98814 (bvsle (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)) (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183817))) (currentByte!5501 (_2!5261 lt!183817)) (currentBit!5496 (_2!5261 lt!183817)))))))

(declare-fun b!119382 () Bool)

(declare-fun e!78220 () Bool)

(assert (=> b!119382 (= e!78219 e!78220)))

(declare-fun res!98813 () Bool)

(assert (=> b!119382 (=> res!98813 e!78220)))

(assert (=> b!119382 (= res!98813 (= (size!2418 (buf!2840 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!119383 () Bool)

(assert (=> b!119383 (= e!78220 (arrayBitRangesEq!0 (buf!2840 thiss!1305) (buf!2840 (_2!5261 lt!183817)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2418 (buf!2840 thiss!1305)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305))))))

(assert (= (and d!38276 res!98812) b!119381))

(assert (= (and b!119381 res!98814) b!119382))

(assert (= (and b!119382 (not res!98813)) b!119383))

(assert (=> b!119381 m!179203))

(assert (=> b!119381 m!179201))

(assert (=> b!119383 m!179203))

(assert (=> b!119383 m!179203))

(declare-fun m!179807 () Bool)

(assert (=> b!119383 m!179807))

(assert (=> b!119118 d!38276))

(declare-fun d!38278 () Bool)

(assert (=> d!38278 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!119109 d!38278))

(declare-fun d!38280 () Bool)

(assert (=> d!38280 (= (invariant!0 (currentBit!5496 thiss!1305) (currentByte!5501 thiss!1305) (size!2418 (buf!2840 (_2!5261 lt!183817)))) (and (bvsge (currentBit!5496 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5496 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5501 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5501 thiss!1305) (size!2418 (buf!2840 (_2!5261 lt!183817)))) (and (= (currentBit!5496 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5501 thiss!1305) (size!2418 (buf!2840 (_2!5261 lt!183817))))))))))

(assert (=> b!119107 d!38280))

(declare-fun d!38282 () Bool)

(assert (=> d!38282 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2418 (buf!2840 thiss!1305))) ((_ sign_extend 32) (currentByte!5501 thiss!1305)) ((_ sign_extend 32) (currentBit!5496 thiss!1305)) lt!183814) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2418 (buf!2840 thiss!1305))) ((_ sign_extend 32) (currentByte!5501 thiss!1305)) ((_ sign_extend 32) (currentBit!5496 thiss!1305))) lt!183814))))

(declare-fun bs!9264 () Bool)

(assert (= bs!9264 d!38282))

(assert (=> bs!9264 m!179395))

(assert (=> b!119117 d!38282))

(declare-fun d!38284 () Bool)

(declare-fun e!78221 () Bool)

(assert (=> d!38284 e!78221))

(declare-fun res!98815 () Bool)

(assert (=> d!38284 (=> (not res!98815) (not e!78221))))

(declare-fun lt!184620 () (_ BitVec 64))

(declare-fun lt!184619 () (_ BitVec 64))

(declare-fun lt!184616 () (_ BitVec 64))

(assert (=> d!38284 (= res!98815 (= lt!184619 (bvsub lt!184616 lt!184620)))))

(assert (=> d!38284 (or (= (bvand lt!184616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!184620 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!184616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184616 lt!184620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38284 (= lt!184620 (remainingBits!0 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183817)))) ((_ sign_extend 32) (currentByte!5501 (_2!5261 lt!183817))) ((_ sign_extend 32) (currentBit!5496 (_2!5261 lt!183817)))))))

(declare-fun lt!184615 () (_ BitVec 64))

(declare-fun lt!184618 () (_ BitVec 64))

(assert (=> d!38284 (= lt!184616 (bvmul lt!184615 lt!184618))))

(assert (=> d!38284 (or (= lt!184615 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!184618 (bvsdiv (bvmul lt!184615 lt!184618) lt!184615)))))

(assert (=> d!38284 (= lt!184618 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38284 (= lt!184615 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183817)))))))

(assert (=> d!38284 (= lt!184619 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5501 (_2!5261 lt!183817))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5496 (_2!5261 lt!183817)))))))

(assert (=> d!38284 (invariant!0 (currentBit!5496 (_2!5261 lt!183817)) (currentByte!5501 (_2!5261 lt!183817)) (size!2418 (buf!2840 (_2!5261 lt!183817))))))

(assert (=> d!38284 (= (bitIndex!0 (size!2418 (buf!2840 (_2!5261 lt!183817))) (currentByte!5501 (_2!5261 lt!183817)) (currentBit!5496 (_2!5261 lt!183817))) lt!184619)))

(declare-fun b!119384 () Bool)

(declare-fun res!98816 () Bool)

(assert (=> b!119384 (=> (not res!98816) (not e!78221))))

(assert (=> b!119384 (= res!98816 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!184619))))

(declare-fun b!119385 () Bool)

(declare-fun lt!184617 () (_ BitVec 64))

(assert (=> b!119385 (= e!78221 (bvsle lt!184619 (bvmul lt!184617 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119385 (or (= lt!184617 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!184617 #b0000000000000000000000000000000000000000000000000000000000001000) lt!184617)))))

(assert (=> b!119385 (= lt!184617 ((_ sign_extend 32) (size!2418 (buf!2840 (_2!5261 lt!183817)))))))

(assert (= (and d!38284 res!98815) b!119384))

(assert (= (and b!119384 res!98816) b!119385))

(declare-fun m!179809 () Bool)

(assert (=> d!38284 m!179809))

(declare-fun m!179811 () Bool)

(assert (=> d!38284 m!179811))

(assert (=> b!119113 d!38284))

(assert (=> b!119113 d!38156))

(declare-fun d!38286 () Bool)

(assert (=> d!38286 (= (array_inv!2220 (buf!2840 thiss!1305)) (bvsge (size!2418 (buf!2840 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!119115 d!38286))

(declare-fun d!38288 () Bool)

(declare-fun lt!184621 () tuple2!10006)

(assert (=> d!38288 (= lt!184621 (readBit!0 (readerFrom!0 (_2!5261 lt!183817) (currentBit!5496 thiss!1305) (currentByte!5501 thiss!1305))))))

(assert (=> d!38288 (= (readBitPure!0 (readerFrom!0 (_2!5261 lt!183817) (currentBit!5496 thiss!1305) (currentByte!5501 thiss!1305))) (tuple2!9995 (_2!5268 lt!184621) (_1!5268 lt!184621)))))

(declare-fun bs!9265 () Bool)

(assert (= bs!9265 d!38288))

(assert (=> bs!9265 m!179217))

(declare-fun m!179813 () Bool)

(assert (=> bs!9265 m!179813))

(assert (=> b!119114 d!38288))

(declare-fun d!38290 () Bool)

(declare-fun e!78224 () Bool)

(assert (=> d!38290 e!78224))

(declare-fun res!98820 () Bool)

(assert (=> d!38290 (=> (not res!98820) (not e!78224))))

(assert (=> d!38290 (= res!98820 (invariant!0 (currentBit!5496 (_2!5261 lt!183817)) (currentByte!5501 (_2!5261 lt!183817)) (size!2418 (buf!2840 (_2!5261 lt!183817)))))))

(assert (=> d!38290 (= (readerFrom!0 (_2!5261 lt!183817) (currentBit!5496 thiss!1305) (currentByte!5501 thiss!1305)) (BitStream!4311 (buf!2840 (_2!5261 lt!183817)) (currentByte!5501 thiss!1305) (currentBit!5496 thiss!1305)))))

(declare-fun b!119388 () Bool)

(assert (=> b!119388 (= e!78224 (invariant!0 (currentBit!5496 thiss!1305) (currentByte!5501 thiss!1305) (size!2418 (buf!2840 (_2!5261 lt!183817)))))))

(assert (= (and d!38290 res!98820) b!119388))

(assert (=> d!38290 m!179811))

(assert (=> b!119388 m!179225))

(assert (=> b!119114 d!38290))

(push 1)

(assert (not b!119388))

(assert (not b!119373))

(assert (not b!119217))

(assert (not b!119377))

(assert (not d!38266))

(assert (not b!119362))

(assert (not d!38178))

(assert (not b!119378))

(assert (not d!38168))

(assert (not d!38160))

(assert (not d!38150))

(assert (not d!38290))

(assert (not d!38180))

(assert (not bm!1547))

(assert (not d!38152))

(assert (not d!38172))

(assert (not b!119358))

(assert (not b!119215))

(assert (not b!119359))

(assert (not d!38264))

(assert (not d!38288))

(assert (not d!38268))

(assert (not b!119198))

(assert (not d!38154))

(assert (not b!119371))

(assert (not d!38282))

(assert (not b!119199))

(assert (not d!38284))

(assert (not b!119355))

(assert (not b!119353))

(assert (not d!38274))

(assert (not d!38148))

(assert (not b!119357))

(assert (not d!38170))

(assert (not d!38146))

(assert (not b!119379))

(assert (not d!38174))

(assert (not b!119352))

(assert (not d!38166))

(assert (not b!119201))

(assert (not d!38272))

(assert (not b!119218))

(assert (not b!119354))

(assert (not b!119381))

(assert (not b!119383))

(assert (not d!38258))

(assert (not d!38156))

(assert (not b!119360))

(assert (not b!119216))

(assert (not d!38262))

(assert (not b!119200))

(assert (not d!38270))

(assert (not d!38176))

(assert (not d!38162))

(assert (not b!119351))

(assert (not b!119376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

