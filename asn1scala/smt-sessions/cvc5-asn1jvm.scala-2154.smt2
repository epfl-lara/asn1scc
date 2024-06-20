; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54690 () Bool)

(assert start!54690)

(declare-fun b!256377 () Bool)

(declare-fun res!214944 () Bool)

(declare-fun e!177649 () Bool)

(assert (=> b!256377 (=> (not res!214944) (not e!177649))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!256377 (= res!214944 (bvsge from!289 nBits!297))))

(declare-fun res!214945 () Bool)

(assert (=> start!54690 (=> (not res!214945) (not e!177649))))

(assert (=> start!54690 (= res!214945 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54690 e!177649))

(assert (=> start!54690 true))

(declare-datatypes ((array!13837 0))(
  ( (array!13838 (arr!7060 (Array (_ BitVec 32) (_ BitVec 8))) (size!6073 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11068 0))(
  ( (BitStream!11069 (buf!6590 array!13837) (currentByte!12069 (_ BitVec 32)) (currentBit!12064 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11068)

(declare-fun e!177652 () Bool)

(declare-fun inv!12 (BitStream!11068) Bool)

(assert (=> start!54690 (and (inv!12 thiss!1005) e!177652)))

(declare-fun b!256378 () Bool)

(declare-fun e!177650 () Bool)

(declare-datatypes ((tuple2!21942 0))(
  ( (tuple2!21943 (_1!11905 BitStream!11068) (_2!11905 Bool)) )
))
(declare-fun lt!397740 () tuple2!21942)

(declare-datatypes ((tuple2!21944 0))(
  ( (tuple2!21945 (_1!11906 BitStream!11068) (_2!11906 BitStream!11068)) )
))
(declare-fun lt!397743 () tuple2!21944)

(assert (=> b!256378 (= e!177650 (and (_2!11905 lt!397740) (= (_1!11905 lt!397740) (_2!11906 lt!397743))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!11068 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21942)

(assert (=> b!256378 (= lt!397740 (checkBitsLoopPure!0 (_1!11906 lt!397743) nBits!297 bit!26 from!289))))

(declare-datatypes ((Unit!18354 0))(
  ( (Unit!18355) )
))
(declare-fun lt!397741 () Unit!18354)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11068 array!13837 (_ BitVec 64)) Unit!18354)

(assert (=> b!256378 (= lt!397741 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6590 thiss!1005) (bvsub nBits!297 from!289)))))

(declare-fun reader!0 (BitStream!11068 BitStream!11068) tuple2!21944)

(assert (=> b!256378 (= lt!397743 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!256379 () Bool)

(declare-fun array_inv!5814 (array!13837) Bool)

(assert (=> b!256379 (= e!177652 (array_inv!5814 (buf!6590 thiss!1005)))))

(declare-fun b!256380 () Bool)

(declare-fun e!177651 () Bool)

(assert (=> b!256380 (= e!177651 e!177650)))

(declare-fun res!214947 () Bool)

(assert (=> b!256380 (=> (not res!214947) (not e!177650))))

(declare-fun lt!397742 () (_ BitVec 64))

(assert (=> b!256380 (= res!214947 (= lt!397742 (bvadd lt!397742 (bvsub nBits!297 from!289))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256380 (= lt!397742 (bitIndex!0 (size!6073 (buf!6590 thiss!1005)) (currentByte!12069 thiss!1005) (currentBit!12064 thiss!1005)))))

(declare-fun b!256381 () Bool)

(assert (=> b!256381 (= e!177649 (not e!177651))))

(declare-fun res!214943 () Bool)

(assert (=> b!256381 (=> res!214943 e!177651)))

(assert (=> b!256381 (= res!214943 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11068 BitStream!11068) Bool)

(assert (=> b!256381 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!397739 () Unit!18354)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11068) Unit!18354)

(assert (=> b!256381 (= lt!397739 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!256382 () Bool)

(declare-fun res!214946 () Bool)

(assert (=> b!256382 (=> (not res!214946) (not e!177649))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256382 (= res!214946 (validate_offset_bits!1 ((_ sign_extend 32) (size!6073 (buf!6590 thiss!1005))) ((_ sign_extend 32) (currentByte!12069 thiss!1005)) ((_ sign_extend 32) (currentBit!12064 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!54690 res!214945) b!256382))

(assert (= (and b!256382 res!214946) b!256377))

(assert (= (and b!256377 res!214944) b!256381))

(assert (= (and b!256381 (not res!214943)) b!256380))

(assert (= (and b!256380 res!214947) b!256378))

(assert (= start!54690 b!256379))

(declare-fun m!385965 () Bool)

(assert (=> b!256380 m!385965))

(declare-fun m!385967 () Bool)

(assert (=> b!256382 m!385967))

(declare-fun m!385969 () Bool)

(assert (=> b!256381 m!385969))

(declare-fun m!385971 () Bool)

(assert (=> b!256381 m!385971))

(declare-fun m!385973 () Bool)

(assert (=> b!256378 m!385973))

(declare-fun m!385975 () Bool)

(assert (=> b!256378 m!385975))

(declare-fun m!385977 () Bool)

(assert (=> b!256378 m!385977))

(declare-fun m!385979 () Bool)

(assert (=> start!54690 m!385979))

(declare-fun m!385981 () Bool)

(assert (=> b!256379 m!385981))

(push 1)

(assert (not b!256379))

(assert (not b!256382))

(assert (not b!256380))

(assert (not b!256381))

(assert (not start!54690))

(assert (not b!256378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85946 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!85946 (= (inv!12 thiss!1005) (invariant!0 (currentBit!12064 thiss!1005) (currentByte!12069 thiss!1005) (size!6073 (buf!6590 thiss!1005))))))

(declare-fun bs!21707 () Bool)

(assert (= bs!21707 d!85946))

(declare-fun m!386019 () Bool)

(assert (=> bs!21707 m!386019))

(assert (=> start!54690 d!85946))

(declare-fun d!85948 () Bool)

(declare-datatypes ((tuple2!21954 0))(
  ( (tuple2!21955 (_1!11911 Bool) (_2!11911 BitStream!11068)) )
))
(declare-fun lt!397776 () tuple2!21954)

(declare-fun checkBitsLoop!0 (BitStream!11068 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21954)

(assert (=> d!85948 (= lt!397776 (checkBitsLoop!0 (_1!11906 lt!397743) nBits!297 bit!26 from!289))))

(assert (=> d!85948 (= (checkBitsLoopPure!0 (_1!11906 lt!397743) nBits!297 bit!26 from!289) (tuple2!21943 (_2!11911 lt!397776) (_1!11911 lt!397776)))))

(declare-fun bs!21708 () Bool)

(assert (= bs!21708 d!85948))

(declare-fun m!386021 () Bool)

(assert (=> bs!21708 m!386021))

(assert (=> b!256378 d!85948))

(declare-fun d!85952 () Bool)

(assert (=> d!85952 (validate_offset_bits!1 ((_ sign_extend 32) (size!6073 (buf!6590 thiss!1005))) ((_ sign_extend 32) (currentByte!12069 thiss!1005)) ((_ sign_extend 32) (currentBit!12064 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!397779 () Unit!18354)

(declare-fun choose!9 (BitStream!11068 array!13837 (_ BitVec 64) BitStream!11068) Unit!18354)

(assert (=> d!85952 (= lt!397779 (choose!9 thiss!1005 (buf!6590 thiss!1005) (bvsub nBits!297 from!289) (BitStream!11069 (buf!6590 thiss!1005) (currentByte!12069 thiss!1005) (currentBit!12064 thiss!1005))))))

(assert (=> d!85952 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6590 thiss!1005) (bvsub nBits!297 from!289)) lt!397779)))

(declare-fun bs!21709 () Bool)

(assert (= bs!21709 d!85952))

(assert (=> bs!21709 m!385967))

(declare-fun m!386023 () Bool)

(assert (=> bs!21709 m!386023))

(assert (=> b!256378 d!85952))

(declare-fun b!256438 () Bool)

(declare-fun res!214993 () Bool)

(declare-fun e!177695 () Bool)

(assert (=> b!256438 (=> (not res!214993) (not e!177695))))

(declare-fun lt!397830 () tuple2!21944)

(assert (=> b!256438 (= res!214993 (isPrefixOf!0 (_2!11906 lt!397830) thiss!1005))))

(declare-fun b!256439 () Bool)

(declare-fun e!177694 () Unit!18354)

(declare-fun Unit!18360 () Unit!18354)

(assert (=> b!256439 (= e!177694 Unit!18360)))

(declare-fun d!85954 () Bool)

(assert (=> d!85954 e!177695))

(declare-fun res!214994 () Bool)

(assert (=> d!85954 (=> (not res!214994) (not e!177695))))

(assert (=> d!85954 (= res!214994 (isPrefixOf!0 (_1!11906 lt!397830) (_2!11906 lt!397830)))))

(declare-fun lt!397831 () BitStream!11068)

(assert (=> d!85954 (= lt!397830 (tuple2!21945 lt!397831 thiss!1005))))

(declare-fun lt!397836 () Unit!18354)

(declare-fun lt!397838 () Unit!18354)

(assert (=> d!85954 (= lt!397836 lt!397838)))

(assert (=> d!85954 (isPrefixOf!0 lt!397831 thiss!1005)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11068 BitStream!11068 BitStream!11068) Unit!18354)

(assert (=> d!85954 (= lt!397838 (lemmaIsPrefixTransitive!0 lt!397831 thiss!1005 thiss!1005))))

(declare-fun lt!397840 () Unit!18354)

(declare-fun lt!397832 () Unit!18354)

(assert (=> d!85954 (= lt!397840 lt!397832)))

(assert (=> d!85954 (isPrefixOf!0 lt!397831 thiss!1005)))

(assert (=> d!85954 (= lt!397832 (lemmaIsPrefixTransitive!0 lt!397831 thiss!1005 thiss!1005))))

(declare-fun lt!397835 () Unit!18354)

(assert (=> d!85954 (= lt!397835 e!177694)))

(declare-fun c!11773 () Bool)

(assert (=> d!85954 (= c!11773 (not (= (size!6073 (buf!6590 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!397842 () Unit!18354)

(declare-fun lt!397848 () Unit!18354)

(assert (=> d!85954 (= lt!397842 lt!397848)))

(assert (=> d!85954 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85954 (= lt!397848 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun lt!397841 () Unit!18354)

(declare-fun lt!397833 () Unit!18354)

(assert (=> d!85954 (= lt!397841 lt!397833)))

(assert (=> d!85954 (= lt!397833 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun lt!397829 () Unit!18354)

(declare-fun lt!397846 () Unit!18354)

(assert (=> d!85954 (= lt!397829 lt!397846)))

(assert (=> d!85954 (isPrefixOf!0 lt!397831 lt!397831)))

(assert (=> d!85954 (= lt!397846 (lemmaIsPrefixRefl!0 lt!397831))))

(declare-fun lt!397843 () Unit!18354)

(declare-fun lt!397837 () Unit!18354)

(assert (=> d!85954 (= lt!397843 lt!397837)))

(assert (=> d!85954 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85954 (= lt!397837 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!85954 (= lt!397831 (BitStream!11069 (buf!6590 thiss!1005) (currentByte!12069 thiss!1005) (currentBit!12064 thiss!1005)))))

(assert (=> d!85954 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85954 (= (reader!0 thiss!1005 thiss!1005) lt!397830)))

(declare-fun lt!397834 () (_ BitVec 64))

(declare-fun b!256440 () Bool)

(declare-fun lt!397839 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!11068 (_ BitVec 64)) BitStream!11068)

(assert (=> b!256440 (= e!177695 (= (_1!11906 lt!397830) (withMovedBitIndex!0 (_2!11906 lt!397830) (bvsub lt!397839 lt!397834))))))

(assert (=> b!256440 (or (= (bvand lt!397839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!397834 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!397839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!397839 lt!397834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!256440 (= lt!397834 (bitIndex!0 (size!6073 (buf!6590 thiss!1005)) (currentByte!12069 thiss!1005) (currentBit!12064 thiss!1005)))))

(assert (=> b!256440 (= lt!397839 (bitIndex!0 (size!6073 (buf!6590 thiss!1005)) (currentByte!12069 thiss!1005) (currentBit!12064 thiss!1005)))))

(declare-fun b!256441 () Bool)

(declare-fun res!214995 () Bool)

(assert (=> b!256441 (=> (not res!214995) (not e!177695))))

(assert (=> b!256441 (= res!214995 (isPrefixOf!0 (_1!11906 lt!397830) thiss!1005))))

(declare-fun b!256442 () Bool)

(declare-fun lt!397845 () Unit!18354)

(assert (=> b!256442 (= e!177694 lt!397845)))

(declare-fun lt!397844 () (_ BitVec 64))

(assert (=> b!256442 (= lt!397844 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!397847 () (_ BitVec 64))

(assert (=> b!256442 (= lt!397847 (bitIndex!0 (size!6073 (buf!6590 thiss!1005)) (currentByte!12069 thiss!1005) (currentBit!12064 thiss!1005)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13837 array!13837 (_ BitVec 64) (_ BitVec 64)) Unit!18354)

(assert (=> b!256442 (= lt!397845 (arrayBitRangesEqSymmetric!0 (buf!6590 thiss!1005) (buf!6590 thiss!1005) lt!397844 lt!397847))))

(declare-fun arrayBitRangesEq!0 (array!13837 array!13837 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256442 (arrayBitRangesEq!0 (buf!6590 thiss!1005) (buf!6590 thiss!1005) lt!397844 lt!397847)))

(assert (= (and d!85954 c!11773) b!256442))

(assert (= (and d!85954 (not c!11773)) b!256439))

(assert (= (and d!85954 res!214994) b!256441))

(assert (= (and b!256441 res!214995) b!256438))

(assert (= (and b!256438 res!214993) b!256440))

(declare-fun m!386033 () Bool)

(assert (=> b!256441 m!386033))

(assert (=> b!256442 m!385965))

(declare-fun m!386035 () Bool)

(assert (=> b!256442 m!386035))

(declare-fun m!386037 () Bool)

(assert (=> b!256442 m!386037))

(declare-fun m!386039 () Bool)

(assert (=> b!256438 m!386039))

(assert (=> d!85954 m!385969))

(assert (=> d!85954 m!385971))

(assert (=> d!85954 m!385971))

(declare-fun m!386041 () Bool)

(assert (=> d!85954 m!386041))

(assert (=> d!85954 m!385969))

(declare-fun m!386043 () Bool)

(assert (=> d!85954 m!386043))

(assert (=> d!85954 m!385969))

(declare-fun m!386045 () Bool)

(assert (=> d!85954 m!386045))

(assert (=> d!85954 m!386045))

(declare-fun m!386047 () Bool)

(assert (=> d!85954 m!386047))

(declare-fun m!386049 () Bool)

(assert (=> d!85954 m!386049))

(declare-fun m!386051 () Bool)

(assert (=> b!256440 m!386051))

(assert (=> b!256440 m!385965))

(assert (=> b!256440 m!385965))

(assert (=> b!256378 d!85954))

(declare-fun d!85964 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!85964 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6073 (buf!6590 thiss!1005))) ((_ sign_extend 32) (currentByte!12069 thiss!1005)) ((_ sign_extend 32) (currentBit!12064 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6073 (buf!6590 thiss!1005))) ((_ sign_extend 32) (currentByte!12069 thiss!1005)) ((_ sign_extend 32) (currentBit!12064 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21714 () Bool)

(assert (= bs!21714 d!85964))

(declare-fun m!386053 () Bool)

(assert (=> bs!21714 m!386053))

(assert (=> b!256382 d!85964))

(declare-fun d!85966 () Bool)

(declare-fun e!177704 () Bool)

(assert (=> d!85966 e!177704))

(declare-fun res!215009 () Bool)

(assert (=> d!85966 (=> (not res!215009) (not e!177704))))

(declare-fun lt!397926 () (_ BitVec 64))

(declare-fun lt!397921 () (_ BitVec 64))

(declare-fun lt!397925 () (_ BitVec 64))

(assert (=> d!85966 (= res!215009 (= lt!397926 (bvsub lt!397925 lt!397921)))))

(assert (=> d!85966 (or (= (bvand lt!397925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!397921 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!397925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!397925 lt!397921) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85966 (= lt!397921 (remainingBits!0 ((_ sign_extend 32) (size!6073 (buf!6590 thiss!1005))) ((_ sign_extend 32) (currentByte!12069 thiss!1005)) ((_ sign_extend 32) (currentBit!12064 thiss!1005))))))

(declare-fun lt!397924 () (_ BitVec 64))

(declare-fun lt!397922 () (_ BitVec 64))

(assert (=> d!85966 (= lt!397925 (bvmul lt!397924 lt!397922))))

(assert (=> d!85966 (or (= lt!397924 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!397922 (bvsdiv (bvmul lt!397924 lt!397922) lt!397924)))))

(assert (=> d!85966 (= lt!397922 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85966 (= lt!397924 ((_ sign_extend 32) (size!6073 (buf!6590 thiss!1005))))))

(assert (=> d!85966 (= lt!397926 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12069 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12064 thiss!1005))))))

(assert (=> d!85966 (invariant!0 (currentBit!12064 thiss!1005) (currentByte!12069 thiss!1005) (size!6073 (buf!6590 thiss!1005)))))

(assert (=> d!85966 (= (bitIndex!0 (size!6073 (buf!6590 thiss!1005)) (currentByte!12069 thiss!1005) (currentBit!12064 thiss!1005)) lt!397926)))

(declare-fun b!256462 () Bool)

(declare-fun res!215010 () Bool)

(assert (=> b!256462 (=> (not res!215010) (not e!177704))))

(assert (=> b!256462 (= res!215010 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!397926))))

(declare-fun b!256463 () Bool)

(declare-fun lt!397923 () (_ BitVec 64))

(assert (=> b!256463 (= e!177704 (bvsle lt!397926 (bvmul lt!397923 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!256463 (or (= lt!397923 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!397923 #b0000000000000000000000000000000000000000000000000000000000001000) lt!397923)))))

(assert (=> b!256463 (= lt!397923 ((_ sign_extend 32) (size!6073 (buf!6590 thiss!1005))))))

(assert (= (and d!85966 res!215009) b!256462))

(assert (= (and b!256462 res!215010) b!256463))

(assert (=> d!85966 m!386053))

(assert (=> d!85966 m!386019))

(assert (=> b!256380 d!85966))

(declare-fun d!85972 () Bool)

(declare-fun res!215019 () Bool)

(declare-fun e!177709 () Bool)

(assert (=> d!85972 (=> (not res!215019) (not e!177709))))

(assert (=> d!85972 (= res!215019 (= (size!6073 (buf!6590 thiss!1005)) (size!6073 (buf!6590 thiss!1005))))))

(assert (=> d!85972 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!177709)))

(declare-fun b!256470 () Bool)

(declare-fun res!215017 () Bool)

(assert (=> b!256470 (=> (not res!215017) (not e!177709))))

(assert (=> b!256470 (= res!215017 (bvsle (bitIndex!0 (size!6073 (buf!6590 thiss!1005)) (currentByte!12069 thiss!1005) (currentBit!12064 thiss!1005)) (bitIndex!0 (size!6073 (buf!6590 thiss!1005)) (currentByte!12069 thiss!1005) (currentBit!12064 thiss!1005))))))

(declare-fun b!256471 () Bool)

(declare-fun e!177710 () Bool)

(assert (=> b!256471 (= e!177709 e!177710)))

(declare-fun res!215018 () Bool)

(assert (=> b!256471 (=> res!215018 e!177710)))

(assert (=> b!256471 (= res!215018 (= (size!6073 (buf!6590 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!256472 () Bool)

(assert (=> b!256472 (= e!177710 (arrayBitRangesEq!0 (buf!6590 thiss!1005) (buf!6590 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6073 (buf!6590 thiss!1005)) (currentByte!12069 thiss!1005) (currentBit!12064 thiss!1005))))))

(assert (= (and d!85972 res!215019) b!256470))

(assert (= (and b!256470 res!215017) b!256471))

(assert (= (and b!256471 (not res!215018)) b!256472))

(assert (=> b!256470 m!385965))

(assert (=> b!256470 m!385965))

(assert (=> b!256472 m!385965))

(assert (=> b!256472 m!385965))

(declare-fun m!386077 () Bool)

(assert (=> b!256472 m!386077))

(assert (=> b!256381 d!85972))

(declare-fun d!85974 () Bool)

(assert (=> d!85974 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!397941 () Unit!18354)

(declare-fun choose!11 (BitStream!11068) Unit!18354)

(assert (=> d!85974 (= lt!397941 (choose!11 thiss!1005))))

(assert (=> d!85974 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!397941)))

(declare-fun bs!21717 () Bool)

(assert (= bs!21717 d!85974))

(assert (=> bs!21717 m!385969))

(declare-fun m!386079 () Bool)

(assert (=> bs!21717 m!386079))

(assert (=> b!256381 d!85974))

(declare-fun d!85976 () Bool)

(assert (=> d!85976 (= (array_inv!5814 (buf!6590 thiss!1005)) (bvsge (size!6073 (buf!6590 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!256379 d!85976))

(push 1)

(assert (not b!256472))

(assert (not d!85946))

(assert (not b!256440))

(assert (not b!256438))

(assert (not d!85954))

(assert (not b!256441))

(assert (not b!256470))

(assert (not d!85952))

(assert (not d!85948))

(assert (not d!85966))

(assert (not d!85964))

(assert (not d!85974))

(assert (not b!256442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

