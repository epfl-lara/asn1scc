; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21616 () Bool)

(assert start!21616)

(declare-fun b!109170 () Bool)

(declare-fun e!71531 () Bool)

(declare-fun e!71526 () Bool)

(assert (=> b!109170 (= e!71531 e!71526)))

(declare-fun res!90067 () Bool)

(assert (=> b!109170 (=> (not res!90067) (not e!71526))))

(declare-datatypes ((array!4979 0))(
  ( (array!4980 (arr!2859 (Array (_ BitVec 32) (_ BitVec 8))) (size!2266 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4006 0))(
  ( (BitStream!4007 (buf!2657 array!4979) (currentByte!5193 (_ BitVec 32)) (currentBit!5188 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4006)

(declare-fun lt!164911 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109170 (= res!90067 (validate_offset_bits!1 ((_ sign_extend 32) (size!2266 (buf!2657 thiss!1305))) ((_ sign_extend 32) (currentByte!5193 thiss!1305)) ((_ sign_extend 32) (currentBit!5188 thiss!1305)) lt!164911))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!109170 (= lt!164911 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109171 () Bool)

(declare-fun e!71521 () Bool)

(assert (=> b!109171 (= e!71521 true)))

(declare-fun e!71530 () Bool)

(assert (=> b!109171 e!71530))

(declare-fun res!90070 () Bool)

(assert (=> b!109171 (=> (not res!90070) (not e!71530))))

(declare-datatypes ((tuple2!9060 0))(
  ( (tuple2!9061 (_1!4787 BitStream!4006) (_2!4787 BitStream!4006)) )
))
(declare-fun lt!164919 () tuple2!9060)

(declare-fun lt!164908 () (_ BitVec 64))

(declare-fun lt!164925 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4006 (_ BitVec 64)) BitStream!4006)

(assert (=> b!109171 (= res!90070 (= (_1!4787 lt!164919) (withMovedBitIndex!0 (_2!4787 lt!164919) (bvsub lt!164925 lt!164908))))))

(declare-datatypes ((Unit!6673 0))(
  ( (Unit!6674) )
))
(declare-datatypes ((tuple2!9062 0))(
  ( (tuple2!9063 (_1!4788 Unit!6673) (_2!4788 BitStream!4006)) )
))
(declare-fun lt!164921 () tuple2!9062)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109171 (= lt!164925 (bitIndex!0 (size!2266 (buf!2657 (_2!4788 lt!164921))) (currentByte!5193 (_2!4788 lt!164921)) (currentBit!5188 (_2!4788 lt!164921))))))

(declare-fun lt!164918 () tuple2!9060)

(declare-fun lt!164929 () (_ BitVec 64))

(assert (=> b!109171 (= (_1!4787 lt!164918) (withMovedBitIndex!0 (_2!4787 lt!164918) (bvsub lt!164929 lt!164908)))))

(declare-fun lt!164905 () tuple2!9062)

(assert (=> b!109171 (= lt!164908 (bitIndex!0 (size!2266 (buf!2657 (_2!4788 lt!164905))) (currentByte!5193 (_2!4788 lt!164905)) (currentBit!5188 (_2!4788 lt!164905))))))

(assert (=> b!109171 (= lt!164929 (bitIndex!0 (size!2266 (buf!2657 thiss!1305)) (currentByte!5193 thiss!1305) (currentBit!5188 thiss!1305)))))

(declare-datatypes ((tuple2!9064 0))(
  ( (tuple2!9065 (_1!4789 BitStream!4006) (_2!4789 (_ BitVec 64))) )
))
(declare-fun lt!164930 () tuple2!9064)

(declare-fun lt!164912 () tuple2!9064)

(assert (=> b!109171 (and (= (_2!4789 lt!164930) (_2!4789 lt!164912)) (= (_1!4789 lt!164930) (_1!4789 lt!164912)))))

(declare-fun lt!164933 () Unit!6673)

(declare-fun lt!164931 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4006 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6673)

(assert (=> b!109171 (= lt!164933 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4787 lt!164918) nBits!396 i!615 lt!164931))))

(declare-fun lt!164916 () BitStream!4006)

(declare-fun lt!164906 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4006 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9064)

(assert (=> b!109171 (= lt!164912 (readNLeastSignificantBitsLoopPure!0 lt!164916 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164906))))

(assert (=> b!109171 (= lt!164916 (withMovedBitIndex!0 (_1!4787 lt!164918) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!109172 () Bool)

(assert (=> b!109172 (= e!71526 (not e!71521))))

(declare-fun res!90059 () Bool)

(assert (=> b!109172 (=> res!90059 e!71521)))

(declare-fun lt!164915 () tuple2!9064)

(assert (=> b!109172 (= res!90059 (not (= (_1!4789 lt!164915) (_2!4787 lt!164919))))))

(assert (=> b!109172 (= lt!164915 (readNLeastSignificantBitsLoopPure!0 (_1!4787 lt!164919) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164906))))

(declare-fun lt!164927 () (_ BitVec 64))

(assert (=> b!109172 (validate_offset_bits!1 ((_ sign_extend 32) (size!2266 (buf!2657 (_2!4788 lt!164905)))) ((_ sign_extend 32) (currentByte!5193 (_2!4788 lt!164921))) ((_ sign_extend 32) (currentBit!5188 (_2!4788 lt!164921))) lt!164927)))

(declare-fun lt!164917 () Unit!6673)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4006 array!4979 (_ BitVec 64)) Unit!6673)

(assert (=> b!109172 (= lt!164917 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4788 lt!164921) (buf!2657 (_2!4788 lt!164905)) lt!164927))))

(assert (=> b!109172 (= lt!164927 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!164932 () (_ BitVec 64))

(declare-datatypes ((tuple2!9066 0))(
  ( (tuple2!9067 (_1!4790 BitStream!4006) (_2!4790 Bool)) )
))
(declare-fun lt!164926 () tuple2!9066)

(assert (=> b!109172 (= lt!164906 (bvor lt!164931 (ite (_2!4790 lt!164926) lt!164932 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109172 (= lt!164930 (readNLeastSignificantBitsLoopPure!0 (_1!4787 lt!164918) nBits!396 i!615 lt!164931))))

(assert (=> b!109172 (validate_offset_bits!1 ((_ sign_extend 32) (size!2266 (buf!2657 (_2!4788 lt!164905)))) ((_ sign_extend 32) (currentByte!5193 thiss!1305)) ((_ sign_extend 32) (currentBit!5188 thiss!1305)) lt!164911)))

(declare-fun lt!164907 () Unit!6673)

(assert (=> b!109172 (= lt!164907 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2657 (_2!4788 lt!164905)) lt!164911))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109172 (= lt!164931 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!164928 () Bool)

(assert (=> b!109172 (= (_2!4790 lt!164926) lt!164928)))

(declare-fun readBitPure!0 (BitStream!4006) tuple2!9066)

(assert (=> b!109172 (= lt!164926 (readBitPure!0 (_1!4787 lt!164918)))))

(declare-fun reader!0 (BitStream!4006 BitStream!4006) tuple2!9060)

(assert (=> b!109172 (= lt!164919 (reader!0 (_2!4788 lt!164921) (_2!4788 lt!164905)))))

(assert (=> b!109172 (= lt!164918 (reader!0 thiss!1305 (_2!4788 lt!164905)))))

(declare-fun e!71523 () Bool)

(assert (=> b!109172 e!71523))

(declare-fun res!90060 () Bool)

(assert (=> b!109172 (=> (not res!90060) (not e!71523))))

(declare-fun lt!164909 () tuple2!9066)

(declare-fun lt!164924 () tuple2!9066)

(assert (=> b!109172 (= res!90060 (= (bitIndex!0 (size!2266 (buf!2657 (_1!4790 lt!164909))) (currentByte!5193 (_1!4790 lt!164909)) (currentBit!5188 (_1!4790 lt!164909))) (bitIndex!0 (size!2266 (buf!2657 (_1!4790 lt!164924))) (currentByte!5193 (_1!4790 lt!164924)) (currentBit!5188 (_1!4790 lt!164924)))))))

(declare-fun lt!164922 () Unit!6673)

(declare-fun lt!164913 () BitStream!4006)

(declare-fun readBitPrefixLemma!0 (BitStream!4006 BitStream!4006) Unit!6673)

(assert (=> b!109172 (= lt!164922 (readBitPrefixLemma!0 lt!164913 (_2!4788 lt!164905)))))

(assert (=> b!109172 (= lt!164924 (readBitPure!0 (BitStream!4007 (buf!2657 (_2!4788 lt!164905)) (currentByte!5193 thiss!1305) (currentBit!5188 thiss!1305))))))

(assert (=> b!109172 (= lt!164909 (readBitPure!0 lt!164913))))

(assert (=> b!109172 (= lt!164913 (BitStream!4007 (buf!2657 (_2!4788 lt!164921)) (currentByte!5193 thiss!1305) (currentBit!5188 thiss!1305)))))

(declare-fun e!71529 () Bool)

(assert (=> b!109172 e!71529))

(declare-fun res!90061 () Bool)

(assert (=> b!109172 (=> (not res!90061) (not e!71529))))

(declare-fun isPrefixOf!0 (BitStream!4006 BitStream!4006) Bool)

(assert (=> b!109172 (= res!90061 (isPrefixOf!0 thiss!1305 (_2!4788 lt!164905)))))

(declare-fun lt!164914 () Unit!6673)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4006 BitStream!4006 BitStream!4006) Unit!6673)

(assert (=> b!109172 (= lt!164914 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4788 lt!164921) (_2!4788 lt!164905)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4006 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9062)

(assert (=> b!109172 (= lt!164905 (appendNLeastSignificantBitsLoop!0 (_2!4788 lt!164921) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!71528 () Bool)

(assert (=> b!109172 e!71528))

(declare-fun res!90062 () Bool)

(assert (=> b!109172 (=> (not res!90062) (not e!71528))))

(assert (=> b!109172 (= res!90062 (= (size!2266 (buf!2657 thiss!1305)) (size!2266 (buf!2657 (_2!4788 lt!164921)))))))

(declare-fun appendBit!0 (BitStream!4006 Bool) tuple2!9062)

(assert (=> b!109172 (= lt!164921 (appendBit!0 thiss!1305 lt!164928))))

(assert (=> b!109172 (= lt!164928 (not (= (bvand v!199 lt!164932) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109172 (= lt!164932 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109173 () Bool)

(declare-fun res!90069 () Bool)

(declare-fun e!71527 () Bool)

(assert (=> b!109173 (=> (not res!90069) (not e!71527))))

(assert (=> b!109173 (= res!90069 (isPrefixOf!0 thiss!1305 (_2!4788 lt!164921)))))

(declare-fun b!109174 () Bool)

(declare-fun res!90063 () Bool)

(assert (=> b!109174 (=> (not res!90063) (not e!71526))))

(assert (=> b!109174 (= res!90063 (bvslt i!615 nBits!396))))

(declare-fun b!109175 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109175 (= e!71529 (invariant!0 (currentBit!5188 thiss!1305) (currentByte!5193 thiss!1305) (size!2266 (buf!2657 (_2!4788 lt!164905)))))))

(declare-fun res!90068 () Bool)

(assert (=> start!21616 (=> (not res!90068) (not e!71531))))

(assert (=> start!21616 (= res!90068 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21616 e!71531))

(assert (=> start!21616 true))

(declare-fun e!71522 () Bool)

(declare-fun inv!12 (BitStream!4006) Bool)

(assert (=> start!21616 (and (inv!12 thiss!1305) e!71522)))

(declare-fun b!109176 () Bool)

(declare-fun res!90064 () Bool)

(assert (=> b!109176 (=> (not res!90064) (not e!71529))))

(assert (=> b!109176 (= res!90064 (invariant!0 (currentBit!5188 thiss!1305) (currentByte!5193 thiss!1305) (size!2266 (buf!2657 (_2!4788 lt!164921)))))))

(declare-fun b!109177 () Bool)

(declare-fun e!71525 () Bool)

(assert (=> b!109177 (= e!71527 e!71525)))

(declare-fun res!90058 () Bool)

(assert (=> b!109177 (=> (not res!90058) (not e!71525))))

(declare-fun lt!164923 () tuple2!9066)

(assert (=> b!109177 (= res!90058 (and (= (_2!4790 lt!164923) lt!164928) (= (_1!4790 lt!164923) (_2!4788 lt!164921))))))

(declare-fun readerFrom!0 (BitStream!4006 (_ BitVec 32) (_ BitVec 32)) BitStream!4006)

(assert (=> b!109177 (= lt!164923 (readBitPure!0 (readerFrom!0 (_2!4788 lt!164921) (currentBit!5188 thiss!1305) (currentByte!5193 thiss!1305))))))

(declare-fun b!109178 () Bool)

(assert (=> b!109178 (= e!71528 e!71527)))

(declare-fun res!90066 () Bool)

(assert (=> b!109178 (=> (not res!90066) (not e!71527))))

(declare-fun lt!164910 () (_ BitVec 64))

(declare-fun lt!164920 () (_ BitVec 64))

(assert (=> b!109178 (= res!90066 (= lt!164910 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!164920)))))

(assert (=> b!109178 (= lt!164910 (bitIndex!0 (size!2266 (buf!2657 (_2!4788 lt!164921))) (currentByte!5193 (_2!4788 lt!164921)) (currentBit!5188 (_2!4788 lt!164921))))))

(assert (=> b!109178 (= lt!164920 (bitIndex!0 (size!2266 (buf!2657 thiss!1305)) (currentByte!5193 thiss!1305) (currentBit!5188 thiss!1305)))))

(declare-fun b!109179 () Bool)

(assert (=> b!109179 (= e!71530 (and (= lt!164929 (bvsub lt!164925 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4787 lt!164919) lt!164916)) (and (= (_2!4789 lt!164930) (_2!4789 lt!164915)) (= (_1!4789 lt!164930) (_2!4787 lt!164918))))))))

(declare-fun b!109180 () Bool)

(declare-fun res!90065 () Bool)

(assert (=> b!109180 (=> (not res!90065) (not e!71526))))

(assert (=> b!109180 (= res!90065 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!109181 () Bool)

(assert (=> b!109181 (= e!71525 (= (bitIndex!0 (size!2266 (buf!2657 (_1!4790 lt!164923))) (currentByte!5193 (_1!4790 lt!164923)) (currentBit!5188 (_1!4790 lt!164923))) lt!164910))))

(declare-fun b!109182 () Bool)

(assert (=> b!109182 (= e!71523 (= (_2!4790 lt!164909) (_2!4790 lt!164924)))))

(declare-fun b!109183 () Bool)

(declare-fun array_inv!2068 (array!4979) Bool)

(assert (=> b!109183 (= e!71522 (array_inv!2068 (buf!2657 thiss!1305)))))

(assert (= (and start!21616 res!90068) b!109170))

(assert (= (and b!109170 res!90067) b!109180))

(assert (= (and b!109180 res!90065) b!109174))

(assert (= (and b!109174 res!90063) b!109172))

(assert (= (and b!109172 res!90062) b!109178))

(assert (= (and b!109178 res!90066) b!109173))

(assert (= (and b!109173 res!90069) b!109177))

(assert (= (and b!109177 res!90058) b!109181))

(assert (= (and b!109172 res!90061) b!109176))

(assert (= (and b!109176 res!90064) b!109175))

(assert (= (and b!109172 res!90060) b!109182))

(assert (= (and b!109172 (not res!90059)) b!109171))

(assert (= (and b!109171 res!90070) b!109179))

(assert (= start!21616 b!109183))

(declare-fun m!161987 () Bool)

(assert (=> b!109175 m!161987))

(declare-fun m!161989 () Bool)

(assert (=> b!109176 m!161989))

(declare-fun m!161991 () Bool)

(assert (=> b!109178 m!161991))

(declare-fun m!161993 () Bool)

(assert (=> b!109178 m!161993))

(declare-fun m!161995 () Bool)

(assert (=> start!21616 m!161995))

(declare-fun m!161997 () Bool)

(assert (=> b!109177 m!161997))

(assert (=> b!109177 m!161997))

(declare-fun m!161999 () Bool)

(assert (=> b!109177 m!161999))

(declare-fun m!162001 () Bool)

(assert (=> b!109170 m!162001))

(declare-fun m!162003 () Bool)

(assert (=> b!109181 m!162003))

(declare-fun m!162005 () Bool)

(assert (=> b!109173 m!162005))

(declare-fun m!162007 () Bool)

(assert (=> b!109172 m!162007))

(declare-fun m!162009 () Bool)

(assert (=> b!109172 m!162009))

(declare-fun m!162011 () Bool)

(assert (=> b!109172 m!162011))

(declare-fun m!162013 () Bool)

(assert (=> b!109172 m!162013))

(declare-fun m!162015 () Bool)

(assert (=> b!109172 m!162015))

(declare-fun m!162017 () Bool)

(assert (=> b!109172 m!162017))

(declare-fun m!162019 () Bool)

(assert (=> b!109172 m!162019))

(declare-fun m!162021 () Bool)

(assert (=> b!109172 m!162021))

(declare-fun m!162023 () Bool)

(assert (=> b!109172 m!162023))

(declare-fun m!162025 () Bool)

(assert (=> b!109172 m!162025))

(declare-fun m!162027 () Bool)

(assert (=> b!109172 m!162027))

(declare-fun m!162029 () Bool)

(assert (=> b!109172 m!162029))

(declare-fun m!162031 () Bool)

(assert (=> b!109172 m!162031))

(declare-fun m!162033 () Bool)

(assert (=> b!109172 m!162033))

(declare-fun m!162035 () Bool)

(assert (=> b!109172 m!162035))

(declare-fun m!162037 () Bool)

(assert (=> b!109172 m!162037))

(declare-fun m!162039 () Bool)

(assert (=> b!109172 m!162039))

(declare-fun m!162041 () Bool)

(assert (=> b!109172 m!162041))

(declare-fun m!162043 () Bool)

(assert (=> b!109172 m!162043))

(declare-fun m!162045 () Bool)

(assert (=> b!109171 m!162045))

(declare-fun m!162047 () Bool)

(assert (=> b!109171 m!162047))

(assert (=> b!109171 m!161993))

(declare-fun m!162049 () Bool)

(assert (=> b!109171 m!162049))

(declare-fun m!162051 () Bool)

(assert (=> b!109171 m!162051))

(declare-fun m!162053 () Bool)

(assert (=> b!109171 m!162053))

(assert (=> b!109171 m!161991))

(declare-fun m!162055 () Bool)

(assert (=> b!109171 m!162055))

(declare-fun m!162057 () Bool)

(assert (=> b!109183 m!162057))

(declare-fun m!162059 () Bool)

(assert (=> b!109180 m!162059))

(push 1)

(assert (not b!109170))

(assert (not b!109172))

(assert (not b!109178))

(assert (not b!109181))

(assert (not b!109176))

(assert (not b!109173))

(assert (not b!109183))

(assert (not b!109171))

(assert (not b!109175))

(assert (not start!21616))

(assert (not b!109177))

(assert (not b!109180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

