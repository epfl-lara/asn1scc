; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54072 () Bool)

(assert start!54072)

(declare-fun b!251788 () Bool)

(declare-fun e!174464 () Bool)

(declare-fun e!174467 () Bool)

(assert (=> b!251788 (= e!174464 e!174467)))

(declare-fun res!210896 () Bool)

(assert (=> b!251788 (=> (not res!210896) (not e!174467))))

(declare-fun lt!391202 () (_ BitVec 64))

(declare-datatypes ((array!13696 0))(
  ( (array!13697 (arr!6994 (Array (_ BitVec 32) (_ BitVec 8))) (size!6007 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10936 0))(
  ( (BitStream!10937 (buf!6509 array!13696) (currentByte!11964 (_ BitVec 32)) (currentBit!11959 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18162 0))(
  ( (Unit!18163) )
))
(declare-datatypes ((tuple2!21612 0))(
  ( (tuple2!21613 (_1!11734 Unit!18162) (_2!11734 BitStream!10936)) )
))
(declare-fun lt!391205 () tuple2!21612)

(declare-fun lt!391200 () tuple2!21612)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251788 (= res!210896 (= (bitIndex!0 (size!6007 (buf!6509 (_2!11734 lt!391205))) (currentByte!11964 (_2!11734 lt!391205)) (currentBit!11959 (_2!11734 lt!391205))) (bvadd (bitIndex!0 (size!6007 (buf!6509 (_2!11734 lt!391200))) (currentByte!11964 (_2!11734 lt!391200)) (currentBit!11959 (_2!11734 lt!391200))) lt!391202)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!251788 (= lt!391202 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251789 () Bool)

(declare-fun res!210900 () Bool)

(declare-fun e!174465 () Bool)

(assert (=> b!251789 (=> (not res!210900) (not e!174465))))

(declare-fun thiss!1005 () BitStream!10936)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251789 (= res!210900 (validate_offset_bits!1 ((_ sign_extend 32) (size!6007 (buf!6509 thiss!1005))) ((_ sign_extend 32) (currentByte!11964 thiss!1005)) ((_ sign_extend 32) (currentBit!11959 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251790 () Bool)

(declare-fun e!174466 () Bool)

(declare-fun array_inv!5748 (array!13696) Bool)

(assert (=> b!251790 (= e!174466 (array_inv!5748 (buf!6509 thiss!1005)))))

(declare-fun b!251791 () Bool)

(declare-fun e!174468 () Bool)

(declare-datatypes ((tuple2!21614 0))(
  ( (tuple2!21615 (_1!11735 BitStream!10936) (_2!11735 Bool)) )
))
(declare-fun lt!391199 () tuple2!21614)

(declare-fun lt!391195 () (_ BitVec 64))

(assert (=> b!251791 (= e!174468 (= (bitIndex!0 (size!6007 (buf!6509 (_1!11735 lt!391199))) (currentByte!11964 (_1!11735 lt!391199)) (currentBit!11959 (_1!11735 lt!391199))) lt!391195))))

(declare-fun b!251792 () Bool)

(declare-fun lt!391192 () tuple2!21614)

(declare-datatypes ((tuple2!21616 0))(
  ( (tuple2!21617 (_1!11736 BitStream!10936) (_2!11736 BitStream!10936)) )
))
(declare-fun lt!391194 () tuple2!21616)

(assert (=> b!251792 (= e!174467 (not (or (not (_2!11735 lt!391192)) (not (= (_1!11735 lt!391192) (_2!11736 lt!391194))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10936 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21614)

(assert (=> b!251792 (= lt!391192 (checkBitsLoopPure!0 (_1!11736 lt!391194) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251792 (validate_offset_bits!1 ((_ sign_extend 32) (size!6007 (buf!6509 (_2!11734 lt!391205)))) ((_ sign_extend 32) (currentByte!11964 (_2!11734 lt!391200))) ((_ sign_extend 32) (currentBit!11959 (_2!11734 lt!391200))) lt!391202)))

(declare-fun lt!391197 () Unit!18162)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10936 array!13696 (_ BitVec 64)) Unit!18162)

(assert (=> b!251792 (= lt!391197 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11734 lt!391200) (buf!6509 (_2!11734 lt!391205)) lt!391202))))

(declare-fun reader!0 (BitStream!10936 BitStream!10936) tuple2!21616)

(assert (=> b!251792 (= lt!391194 (reader!0 (_2!11734 lt!391200) (_2!11734 lt!391205)))))

(declare-fun b!251793 () Bool)

(declare-fun res!210897 () Bool)

(assert (=> b!251793 (=> (not res!210897) (not e!174465))))

(assert (=> b!251793 (= res!210897 (bvslt from!289 nBits!297))))

(declare-fun b!251794 () Bool)

(declare-fun res!210888 () Bool)

(declare-fun e!174470 () Bool)

(assert (=> b!251794 (=> (not res!210888) (not e!174470))))

(declare-fun isPrefixOf!0 (BitStream!10936 BitStream!10936) Bool)

(assert (=> b!251794 (= res!210888 (isPrefixOf!0 thiss!1005 (_2!11734 lt!391200)))))

(declare-fun b!251795 () Bool)

(declare-fun res!210891 () Bool)

(declare-fun e!174469 () Bool)

(assert (=> b!251795 (=> (not res!210891) (not e!174469))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251795 (= res!210891 (invariant!0 (currentBit!11959 thiss!1005) (currentByte!11964 thiss!1005) (size!6007 (buf!6509 (_2!11734 lt!391200)))))))

(declare-fun b!251796 () Bool)

(assert (=> b!251796 (= e!174470 e!174468)))

(declare-fun res!210899 () Bool)

(assert (=> b!251796 (=> (not res!210899) (not e!174468))))

(assert (=> b!251796 (= res!210899 (and (= (_2!11735 lt!391199) bit!26) (= (_1!11735 lt!391199) (_2!11734 lt!391200))))))

(declare-fun readBitPure!0 (BitStream!10936) tuple2!21614)

(declare-fun readerFrom!0 (BitStream!10936 (_ BitVec 32) (_ BitVec 32)) BitStream!10936)

(assert (=> b!251796 (= lt!391199 (readBitPure!0 (readerFrom!0 (_2!11734 lt!391200) (currentBit!11959 thiss!1005) (currentByte!11964 thiss!1005))))))

(declare-fun b!251798 () Bool)

(assert (=> b!251798 (= e!174469 (invariant!0 (currentBit!11959 thiss!1005) (currentByte!11964 thiss!1005) (size!6007 (buf!6509 (_2!11734 lt!391205)))))))

(declare-fun b!251799 () Bool)

(declare-fun res!210894 () Bool)

(assert (=> b!251799 (=> (not res!210894) (not e!174467))))

(assert (=> b!251799 (= res!210894 (isPrefixOf!0 (_2!11734 lt!391200) (_2!11734 lt!391205)))))

(declare-fun b!251800 () Bool)

(assert (=> b!251800 (= e!174465 (not true))))

(declare-fun lt!391193 () tuple2!21616)

(assert (=> b!251800 (= (_2!11735 (readBitPure!0 (_1!11736 lt!391193))) bit!26)))

(declare-fun lt!391191 () tuple2!21616)

(assert (=> b!251800 (= lt!391191 (reader!0 (_2!11734 lt!391200) (_2!11734 lt!391205)))))

(assert (=> b!251800 (= lt!391193 (reader!0 thiss!1005 (_2!11734 lt!391205)))))

(declare-fun e!174462 () Bool)

(assert (=> b!251800 e!174462))

(declare-fun res!210890 () Bool)

(assert (=> b!251800 (=> (not res!210890) (not e!174462))))

(declare-fun lt!391198 () tuple2!21614)

(declare-fun lt!391190 () tuple2!21614)

(assert (=> b!251800 (= res!210890 (= (bitIndex!0 (size!6007 (buf!6509 (_1!11735 lt!391198))) (currentByte!11964 (_1!11735 lt!391198)) (currentBit!11959 (_1!11735 lt!391198))) (bitIndex!0 (size!6007 (buf!6509 (_1!11735 lt!391190))) (currentByte!11964 (_1!11735 lt!391190)) (currentBit!11959 (_1!11735 lt!391190)))))))

(declare-fun lt!391196 () Unit!18162)

(declare-fun lt!391203 () BitStream!10936)

(declare-fun readBitPrefixLemma!0 (BitStream!10936 BitStream!10936) Unit!18162)

(assert (=> b!251800 (= lt!391196 (readBitPrefixLemma!0 lt!391203 (_2!11734 lt!391205)))))

(assert (=> b!251800 (= lt!391190 (readBitPure!0 (BitStream!10937 (buf!6509 (_2!11734 lt!391205)) (currentByte!11964 thiss!1005) (currentBit!11959 thiss!1005))))))

(assert (=> b!251800 (= lt!391198 (readBitPure!0 lt!391203))))

(assert (=> b!251800 (= lt!391203 (BitStream!10937 (buf!6509 (_2!11734 lt!391200)) (currentByte!11964 thiss!1005) (currentBit!11959 thiss!1005)))))

(assert (=> b!251800 e!174469))

(declare-fun res!210898 () Bool)

(assert (=> b!251800 (=> (not res!210898) (not e!174469))))

(assert (=> b!251800 (= res!210898 (isPrefixOf!0 thiss!1005 (_2!11734 lt!391205)))))

(declare-fun lt!391201 () Unit!18162)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10936 BitStream!10936 BitStream!10936) Unit!18162)

(assert (=> b!251800 (= lt!391201 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11734 lt!391200) (_2!11734 lt!391205)))))

(assert (=> b!251800 e!174464))

(declare-fun res!210895 () Bool)

(assert (=> b!251800 (=> (not res!210895) (not e!174464))))

(assert (=> b!251800 (= res!210895 (= (size!6007 (buf!6509 (_2!11734 lt!391200))) (size!6007 (buf!6509 (_2!11734 lt!391205)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10936 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21612)

(assert (=> b!251800 (= lt!391205 (appendNBitsLoop!0 (_2!11734 lt!391200) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251800 (validate_offset_bits!1 ((_ sign_extend 32) (size!6007 (buf!6509 (_2!11734 lt!391200)))) ((_ sign_extend 32) (currentByte!11964 (_2!11734 lt!391200))) ((_ sign_extend 32) (currentBit!11959 (_2!11734 lt!391200))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391204 () Unit!18162)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10936 BitStream!10936 (_ BitVec 64) (_ BitVec 64)) Unit!18162)

(assert (=> b!251800 (= lt!391204 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11734 lt!391200) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!174461 () Bool)

(assert (=> b!251800 e!174461))

(declare-fun res!210893 () Bool)

(assert (=> b!251800 (=> (not res!210893) (not e!174461))))

(assert (=> b!251800 (= res!210893 (= (size!6007 (buf!6509 thiss!1005)) (size!6007 (buf!6509 (_2!11734 lt!391200)))))))

(declare-fun appendBit!0 (BitStream!10936 Bool) tuple2!21612)

(assert (=> b!251800 (= lt!391200 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251801 () Bool)

(assert (=> b!251801 (= e!174462 (= (_2!11735 lt!391198) (_2!11735 lt!391190)))))

(declare-fun b!251797 () Bool)

(assert (=> b!251797 (= e!174461 e!174470)))

(declare-fun res!210892 () Bool)

(assert (=> b!251797 (=> (not res!210892) (not e!174470))))

(declare-fun lt!391206 () (_ BitVec 64))

(assert (=> b!251797 (= res!210892 (= lt!391195 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391206)))))

(assert (=> b!251797 (= lt!391195 (bitIndex!0 (size!6007 (buf!6509 (_2!11734 lt!391200))) (currentByte!11964 (_2!11734 lt!391200)) (currentBit!11959 (_2!11734 lt!391200))))))

(assert (=> b!251797 (= lt!391206 (bitIndex!0 (size!6007 (buf!6509 thiss!1005)) (currentByte!11964 thiss!1005) (currentBit!11959 thiss!1005)))))

(declare-fun res!210889 () Bool)

(assert (=> start!54072 (=> (not res!210889) (not e!174465))))

(assert (=> start!54072 (= res!210889 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54072 e!174465))

(assert (=> start!54072 true))

(declare-fun inv!12 (BitStream!10936) Bool)

(assert (=> start!54072 (and (inv!12 thiss!1005) e!174466)))

(assert (= (and start!54072 res!210889) b!251789))

(assert (= (and b!251789 res!210900) b!251793))

(assert (= (and b!251793 res!210897) b!251800))

(assert (= (and b!251800 res!210893) b!251797))

(assert (= (and b!251797 res!210892) b!251794))

(assert (= (and b!251794 res!210888) b!251796))

(assert (= (and b!251796 res!210899) b!251791))

(assert (= (and b!251800 res!210895) b!251788))

(assert (= (and b!251788 res!210896) b!251799))

(assert (= (and b!251799 res!210894) b!251792))

(assert (= (and b!251800 res!210898) b!251795))

(assert (= (and b!251795 res!210891) b!251798))

(assert (= (and b!251800 res!210890) b!251801))

(assert (= start!54072 b!251790))

(declare-fun m!378807 () Bool)

(assert (=> b!251791 m!378807))

(declare-fun m!378809 () Bool)

(assert (=> b!251797 m!378809))

(declare-fun m!378811 () Bool)

(assert (=> b!251797 m!378811))

(declare-fun m!378813 () Bool)

(assert (=> b!251800 m!378813))

(declare-fun m!378815 () Bool)

(assert (=> b!251800 m!378815))

(declare-fun m!378817 () Bool)

(assert (=> b!251800 m!378817))

(declare-fun m!378819 () Bool)

(assert (=> b!251800 m!378819))

(declare-fun m!378821 () Bool)

(assert (=> b!251800 m!378821))

(declare-fun m!378823 () Bool)

(assert (=> b!251800 m!378823))

(declare-fun m!378825 () Bool)

(assert (=> b!251800 m!378825))

(declare-fun m!378827 () Bool)

(assert (=> b!251800 m!378827))

(declare-fun m!378829 () Bool)

(assert (=> b!251800 m!378829))

(declare-fun m!378831 () Bool)

(assert (=> b!251800 m!378831))

(declare-fun m!378833 () Bool)

(assert (=> b!251800 m!378833))

(declare-fun m!378835 () Bool)

(assert (=> b!251800 m!378835))

(declare-fun m!378837 () Bool)

(assert (=> b!251800 m!378837))

(declare-fun m!378839 () Bool)

(assert (=> b!251800 m!378839))

(declare-fun m!378841 () Bool)

(assert (=> b!251796 m!378841))

(assert (=> b!251796 m!378841))

(declare-fun m!378843 () Bool)

(assert (=> b!251796 m!378843))

(declare-fun m!378845 () Bool)

(assert (=> b!251790 m!378845))

(declare-fun m!378847 () Bool)

(assert (=> b!251798 m!378847))

(declare-fun m!378849 () Bool)

(assert (=> b!251788 m!378849))

(assert (=> b!251788 m!378809))

(declare-fun m!378851 () Bool)

(assert (=> b!251794 m!378851))

(declare-fun m!378853 () Bool)

(assert (=> b!251795 m!378853))

(declare-fun m!378855 () Bool)

(assert (=> b!251799 m!378855))

(declare-fun m!378857 () Bool)

(assert (=> b!251792 m!378857))

(declare-fun m!378859 () Bool)

(assert (=> b!251792 m!378859))

(declare-fun m!378861 () Bool)

(assert (=> b!251792 m!378861))

(assert (=> b!251792 m!378821))

(declare-fun m!378863 () Bool)

(assert (=> b!251789 m!378863))

(declare-fun m!378865 () Bool)

(assert (=> start!54072 m!378865))

(push 1)

(assert (not b!251795))

(assert (not b!251789))

(assert (not b!251792))

(assert (not b!251797))

(assert (not b!251790))

(assert (not b!251796))

(assert (not b!251800))

(assert (not b!251791))

(assert (not b!251799))

(assert (not b!251794))

(assert (not start!54072))

(assert (not b!251788))

(assert (not b!251798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

