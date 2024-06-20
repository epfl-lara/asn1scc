; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26146 () Bool)

(assert start!26146)

(declare-fun b!133699 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6131 0))(
  ( (array!6132 (arr!3425 (Array (_ BitVec 32) (_ BitVec 8))) (size!2775 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4814 0))(
  ( (BitStream!4815 (buf!3158 array!6131) (currentByte!5949 (_ BitVec 32)) (currentBit!5944 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11586 0))(
  ( (tuple2!11587 (_1!6104 BitStream!4814) (_2!6104 array!6131)) )
))
(declare-fun lt!206929 () tuple2!11586)

(declare-fun arr!237 () array!6131)

(declare-fun e!88689 () Bool)

(declare-fun arrayRangesEq!178 (array!6131 array!6131 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!133699 (= e!88689 (not (arrayRangesEq!178 arr!237 (_2!6104 lt!206929) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!133700 () Bool)

(declare-fun res!111080 () Bool)

(declare-fun e!88681 () Bool)

(assert (=> b!133700 (=> (not res!111080) (not e!88681))))

(declare-fun thiss!1634 () BitStream!4814)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!133700 (= res!111080 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 thiss!1634))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!133701 () Bool)

(declare-fun e!88690 () Bool)

(declare-datatypes ((tuple2!11588 0))(
  ( (tuple2!11589 (_1!6105 BitStream!4814) (_2!6105 (_ BitVec 8))) )
))
(declare-fun lt!206928 () tuple2!11588)

(declare-fun lt!206931 () tuple2!11588)

(assert (=> b!133701 (= e!88690 (= (_2!6105 lt!206928) (_2!6105 lt!206931)))))

(declare-fun lt!206914 () tuple2!11586)

(declare-fun lt!206909 () tuple2!11586)

(declare-fun b!133702 () Bool)

(assert (=> b!133702 (= e!88681 (not (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsgt (size!2775 (_2!6104 lt!206914)) (size!2775 (_2!6104 lt!206909))) (bvsle to!404 (size!2775 (_2!6104 lt!206914))))))))

(declare-fun lt!206918 () tuple2!11586)

(assert (=> b!133702 (arrayRangesEq!178 (_2!6104 lt!206914) (_2!6104 lt!206918) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((Unit!8285 0))(
  ( (Unit!8286) )
))
(declare-fun lt!206915 () Unit!8285)

(declare-datatypes ((tuple2!11590 0))(
  ( (tuple2!11591 (_1!6106 BitStream!4814) (_2!6106 BitStream!4814)) )
))
(declare-fun lt!206911 () tuple2!11590)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4814 array!6131 (_ BitVec 32) (_ BitVec 32)) Unit!8285)

(assert (=> b!133702 (= lt!206915 (readByteArrayLoopArrayPrefixLemma!0 (_1!6106 lt!206911) arr!237 from!447 to!404))))

(declare-fun lt!206927 () array!6131)

(declare-fun readByteArrayLoopPure!0 (BitStream!4814 array!6131 (_ BitVec 32) (_ BitVec 32)) tuple2!11586)

(declare-fun withMovedByteIndex!0 (BitStream!4814 (_ BitVec 32)) BitStream!4814)

(assert (=> b!133702 (= lt!206918 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001) lt!206927 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206930 () tuple2!11590)

(assert (=> b!133702 (= lt!206909 (readByteArrayLoopPure!0 (_1!6106 lt!206930) lt!206927 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206920 () tuple2!11588)

(assert (=> b!133702 (= lt!206927 (array!6132 (store (arr!3425 arr!237) from!447 (_2!6105 lt!206920)) (size!2775 arr!237)))))

(declare-datatypes ((tuple2!11592 0))(
  ( (tuple2!11593 (_1!6107 Unit!8285) (_2!6107 BitStream!4814)) )
))
(declare-fun lt!206912 () tuple2!11592)

(declare-fun lt!206919 () tuple2!11592)

(declare-fun lt!206922 () (_ BitVec 32))

(assert (=> b!133702 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!206922)))

(declare-fun lt!206924 () Unit!8285)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4814 array!6131 (_ BitVec 32)) Unit!8285)

(assert (=> b!133702 (= lt!206924 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6107 lt!206919) (buf!3158 (_2!6107 lt!206912)) lt!206922))))

(assert (=> b!133702 (= (_1!6104 lt!206914) (_2!6106 lt!206911))))

(assert (=> b!133702 (= lt!206914 (readByteArrayLoopPure!0 (_1!6106 lt!206911) arr!237 from!447 to!404))))

(assert (=> b!133702 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!206923 () Unit!8285)

(assert (=> b!133702 (= lt!206923 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3158 (_2!6107 lt!206912)) (bvsub to!404 from!447)))))

(assert (=> b!133702 (= (_2!6105 lt!206920) (select (arr!3425 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4814) tuple2!11588)

(assert (=> b!133702 (= lt!206920 (readBytePure!0 (_1!6106 lt!206911)))))

(declare-fun reader!0 (BitStream!4814 BitStream!4814) tuple2!11590)

(assert (=> b!133702 (= lt!206930 (reader!0 (_2!6107 lt!206919) (_2!6107 lt!206912)))))

(assert (=> b!133702 (= lt!206911 (reader!0 thiss!1634 (_2!6107 lt!206912)))))

(assert (=> b!133702 e!88690))

(declare-fun res!111084 () Bool)

(assert (=> b!133702 (=> (not res!111084) (not e!88690))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!133702 (= res!111084 (= (bitIndex!0 (size!2775 (buf!3158 (_1!6105 lt!206928))) (currentByte!5949 (_1!6105 lt!206928)) (currentBit!5944 (_1!6105 lt!206928))) (bitIndex!0 (size!2775 (buf!3158 (_1!6105 lt!206931))) (currentByte!5949 (_1!6105 lt!206931)) (currentBit!5944 (_1!6105 lt!206931)))))))

(declare-fun lt!206908 () Unit!8285)

(declare-fun lt!206913 () BitStream!4814)

(declare-fun readBytePrefixLemma!0 (BitStream!4814 BitStream!4814) Unit!8285)

(assert (=> b!133702 (= lt!206908 (readBytePrefixLemma!0 lt!206913 (_2!6107 lt!206912)))))

(assert (=> b!133702 (= lt!206931 (readBytePure!0 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(assert (=> b!133702 (= lt!206928 (readBytePure!0 lt!206913))))

(assert (=> b!133702 (= lt!206913 (BitStream!4815 (buf!3158 (_2!6107 lt!206919)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))

(declare-fun e!88688 () Bool)

(assert (=> b!133702 e!88688))

(declare-fun res!111077 () Bool)

(assert (=> b!133702 (=> (not res!111077) (not e!88688))))

(declare-fun isPrefixOf!0 (BitStream!4814 BitStream!4814) Bool)

(assert (=> b!133702 (= res!111077 (isPrefixOf!0 thiss!1634 (_2!6107 lt!206912)))))

(declare-fun lt!206907 () Unit!8285)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4814 BitStream!4814 BitStream!4814) Unit!8285)

(assert (=> b!133702 (= lt!206907 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6107 lt!206919) (_2!6107 lt!206912)))))

(declare-fun e!88686 () Bool)

(assert (=> b!133702 e!88686))

(declare-fun res!111078 () Bool)

(assert (=> b!133702 (=> (not res!111078) (not e!88686))))

(assert (=> b!133702 (= res!111078 (= (size!2775 (buf!3158 (_2!6107 lt!206919))) (size!2775 (buf!3158 (_2!6107 lt!206912)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4814 array!6131 (_ BitVec 32) (_ BitVec 32)) tuple2!11592)

(assert (=> b!133702 (= lt!206912 (appendByteArrayLoop!0 (_2!6107 lt!206919) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!133702 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!206922)))

(assert (=> b!133702 (= lt!206922 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!206925 () Unit!8285)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4814 BitStream!4814 (_ BitVec 64) (_ BitVec 32)) Unit!8285)

(assert (=> b!133702 (= lt!206925 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6107 lt!206919) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!88687 () Bool)

(assert (=> b!133702 e!88687))

(declare-fun res!111086 () Bool)

(assert (=> b!133702 (=> (not res!111086) (not e!88687))))

(assert (=> b!133702 (= res!111086 (= (size!2775 (buf!3158 thiss!1634)) (size!2775 (buf!3158 (_2!6107 lt!206919)))))))

(declare-fun appendByte!0 (BitStream!4814 (_ BitVec 8)) tuple2!11592)

(assert (=> b!133702 (= lt!206919 (appendByte!0 thiss!1634 (select (arr!3425 arr!237) from!447)))))

(declare-fun b!133703 () Bool)

(declare-fun res!111088 () Bool)

(assert (=> b!133703 (=> (not res!111088) (not e!88687))))

(assert (=> b!133703 (= res!111088 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))))

(declare-fun b!133704 () Bool)

(declare-fun e!88682 () Bool)

(assert (=> b!133704 (= e!88686 e!88682)))

(declare-fun res!111087 () Bool)

(assert (=> b!133704 (=> (not res!111087) (not e!88682))))

(declare-fun lt!206917 () (_ BitVec 64))

(assert (=> b!133704 (= res!111087 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206912))) (currentByte!5949 (_2!6107 lt!206912)) (currentBit!5944 (_2!6107 lt!206912))) (bvadd (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!206917))))))

(assert (=> b!133704 (= lt!206917 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!111085 () Bool)

(assert (=> start!26146 (=> (not res!111085) (not e!88681))))

(assert (=> start!26146 (= res!111085 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2775 arr!237))))))

(assert (=> start!26146 e!88681))

(assert (=> start!26146 true))

(declare-fun array_inv!2564 (array!6131) Bool)

(assert (=> start!26146 (array_inv!2564 arr!237)))

(declare-fun e!88683 () Bool)

(declare-fun inv!12 (BitStream!4814) Bool)

(assert (=> start!26146 (and (inv!12 thiss!1634) e!88683)))

(declare-fun b!133705 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!133705 (= e!88688 (invariant!0 (currentBit!5944 thiss!1634) (currentByte!5949 thiss!1634) (size!2775 (buf!3158 (_2!6107 lt!206919)))))))

(declare-fun b!133706 () Bool)

(declare-fun res!111079 () Bool)

(assert (=> b!133706 (=> (not res!111079) (not e!88687))))

(assert (=> b!133706 (= res!111079 (isPrefixOf!0 thiss!1634 (_2!6107 lt!206919)))))

(declare-fun b!133707 () Bool)

(assert (=> b!133707 (= e!88683 (array_inv!2564 (buf!3158 thiss!1634)))))

(declare-fun lt!206916 () tuple2!11588)

(declare-fun lt!206926 () tuple2!11590)

(declare-fun b!133708 () Bool)

(assert (=> b!133708 (= e!88687 (and (= (_2!6105 lt!206916) (select (arr!3425 arr!237) from!447)) (= (_1!6105 lt!206916) (_2!6106 lt!206926))))))

(assert (=> b!133708 (= lt!206916 (readBytePure!0 (_1!6106 lt!206926)))))

(assert (=> b!133708 (= lt!206926 (reader!0 thiss!1634 (_2!6107 lt!206919)))))

(declare-fun b!133709 () Bool)

(declare-fun res!111089 () Bool)

(assert (=> b!133709 (=> (not res!111089) (not e!88681))))

(assert (=> b!133709 (= res!111089 (invariant!0 (currentBit!5944 thiss!1634) (currentByte!5949 thiss!1634) (size!2775 (buf!3158 thiss!1634))))))

(declare-fun b!133710 () Bool)

(assert (=> b!133710 (= e!88682 (not e!88689))))

(declare-fun res!111083 () Bool)

(assert (=> b!133710 (=> res!111083 e!88689)))

(declare-fun lt!206921 () tuple2!11590)

(assert (=> b!133710 (= res!111083 (or (not (= (size!2775 (_2!6104 lt!206929)) (size!2775 arr!237))) (not (= (_1!6104 lt!206929) (_2!6106 lt!206921)))))))

(assert (=> b!133710 (= lt!206929 (readByteArrayLoopPure!0 (_1!6106 lt!206921) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!133710 (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!206917)))

(declare-fun lt!206910 () Unit!8285)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4814 array!6131 (_ BitVec 64)) Unit!8285)

(assert (=> b!133710 (= lt!206910 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6107 lt!206919) (buf!3158 (_2!6107 lt!206912)) lt!206917))))

(assert (=> b!133710 (= lt!206921 (reader!0 (_2!6107 lt!206919) (_2!6107 lt!206912)))))

(declare-fun b!133711 () Bool)

(declare-fun res!111082 () Bool)

(assert (=> b!133711 (=> (not res!111082) (not e!88682))))

(assert (=> b!133711 (= res!111082 (isPrefixOf!0 (_2!6107 lt!206919) (_2!6107 lt!206912)))))

(declare-fun b!133712 () Bool)

(declare-fun res!111081 () Bool)

(assert (=> b!133712 (=> (not res!111081) (not e!88681))))

(assert (=> b!133712 (= res!111081 (bvslt from!447 to!404))))

(assert (= (and start!26146 res!111085) b!133700))

(assert (= (and b!133700 res!111080) b!133712))

(assert (= (and b!133712 res!111081) b!133709))

(assert (= (and b!133709 res!111089) b!133702))

(assert (= (and b!133702 res!111086) b!133703))

(assert (= (and b!133703 res!111088) b!133706))

(assert (= (and b!133706 res!111079) b!133708))

(assert (= (and b!133702 res!111078) b!133704))

(assert (= (and b!133704 res!111087) b!133711))

(assert (= (and b!133711 res!111082) b!133710))

(assert (= (and b!133710 (not res!111083)) b!133699))

(assert (= (and b!133702 res!111077) b!133705))

(assert (= (and b!133702 res!111084) b!133701))

(assert (= start!26146 b!133707))

(declare-fun m!202841 () Bool)

(assert (=> b!133709 m!202841))

(declare-fun m!202843 () Bool)

(assert (=> b!133711 m!202843))

(declare-fun m!202845 () Bool)

(assert (=> b!133710 m!202845))

(declare-fun m!202847 () Bool)

(assert (=> b!133710 m!202847))

(declare-fun m!202849 () Bool)

(assert (=> b!133710 m!202849))

(declare-fun m!202851 () Bool)

(assert (=> b!133710 m!202851))

(declare-fun m!202853 () Bool)

(assert (=> b!133702 m!202853))

(declare-fun m!202855 () Bool)

(assert (=> b!133702 m!202855))

(declare-fun m!202857 () Bool)

(assert (=> b!133702 m!202857))

(declare-fun m!202859 () Bool)

(assert (=> b!133702 m!202859))

(declare-fun m!202861 () Bool)

(assert (=> b!133702 m!202861))

(declare-fun m!202863 () Bool)

(assert (=> b!133702 m!202863))

(declare-fun m!202865 () Bool)

(assert (=> b!133702 m!202865))

(assert (=> b!133702 m!202863))

(declare-fun m!202867 () Bool)

(assert (=> b!133702 m!202867))

(declare-fun m!202869 () Bool)

(assert (=> b!133702 m!202869))

(declare-fun m!202871 () Bool)

(assert (=> b!133702 m!202871))

(declare-fun m!202873 () Bool)

(assert (=> b!133702 m!202873))

(declare-fun m!202875 () Bool)

(assert (=> b!133702 m!202875))

(declare-fun m!202877 () Bool)

(assert (=> b!133702 m!202877))

(declare-fun m!202879 () Bool)

(assert (=> b!133702 m!202879))

(declare-fun m!202881 () Bool)

(assert (=> b!133702 m!202881))

(declare-fun m!202883 () Bool)

(assert (=> b!133702 m!202883))

(declare-fun m!202885 () Bool)

(assert (=> b!133702 m!202885))

(declare-fun m!202887 () Bool)

(assert (=> b!133702 m!202887))

(declare-fun m!202889 () Bool)

(assert (=> b!133702 m!202889))

(declare-fun m!202891 () Bool)

(assert (=> b!133702 m!202891))

(declare-fun m!202893 () Bool)

(assert (=> b!133702 m!202893))

(declare-fun m!202895 () Bool)

(assert (=> b!133702 m!202895))

(declare-fun m!202897 () Bool)

(assert (=> b!133702 m!202897))

(declare-fun m!202899 () Bool)

(assert (=> b!133702 m!202899))

(assert (=> b!133702 m!202875))

(declare-fun m!202901 () Bool)

(assert (=> b!133702 m!202901))

(assert (=> b!133702 m!202851))

(declare-fun m!202903 () Bool)

(assert (=> b!133700 m!202903))

(declare-fun m!202905 () Bool)

(assert (=> b!133707 m!202905))

(declare-fun m!202907 () Bool)

(assert (=> b!133699 m!202907))

(assert (=> b!133708 m!202875))

(declare-fun m!202909 () Bool)

(assert (=> b!133708 m!202909))

(declare-fun m!202911 () Bool)

(assert (=> b!133708 m!202911))

(declare-fun m!202913 () Bool)

(assert (=> b!133703 m!202913))

(declare-fun m!202915 () Bool)

(assert (=> b!133703 m!202915))

(declare-fun m!202917 () Bool)

(assert (=> b!133705 m!202917))

(declare-fun m!202919 () Bool)

(assert (=> b!133704 m!202919))

(assert (=> b!133704 m!202913))

(declare-fun m!202921 () Bool)

(assert (=> b!133706 m!202921))

(declare-fun m!202923 () Bool)

(assert (=> start!26146 m!202923))

(declare-fun m!202925 () Bool)

(assert (=> start!26146 m!202925))

(push 1)

(assert (not b!133705))

(assert (not b!133710))

(assert (not b!133703))

(assert (not b!133704))

(assert (not b!133706))

(assert (not b!133702))

(assert (not b!133700))

(assert (not b!133709))

(assert (not b!133708))

(assert (not start!26146))

(assert (not b!133711))

(assert (not b!133707))

(assert (not b!133699))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!42825 () Bool)

(declare-fun res!111137 () Bool)

(declare-fun e!88724 () Bool)

(assert (=> d!42825 (=> (not res!111137) (not e!88724))))

(assert (=> d!42825 (= res!111137 (= (size!2775 (buf!3158 (_2!6107 lt!206919))) (size!2775 (buf!3158 (_2!6107 lt!206912)))))))

(assert (=> d!42825 (= (isPrefixOf!0 (_2!6107 lt!206919) (_2!6107 lt!206912)) e!88724)))

(declare-fun b!133768 () Bool)

(declare-fun res!111139 () Bool)

(assert (=> b!133768 (=> (not res!111139) (not e!88724))))

(assert (=> b!133768 (= res!111139 (bvsle (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206912))) (currentByte!5949 (_2!6107 lt!206912)) (currentBit!5944 (_2!6107 lt!206912)))))))

(declare-fun b!133769 () Bool)

(declare-fun e!88725 () Bool)

(assert (=> b!133769 (= e!88724 e!88725)))

(declare-fun res!111138 () Bool)

(assert (=> b!133769 (=> res!111138 e!88725)))

(assert (=> b!133769 (= res!111138 (= (size!2775 (buf!3158 (_2!6107 lt!206919))) #b00000000000000000000000000000000))))

(declare-fun b!133770 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6131 array!6131 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!133770 (= e!88725 (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206919)) (buf!3158 (_2!6107 lt!206912)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))))))

(assert (= (and d!42825 res!111137) b!133768))

(assert (= (and b!133768 res!111139) b!133769))

(assert (= (and b!133769 (not res!111138)) b!133770))

(assert (=> b!133768 m!202913))

(assert (=> b!133768 m!202919))

(assert (=> b!133770 m!202913))

(assert (=> b!133770 m!202913))

(declare-fun m!203029 () Bool)

(assert (=> b!133770 m!203029))

(assert (=> b!133711 d!42825))

(declare-fun d!42827 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!42827 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 thiss!1634))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 thiss!1634))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10448 () Bool)

(assert (= bs!10448 d!42827))

(declare-fun m!203031 () Bool)

(assert (=> bs!10448 m!203031))

(assert (=> b!133700 d!42827))

(declare-datatypes ((tuple3!510 0))(
  ( (tuple3!511 (_1!6110 Unit!8285) (_2!6110 BitStream!4814) (_3!312 array!6131)) )
))
(declare-fun lt!207071 () tuple3!510)

(declare-fun d!42829 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4814 array!6131 (_ BitVec 32) (_ BitVec 32)) tuple3!510)

(assert (=> d!42829 (= lt!207071 (readByteArrayLoop!0 (_1!6106 lt!206921) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42829 (= (readByteArrayLoopPure!0 (_1!6106 lt!206921) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11587 (_2!6110 lt!207071) (_3!312 lt!207071)))))

(declare-fun bs!10449 () Bool)

(assert (= bs!10449 d!42829))

(declare-fun m!203033 () Bool)

(assert (=> bs!10449 m!203033))

(assert (=> b!133710 d!42829))

(declare-fun d!42831 () Bool)

(assert (=> d!42831 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!206917) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919)))) lt!206917))))

(declare-fun bs!10450 () Bool)

(assert (= bs!10450 d!42831))

(declare-fun m!203035 () Bool)

(assert (=> bs!10450 m!203035))

(assert (=> b!133710 d!42831))

(declare-fun d!42833 () Bool)

(assert (=> d!42833 (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!206917)))

(declare-fun lt!207074 () Unit!8285)

(declare-fun choose!9 (BitStream!4814 array!6131 (_ BitVec 64) BitStream!4814) Unit!8285)

(assert (=> d!42833 (= lt!207074 (choose!9 (_2!6107 lt!206919) (buf!3158 (_2!6107 lt!206912)) lt!206917 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))))))

(assert (=> d!42833 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6107 lt!206919) (buf!3158 (_2!6107 lt!206912)) lt!206917) lt!207074)))

(declare-fun bs!10451 () Bool)

(assert (= bs!10451 d!42833))

(assert (=> bs!10451 m!202847))

(declare-fun m!203037 () Bool)

(assert (=> bs!10451 m!203037))

(assert (=> b!133710 d!42833))

(declare-fun b!133801 () Bool)

(declare-fun e!88742 () Unit!8285)

(declare-fun Unit!8290 () Unit!8285)

(assert (=> b!133801 (= e!88742 Unit!8290)))

(declare-fun d!42835 () Bool)

(declare-fun e!88741 () Bool)

(assert (=> d!42835 e!88741))

(declare-fun res!111165 () Bool)

(assert (=> d!42835 (=> (not res!111165) (not e!88741))))

(declare-fun lt!207173 () tuple2!11590)

(assert (=> d!42835 (= res!111165 (isPrefixOf!0 (_1!6106 lt!207173) (_2!6106 lt!207173)))))

(declare-fun lt!207169 () BitStream!4814)

(assert (=> d!42835 (= lt!207173 (tuple2!11591 lt!207169 (_2!6107 lt!206912)))))

(declare-fun lt!207177 () Unit!8285)

(declare-fun lt!207171 () Unit!8285)

(assert (=> d!42835 (= lt!207177 lt!207171)))

(assert (=> d!42835 (isPrefixOf!0 lt!207169 (_2!6107 lt!206912))))

(assert (=> d!42835 (= lt!207171 (lemmaIsPrefixTransitive!0 lt!207169 (_2!6107 lt!206912) (_2!6107 lt!206912)))))

(declare-fun lt!207162 () Unit!8285)

(declare-fun lt!207165 () Unit!8285)

(assert (=> d!42835 (= lt!207162 lt!207165)))

(assert (=> d!42835 (isPrefixOf!0 lt!207169 (_2!6107 lt!206912))))

(assert (=> d!42835 (= lt!207165 (lemmaIsPrefixTransitive!0 lt!207169 (_2!6107 lt!206919) (_2!6107 lt!206912)))))

(declare-fun lt!207168 () Unit!8285)

(assert (=> d!42835 (= lt!207168 e!88742)))

(declare-fun c!7639 () Bool)

(assert (=> d!42835 (= c!7639 (not (= (size!2775 (buf!3158 (_2!6107 lt!206919))) #b00000000000000000000000000000000)))))

(declare-fun lt!207167 () Unit!8285)

(declare-fun lt!207164 () Unit!8285)

(assert (=> d!42835 (= lt!207167 lt!207164)))

(assert (=> d!42835 (isPrefixOf!0 (_2!6107 lt!206912) (_2!6107 lt!206912))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4814) Unit!8285)

(assert (=> d!42835 (= lt!207164 (lemmaIsPrefixRefl!0 (_2!6107 lt!206912)))))

(declare-fun lt!207181 () Unit!8285)

(declare-fun lt!207172 () Unit!8285)

(assert (=> d!42835 (= lt!207181 lt!207172)))

(assert (=> d!42835 (= lt!207172 (lemmaIsPrefixRefl!0 (_2!6107 lt!206912)))))

(declare-fun lt!207175 () Unit!8285)

(declare-fun lt!207174 () Unit!8285)

(assert (=> d!42835 (= lt!207175 lt!207174)))

(assert (=> d!42835 (isPrefixOf!0 lt!207169 lt!207169)))

(assert (=> d!42835 (= lt!207174 (lemmaIsPrefixRefl!0 lt!207169))))

(declare-fun lt!207170 () Unit!8285)

(declare-fun lt!207163 () Unit!8285)

(assert (=> d!42835 (= lt!207170 lt!207163)))

(assert (=> d!42835 (isPrefixOf!0 (_2!6107 lt!206919) (_2!6107 lt!206919))))

(assert (=> d!42835 (= lt!207163 (lemmaIsPrefixRefl!0 (_2!6107 lt!206919)))))

(assert (=> d!42835 (= lt!207169 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))))))

(assert (=> d!42835 (isPrefixOf!0 (_2!6107 lt!206919) (_2!6107 lt!206912))))

(assert (=> d!42835 (= (reader!0 (_2!6107 lt!206919) (_2!6107 lt!206912)) lt!207173)))

(declare-fun b!133802 () Bool)

(declare-fun res!111164 () Bool)

(assert (=> b!133802 (=> (not res!111164) (not e!88741))))

(assert (=> b!133802 (= res!111164 (isPrefixOf!0 (_2!6106 lt!207173) (_2!6107 lt!206912)))))

(declare-fun b!133803 () Bool)

(declare-fun res!111166 () Bool)

(assert (=> b!133803 (=> (not res!111166) (not e!88741))))

(assert (=> b!133803 (= res!111166 (isPrefixOf!0 (_1!6106 lt!207173) (_2!6107 lt!206919)))))

(declare-fun lt!207176 () (_ BitVec 64))

(declare-fun lt!207178 () (_ BitVec 64))

(declare-fun b!133804 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4814 (_ BitVec 64)) BitStream!4814)

(assert (=> b!133804 (= e!88741 (= (_1!6106 lt!207173) (withMovedBitIndex!0 (_2!6106 lt!207173) (bvsub lt!207178 lt!207176))))))

(assert (=> b!133804 (or (= (bvand lt!207178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207176 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207178 lt!207176) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133804 (= lt!207176 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206912))) (currentByte!5949 (_2!6107 lt!206912)) (currentBit!5944 (_2!6107 lt!206912))))))

(assert (=> b!133804 (= lt!207178 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))))))

(declare-fun b!133805 () Bool)

(declare-fun lt!207180 () Unit!8285)

(assert (=> b!133805 (= e!88742 lt!207180)))

(declare-fun lt!207166 () (_ BitVec 64))

(assert (=> b!133805 (= lt!207166 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!207179 () (_ BitVec 64))

(assert (=> b!133805 (= lt!207179 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6131 array!6131 (_ BitVec 64) (_ BitVec 64)) Unit!8285)

(assert (=> b!133805 (= lt!207180 (arrayBitRangesEqSymmetric!0 (buf!3158 (_2!6107 lt!206919)) (buf!3158 (_2!6107 lt!206912)) lt!207166 lt!207179))))

(assert (=> b!133805 (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206912)) (buf!3158 (_2!6107 lt!206919)) lt!207166 lt!207179)))

(assert (= (and d!42835 c!7639) b!133805))

(assert (= (and d!42835 (not c!7639)) b!133801))

(assert (= (and d!42835 res!111165) b!133803))

(assert (= (and b!133803 res!111166) b!133802))

(assert (= (and b!133802 res!111164) b!133804))

(assert (=> b!133805 m!202913))

(declare-fun m!203081 () Bool)

(assert (=> b!133805 m!203081))

(declare-fun m!203083 () Bool)

(assert (=> b!133805 m!203083))

(declare-fun m!203085 () Bool)

(assert (=> d!42835 m!203085))

(declare-fun m!203087 () Bool)

(assert (=> d!42835 m!203087))

(assert (=> d!42835 m!202843))

(declare-fun m!203089 () Bool)

(assert (=> d!42835 m!203089))

(declare-fun m!203091 () Bool)

(assert (=> d!42835 m!203091))

(declare-fun m!203093 () Bool)

(assert (=> d!42835 m!203093))

(declare-fun m!203095 () Bool)

(assert (=> d!42835 m!203095))

(declare-fun m!203097 () Bool)

(assert (=> d!42835 m!203097))

(declare-fun m!203099 () Bool)

(assert (=> d!42835 m!203099))

(declare-fun m!203101 () Bool)

(assert (=> d!42835 m!203101))

(declare-fun m!203103 () Bool)

(assert (=> d!42835 m!203103))

(declare-fun m!203105 () Bool)

(assert (=> b!133802 m!203105))

(declare-fun m!203107 () Bool)

(assert (=> b!133804 m!203107))

(assert (=> b!133804 m!202919))

(assert (=> b!133804 m!202913))

(declare-fun m!203109 () Bool)

(assert (=> b!133803 m!203109))

(assert (=> b!133710 d!42835))

(declare-fun d!42843 () Bool)

(declare-fun res!111171 () Bool)

(declare-fun e!88747 () Bool)

(assert (=> d!42843 (=> res!111171 e!88747)))

(assert (=> d!42843 (= res!111171 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42843 (= (arrayRangesEq!178 arr!237 (_2!6104 lt!206929) #b00000000000000000000000000000000 to!404) e!88747)))

(declare-fun b!133810 () Bool)

(declare-fun e!88748 () Bool)

(assert (=> b!133810 (= e!88747 e!88748)))

(declare-fun res!111172 () Bool)

(assert (=> b!133810 (=> (not res!111172) (not e!88748))))

(assert (=> b!133810 (= res!111172 (= (select (arr!3425 arr!237) #b00000000000000000000000000000000) (select (arr!3425 (_2!6104 lt!206929)) #b00000000000000000000000000000000)))))

(declare-fun b!133811 () Bool)

(assert (=> b!133811 (= e!88748 (arrayRangesEq!178 arr!237 (_2!6104 lt!206929) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42843 (not res!111171)) b!133810))

(assert (= (and b!133810 res!111172) b!133811))

(declare-fun m!203111 () Bool)

(assert (=> b!133810 m!203111))

(declare-fun m!203113 () Bool)

(assert (=> b!133810 m!203113))

(declare-fun m!203115 () Bool)

(assert (=> b!133811 m!203115))

(assert (=> b!133699 d!42843))

(declare-fun d!42845 () Bool)

(declare-fun e!88754 () Bool)

(assert (=> d!42845 e!88754))

(declare-fun res!111180 () Bool)

(assert (=> d!42845 (=> (not res!111180) (not e!88754))))

(declare-fun lt!207215 () (_ BitVec 64))

(declare-fun lt!207211 () (_ BitVec 64))

(declare-fun lt!207212 () (_ BitVec 64))

(assert (=> d!42845 (= res!111180 (= lt!207212 (bvsub lt!207211 lt!207215)))))

(assert (=> d!42845 (or (= (bvand lt!207211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207215 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207211 lt!207215) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42845 (= lt!207215 (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206912))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206912)))))))

(declare-fun lt!207214 () (_ BitVec 64))

(declare-fun lt!207213 () (_ BitVec 64))

(assert (=> d!42845 (= lt!207211 (bvmul lt!207214 lt!207213))))

(assert (=> d!42845 (or (= lt!207214 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207213 (bvsdiv (bvmul lt!207214 lt!207213) lt!207214)))))

(assert (=> d!42845 (= lt!207213 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42845 (= lt!207214 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))))))

(assert (=> d!42845 (= lt!207212 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206912))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206912)))))))

(assert (=> d!42845 (invariant!0 (currentBit!5944 (_2!6107 lt!206912)) (currentByte!5949 (_2!6107 lt!206912)) (size!2775 (buf!3158 (_2!6107 lt!206912))))))

(assert (=> d!42845 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206912))) (currentByte!5949 (_2!6107 lt!206912)) (currentBit!5944 (_2!6107 lt!206912))) lt!207212)))

(declare-fun b!133819 () Bool)

(declare-fun res!111181 () Bool)

(assert (=> b!133819 (=> (not res!111181) (not e!88754))))

(assert (=> b!133819 (= res!111181 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207212))))

(declare-fun b!133820 () Bool)

(declare-fun lt!207216 () (_ BitVec 64))

(assert (=> b!133820 (= e!88754 (bvsle lt!207212 (bvmul lt!207216 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133820 (or (= lt!207216 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207216 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207216)))))

(assert (=> b!133820 (= lt!207216 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))))))

(assert (= (and d!42845 res!111180) b!133819))

(assert (= (and b!133819 res!111181) b!133820))

(declare-fun m!203131 () Bool)

(assert (=> d!42845 m!203131))

(declare-fun m!203133 () Bool)

(assert (=> d!42845 m!203133))

(assert (=> b!133704 d!42845))

(declare-fun d!42855 () Bool)

(declare-fun e!88755 () Bool)

(assert (=> d!42855 e!88755))

(declare-fun res!111182 () Bool)

(assert (=> d!42855 (=> (not res!111182) (not e!88755))))

(declare-fun lt!207218 () (_ BitVec 64))

(declare-fun lt!207217 () (_ BitVec 64))

(declare-fun lt!207221 () (_ BitVec 64))

(assert (=> d!42855 (= res!111182 (= lt!207218 (bvsub lt!207217 lt!207221)))))

(assert (=> d!42855 (or (= (bvand lt!207217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207221 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207217 lt!207221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42855 (= lt!207221 (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919)))))))

(declare-fun lt!207220 () (_ BitVec 64))

(declare-fun lt!207219 () (_ BitVec 64))

(assert (=> d!42855 (= lt!207217 (bvmul lt!207220 lt!207219))))

(assert (=> d!42855 (or (= lt!207220 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207219 (bvsdiv (bvmul lt!207220 lt!207219) lt!207220)))))

(assert (=> d!42855 (= lt!207219 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42855 (= lt!207220 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))))))

(assert (=> d!42855 (= lt!207218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919)))))))

(assert (=> d!42855 (invariant!0 (currentBit!5944 (_2!6107 lt!206919)) (currentByte!5949 (_2!6107 lt!206919)) (size!2775 (buf!3158 (_2!6107 lt!206919))))))

(assert (=> d!42855 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))) lt!207218)))

(declare-fun b!133821 () Bool)

(declare-fun res!111183 () Bool)

(assert (=> b!133821 (=> (not res!111183) (not e!88755))))

(assert (=> b!133821 (= res!111183 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207218))))

(declare-fun b!133822 () Bool)

(declare-fun lt!207222 () (_ BitVec 64))

(assert (=> b!133822 (= e!88755 (bvsle lt!207218 (bvmul lt!207222 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133822 (or (= lt!207222 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207222 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207222)))))

(assert (=> b!133822 (= lt!207222 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))))))

(assert (= (and d!42855 res!111182) b!133821))

(assert (= (and b!133821 res!111183) b!133822))

(declare-fun m!203135 () Bool)

(assert (=> d!42855 m!203135))

(declare-fun m!203137 () Bool)

(assert (=> d!42855 m!203137))

(assert (=> b!133704 d!42855))

(assert (=> b!133703 d!42855))

(declare-fun d!42857 () Bool)

(declare-fun e!88756 () Bool)

(assert (=> d!42857 e!88756))

(declare-fun res!111184 () Bool)

(assert (=> d!42857 (=> (not res!111184) (not e!88756))))

(declare-fun lt!207224 () (_ BitVec 64))

(declare-fun lt!207227 () (_ BitVec 64))

(declare-fun lt!207223 () (_ BitVec 64))

(assert (=> d!42857 (= res!111184 (= lt!207224 (bvsub lt!207223 lt!207227)))))

(assert (=> d!42857 (or (= (bvand lt!207223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207227 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207223 lt!207227) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42857 (= lt!207227 (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 thiss!1634))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634))))))

(declare-fun lt!207226 () (_ BitVec 64))

(declare-fun lt!207225 () (_ BitVec 64))

(assert (=> d!42857 (= lt!207223 (bvmul lt!207226 lt!207225))))

(assert (=> d!42857 (or (= lt!207226 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207225 (bvsdiv (bvmul lt!207226 lt!207225) lt!207226)))))

(assert (=> d!42857 (= lt!207225 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42857 (= lt!207226 ((_ sign_extend 32) (size!2775 (buf!3158 thiss!1634))))))

(assert (=> d!42857 (= lt!207224 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 thiss!1634))))))

(assert (=> d!42857 (invariant!0 (currentBit!5944 thiss!1634) (currentByte!5949 thiss!1634) (size!2775 (buf!3158 thiss!1634)))))

(assert (=> d!42857 (= (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)) lt!207224)))

(declare-fun b!133823 () Bool)

(declare-fun res!111185 () Bool)

(assert (=> b!133823 (=> (not res!111185) (not e!88756))))

(assert (=> b!133823 (= res!111185 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207224))))

(declare-fun b!133824 () Bool)

(declare-fun lt!207228 () (_ BitVec 64))

(assert (=> b!133824 (= e!88756 (bvsle lt!207224 (bvmul lt!207228 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133824 (or (= lt!207228 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207228 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207228)))))

(assert (=> b!133824 (= lt!207228 ((_ sign_extend 32) (size!2775 (buf!3158 thiss!1634))))))

(assert (= (and d!42857 res!111184) b!133823))

(assert (= (and b!133823 res!111185) b!133824))

(assert (=> d!42857 m!203031))

(assert (=> d!42857 m!202841))

(assert (=> b!133703 d!42857))

(declare-fun d!42859 () Bool)

(declare-fun e!88757 () Bool)

(assert (=> d!42859 e!88757))

(declare-fun res!111186 () Bool)

(assert (=> d!42859 (=> (not res!111186) (not e!88757))))

(declare-fun lt!207229 () (_ BitVec 64))

(declare-fun lt!207233 () (_ BitVec 64))

(declare-fun lt!207230 () (_ BitVec 64))

(assert (=> d!42859 (= res!111186 (= lt!207230 (bvsub lt!207229 lt!207233)))))

(assert (=> d!42859 (or (= (bvand lt!207229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207233 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207229 lt!207233) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42859 (= lt!207233 (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!206931)))) ((_ sign_extend 32) (currentByte!5949 (_1!6105 lt!206931))) ((_ sign_extend 32) (currentBit!5944 (_1!6105 lt!206931)))))))

(declare-fun lt!207232 () (_ BitVec 64))

(declare-fun lt!207231 () (_ BitVec 64))

(assert (=> d!42859 (= lt!207229 (bvmul lt!207232 lt!207231))))

(assert (=> d!42859 (or (= lt!207232 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207231 (bvsdiv (bvmul lt!207232 lt!207231) lt!207232)))))

(assert (=> d!42859 (= lt!207231 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42859 (= lt!207232 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!206931)))))))

(assert (=> d!42859 (= lt!207230 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 (_1!6105 lt!206931))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 (_1!6105 lt!206931)))))))

(assert (=> d!42859 (invariant!0 (currentBit!5944 (_1!6105 lt!206931)) (currentByte!5949 (_1!6105 lt!206931)) (size!2775 (buf!3158 (_1!6105 lt!206931))))))

(assert (=> d!42859 (= (bitIndex!0 (size!2775 (buf!3158 (_1!6105 lt!206931))) (currentByte!5949 (_1!6105 lt!206931)) (currentBit!5944 (_1!6105 lt!206931))) lt!207230)))

(declare-fun b!133825 () Bool)

(declare-fun res!111187 () Bool)

(assert (=> b!133825 (=> (not res!111187) (not e!88757))))

(assert (=> b!133825 (= res!111187 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207230))))

(declare-fun b!133826 () Bool)

(declare-fun lt!207234 () (_ BitVec 64))

(assert (=> b!133826 (= e!88757 (bvsle lt!207230 (bvmul lt!207234 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133826 (or (= lt!207234 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207234 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207234)))))

(assert (=> b!133826 (= lt!207234 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!206931)))))))

(assert (= (and d!42859 res!111186) b!133825))

(assert (= (and b!133825 res!111187) b!133826))

(declare-fun m!203139 () Bool)

(assert (=> d!42859 m!203139))

(declare-fun m!203141 () Bool)

(assert (=> d!42859 m!203141))

(assert (=> b!133702 d!42859))

(declare-fun d!42861 () Bool)

(declare-fun e!88760 () Bool)

(assert (=> d!42861 e!88760))

(declare-fun res!111190 () Bool)

(assert (=> d!42861 (=> (not res!111190) (not e!88760))))

(assert (=> d!42861 (= res!111190 (and (or (let ((rhs!3117 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3117 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3117) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!42862 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!42862 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!42862 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3116 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3116 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3116) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!207241 () Unit!8285)

(declare-fun choose!57 (BitStream!4814 BitStream!4814 (_ BitVec 64) (_ BitVec 32)) Unit!8285)

(assert (=> d!42861 (= lt!207241 (choose!57 thiss!1634 (_2!6107 lt!206919) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!42861 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6107 lt!206919) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!207241)))

(declare-fun b!133829 () Bool)

(declare-fun lt!207242 () (_ BitVec 32))

(assert (=> b!133829 (= e!88760 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) (bvsub (bvsub to!404 from!447) lt!207242)))))

(assert (=> b!133829 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!207242 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!207242) #b10000000000000000000000000000000)))))

(declare-fun lt!207243 () (_ BitVec 64))

(assert (=> b!133829 (= lt!207242 ((_ extract 31 0) lt!207243))))

(assert (=> b!133829 (and (bvslt lt!207243 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!207243 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!133829 (= lt!207243 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!42861 res!111190) b!133829))

(declare-fun m!203143 () Bool)

(assert (=> d!42861 m!203143))

(declare-fun m!203145 () Bool)

(assert (=> b!133829 m!203145))

(assert (=> b!133702 d!42861))

(declare-fun b!133860 () Bool)

(declare-fun res!111224 () Bool)

(declare-fun e!88779 () Bool)

(assert (=> b!133860 (=> (not res!111224) (not e!88779))))

(declare-fun lt!207302 () tuple2!11592)

(assert (=> b!133860 (= res!111224 (isPrefixOf!0 (_2!6107 lt!206919) (_2!6107 lt!207302)))))

(declare-fun d!42864 () Bool)

(assert (=> d!42864 e!88779))

(declare-fun res!111225 () Bool)

(assert (=> d!42864 (=> (not res!111225) (not e!88779))))

(assert (=> d!42864 (= res!111225 (= (size!2775 (buf!3158 (_2!6107 lt!206919))) (size!2775 (buf!3158 (_2!6107 lt!207302)))))))

(declare-fun choose!64 (BitStream!4814 array!6131 (_ BitVec 32) (_ BitVec 32)) tuple2!11592)

(assert (=> d!42864 (= lt!207302 (choose!64 (_2!6107 lt!206919) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42864 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2775 arr!237)))))

(assert (=> d!42864 (= (appendByteArrayLoop!0 (_2!6107 lt!206919) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!207302)))

(declare-fun e!88778 () Bool)

(declare-fun lt!207300 () tuple2!11586)

(declare-fun b!133861 () Bool)

(assert (=> b!133861 (= e!88778 (arrayRangesEq!178 arr!237 (_2!6104 lt!207300) #b00000000000000000000000000000000 to!404))))

(declare-fun b!133862 () Bool)

(declare-fun res!111221 () Bool)

(assert (=> b!133862 (=> (not res!111221) (not e!88779))))

(declare-fun lt!207307 () (_ BitVec 64))

(declare-fun lt!207306 () (_ BitVec 64))

(assert (=> b!133862 (= res!111221 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!207302))) (currentByte!5949 (_2!6107 lt!207302)) (currentBit!5944 (_2!6107 lt!207302))) (bvadd lt!207306 lt!207307)))))

(assert (=> b!133862 (or (not (= (bvand lt!207306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207307 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207306 lt!207307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!207301 () (_ BitVec 64))

(assert (=> b!133862 (= lt!207307 (bvmul lt!207301 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!133862 (or (= lt!207301 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207301 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207301)))))

(assert (=> b!133862 (= lt!207301 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!133862 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!133862 (= lt!207306 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))))))

(declare-fun b!133863 () Bool)

(declare-fun e!88777 () Bool)

(declare-fun lt!207303 () (_ BitVec 64))

(assert (=> b!133863 (= e!88777 (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!207303))))

(declare-fun b!133864 () Bool)

(assert (=> b!133864 (= e!88779 e!88778)))

(declare-fun res!111223 () Bool)

(assert (=> b!133864 (=> (not res!111223) (not e!88778))))

(declare-fun lt!207304 () tuple2!11590)

(assert (=> b!133864 (= res!111223 (and (= (size!2775 (_2!6104 lt!207300)) (size!2775 arr!237)) (= (_1!6104 lt!207300) (_2!6106 lt!207304))))))

(assert (=> b!133864 (= lt!207300 (readByteArrayLoopPure!0 (_1!6106 lt!207304) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!207308 () Unit!8285)

(declare-fun lt!207305 () Unit!8285)

(assert (=> b!133864 (= lt!207308 lt!207305)))

(assert (=> b!133864 (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!207302)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!207303)))

(assert (=> b!133864 (= lt!207305 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6107 lt!206919) (buf!3158 (_2!6107 lt!207302)) lt!207303))))

(assert (=> b!133864 e!88777))

(declare-fun res!111222 () Bool)

(assert (=> b!133864 (=> (not res!111222) (not e!88777))))

(assert (=> b!133864 (= res!111222 (and (= (size!2775 (buf!3158 (_2!6107 lt!206919))) (size!2775 (buf!3158 (_2!6107 lt!207302)))) (bvsge lt!207303 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133864 (= lt!207303 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!133864 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!133864 (= lt!207304 (reader!0 (_2!6107 lt!206919) (_2!6107 lt!207302)))))

(assert (= (and d!42864 res!111225) b!133862))

(assert (= (and b!133862 res!111221) b!133860))

(assert (= (and b!133860 res!111224) b!133864))

(assert (= (and b!133864 res!111222) b!133863))

(assert (= (and b!133864 res!111223) b!133861))

(declare-fun m!203183 () Bool)

(assert (=> b!133864 m!203183))

(declare-fun m!203185 () Bool)

(assert (=> b!133864 m!203185))

(declare-fun m!203187 () Bool)

(assert (=> b!133864 m!203187))

(declare-fun m!203189 () Bool)

(assert (=> b!133864 m!203189))

(declare-fun m!203191 () Bool)

(assert (=> b!133862 m!203191))

(assert (=> b!133862 m!202913))

(declare-fun m!203193 () Bool)

(assert (=> b!133861 m!203193))

(declare-fun m!203195 () Bool)

(assert (=> b!133863 m!203195))

(declare-fun m!203197 () Bool)

(assert (=> b!133860 m!203197))

(declare-fun m!203199 () Bool)

(assert (=> d!42864 m!203199))

(assert (=> b!133702 d!42864))

(declare-fun d!42896 () Bool)

(assert (=> d!42896 (isPrefixOf!0 thiss!1634 (_2!6107 lt!206912))))

(declare-fun lt!207311 () Unit!8285)

(declare-fun choose!30 (BitStream!4814 BitStream!4814 BitStream!4814) Unit!8285)

(assert (=> d!42896 (= lt!207311 (choose!30 thiss!1634 (_2!6107 lt!206919) (_2!6107 lt!206912)))))

(assert (=> d!42896 (isPrefixOf!0 thiss!1634 (_2!6107 lt!206919))))

(assert (=> d!42896 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6107 lt!206919) (_2!6107 lt!206912)) lt!207311)))

(declare-fun bs!10463 () Bool)

(assert (= bs!10463 d!42896))

(assert (=> bs!10463 m!202897))

(declare-fun m!203201 () Bool)

(assert (=> bs!10463 m!203201))

(assert (=> bs!10463 m!202921))

(assert (=> b!133702 d!42896))

(declare-fun d!42898 () Bool)

(declare-fun lt!207320 () tuple2!11586)

(declare-fun lt!207322 () tuple2!11586)

(assert (=> d!42898 (arrayRangesEq!178 (_2!6104 lt!207320) (_2!6104 lt!207322) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!207323 () Unit!8285)

(declare-fun lt!207321 () BitStream!4814)

(declare-fun choose!35 (BitStream!4814 array!6131 (_ BitVec 32) (_ BitVec 32) tuple2!11586 array!6131 BitStream!4814 tuple2!11586 array!6131) Unit!8285)

(assert (=> d!42898 (= lt!207323 (choose!35 (_1!6106 lt!206911) arr!237 from!447 to!404 lt!207320 (_2!6104 lt!207320) lt!207321 lt!207322 (_2!6104 lt!207322)))))

(assert (=> d!42898 (= lt!207322 (readByteArrayLoopPure!0 lt!207321 (array!6132 (store (arr!3425 arr!237) from!447 (_2!6105 (readBytePure!0 (_1!6106 lt!206911)))) (size!2775 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!42898 (= lt!207321 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001))))

(assert (=> d!42898 (= lt!207320 (readByteArrayLoopPure!0 (_1!6106 lt!206911) arr!237 from!447 to!404))))

(assert (=> d!42898 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6106 lt!206911) arr!237 from!447 to!404) lt!207323)))

(declare-fun bs!10465 () Bool)

(assert (= bs!10465 d!42898))

(assert (=> bs!10465 m!202863))

(declare-fun m!203203 () Bool)

(assert (=> bs!10465 m!203203))

(assert (=> bs!10465 m!202885))

(declare-fun m!203205 () Bool)

(assert (=> bs!10465 m!203205))

(declare-fun m!203207 () Bool)

(assert (=> bs!10465 m!203207))

(assert (=> bs!10465 m!202861))

(declare-fun m!203209 () Bool)

(assert (=> bs!10465 m!203209))

(assert (=> b!133702 d!42898))

(assert (=> b!133702 d!42835))

(declare-fun d!42900 () Bool)

(assert (=> d!42900 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!206922)))

(declare-fun lt!207326 () Unit!8285)

(declare-fun choose!26 (BitStream!4814 array!6131 (_ BitVec 32) BitStream!4814) Unit!8285)

(assert (=> d!42900 (= lt!207326 (choose!26 (_2!6107 lt!206919) (buf!3158 (_2!6107 lt!206912)) lt!206922 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))))))

(assert (=> d!42900 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6107 lt!206919) (buf!3158 (_2!6107 lt!206912)) lt!206922) lt!207326)))

(declare-fun bs!10466 () Bool)

(assert (= bs!10466 d!42900))

(assert (=> bs!10466 m!202893))

(declare-fun m!203211 () Bool)

(assert (=> bs!10466 m!203211))

(assert (=> b!133702 d!42900))

(declare-fun d!42902 () Bool)

(declare-datatypes ((tuple2!11596 0))(
  ( (tuple2!11597 (_1!6111 (_ BitVec 8)) (_2!6111 BitStream!4814)) )
))
(declare-fun lt!207329 () tuple2!11596)

(declare-fun readByte!0 (BitStream!4814) tuple2!11596)

(assert (=> d!42902 (= lt!207329 (readByte!0 lt!206913))))

(assert (=> d!42902 (= (readBytePure!0 lt!206913) (tuple2!11589 (_2!6111 lt!207329) (_1!6111 lt!207329)))))

(declare-fun bs!10467 () Bool)

(assert (= bs!10467 d!42902))

(declare-fun m!203213 () Bool)

(assert (=> bs!10467 m!203213))

(assert (=> b!133702 d!42902))

(declare-fun d!42904 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4814 (_ BitVec 32)) tuple2!11592)

(assert (=> d!42904 (= (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001) (_2!6107 (moveByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001)))))

(declare-fun bs!10468 () Bool)

(assert (= bs!10468 d!42904))

(declare-fun m!203215 () Bool)

(assert (=> bs!10468 m!203215))

(assert (=> b!133702 d!42904))

(declare-fun d!42906 () Bool)

(assert (=> d!42906 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10469 () Bool)

(assert (= bs!10469 d!42906))

(declare-fun m!203217 () Bool)

(assert (=> bs!10469 m!203217))

(assert (=> b!133702 d!42906))

(declare-fun d!42908 () Bool)

(assert (=> d!42908 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!206922) (bvsle ((_ sign_extend 32) lt!206922) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10470 () Bool)

(assert (= bs!10470 d!42908))

(assert (=> bs!10470 m!203035))

(assert (=> b!133702 d!42908))

(declare-fun d!42910 () Bool)

(declare-fun res!111226 () Bool)

(declare-fun e!88780 () Bool)

(assert (=> d!42910 (=> res!111226 e!88780)))

(assert (=> d!42910 (= res!111226 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42910 (= (arrayRangesEq!178 (_2!6104 lt!206914) (_2!6104 lt!206918) #b00000000000000000000000000000000 to!404) e!88780)))

(declare-fun b!133865 () Bool)

(declare-fun e!88781 () Bool)

(assert (=> b!133865 (= e!88780 e!88781)))

(declare-fun res!111227 () Bool)

(assert (=> b!133865 (=> (not res!111227) (not e!88781))))

(assert (=> b!133865 (= res!111227 (= (select (arr!3425 (_2!6104 lt!206914)) #b00000000000000000000000000000000) (select (arr!3425 (_2!6104 lt!206918)) #b00000000000000000000000000000000)))))

(declare-fun b!133866 () Bool)

(assert (=> b!133866 (= e!88781 (arrayRangesEq!178 (_2!6104 lt!206914) (_2!6104 lt!206918) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42910 (not res!111226)) b!133865))

(assert (= (and b!133865 res!111227) b!133866))

(declare-fun m!203219 () Bool)

(assert (=> b!133865 m!203219))

(declare-fun m!203221 () Bool)

(assert (=> b!133865 m!203221))

(declare-fun m!203223 () Bool)

(assert (=> b!133866 m!203223))

(assert (=> b!133702 d!42910))

(declare-fun d!42912 () Bool)

(declare-fun e!88784 () Bool)

(assert (=> d!42912 e!88784))

(declare-fun res!111234 () Bool)

(assert (=> d!42912 (=> (not res!111234) (not e!88784))))

(declare-fun lt!207340 () tuple2!11592)

(assert (=> d!42912 (= res!111234 (= (size!2775 (buf!3158 thiss!1634)) (size!2775 (buf!3158 (_2!6107 lt!207340)))))))

(declare-fun choose!6 (BitStream!4814 (_ BitVec 8)) tuple2!11592)

(assert (=> d!42912 (= lt!207340 (choose!6 thiss!1634 (select (arr!3425 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!42912 (validate_offset_byte!0 ((_ sign_extend 32) (size!2775 (buf!3158 thiss!1634))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634)))))

(assert (=> d!42912 (= (appendByte!0 thiss!1634 (select (arr!3425 arr!237) from!447)) lt!207340)))

(declare-fun b!133873 () Bool)

(declare-fun res!111235 () Bool)

(assert (=> b!133873 (=> (not res!111235) (not e!88784))))

(declare-fun lt!207342 () (_ BitVec 64))

(declare-fun lt!207343 () (_ BitVec 64))

(assert (=> b!133873 (= res!111235 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!207340))) (currentByte!5949 (_2!6107 lt!207340)) (currentBit!5944 (_2!6107 lt!207340))) (bvadd lt!207342 lt!207343)))))

(assert (=> b!133873 (or (not (= (bvand lt!207342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207343 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!207342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!207342 lt!207343) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133873 (= lt!207343 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!133873 (= lt!207342 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))

(declare-fun b!133874 () Bool)

(declare-fun res!111236 () Bool)

(assert (=> b!133874 (=> (not res!111236) (not e!88784))))

(assert (=> b!133874 (= res!111236 (isPrefixOf!0 thiss!1634 (_2!6107 lt!207340)))))

(declare-fun lt!207341 () tuple2!11590)

(declare-fun b!133875 () Bool)

(declare-fun lt!207344 () tuple2!11588)

(assert (=> b!133875 (= e!88784 (and (= (_2!6105 lt!207344) (select (arr!3425 arr!237) from!447)) (= (_1!6105 lt!207344) (_2!6106 lt!207341))))))

(assert (=> b!133875 (= lt!207344 (readBytePure!0 (_1!6106 lt!207341)))))

(assert (=> b!133875 (= lt!207341 (reader!0 thiss!1634 (_2!6107 lt!207340)))))

(assert (= (and d!42912 res!111234) b!133873))

(assert (= (and b!133873 res!111235) b!133874))

(assert (= (and b!133874 res!111236) b!133875))

(assert (=> d!42912 m!202875))

(declare-fun m!203225 () Bool)

(assert (=> d!42912 m!203225))

(declare-fun m!203227 () Bool)

(assert (=> d!42912 m!203227))

(declare-fun m!203229 () Bool)

(assert (=> b!133873 m!203229))

(assert (=> b!133873 m!202915))

(declare-fun m!203231 () Bool)

(assert (=> b!133874 m!203231))

(declare-fun m!203233 () Bool)

(assert (=> b!133875 m!203233))

(declare-fun m!203235 () Bool)

(assert (=> b!133875 m!203235))

(assert (=> b!133702 d!42912))

(declare-fun d!42914 () Bool)

(declare-fun res!111237 () Bool)

(declare-fun e!88785 () Bool)

(assert (=> d!42914 (=> (not res!111237) (not e!88785))))

(assert (=> d!42914 (= res!111237 (= (size!2775 (buf!3158 thiss!1634)) (size!2775 (buf!3158 (_2!6107 lt!206912)))))))

(assert (=> d!42914 (= (isPrefixOf!0 thiss!1634 (_2!6107 lt!206912)) e!88785)))

(declare-fun b!133876 () Bool)

(declare-fun res!111239 () Bool)

(assert (=> b!133876 (=> (not res!111239) (not e!88785))))

(assert (=> b!133876 (= res!111239 (bvsle (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206912))) (currentByte!5949 (_2!6107 lt!206912)) (currentBit!5944 (_2!6107 lt!206912)))))))

(declare-fun b!133877 () Bool)

(declare-fun e!88786 () Bool)

(assert (=> b!133877 (= e!88785 e!88786)))

(declare-fun res!111238 () Bool)

(assert (=> b!133877 (=> res!111238 e!88786)))

(assert (=> b!133877 (= res!111238 (= (size!2775 (buf!3158 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133878 () Bool)

(assert (=> b!133878 (= e!88786 (arrayBitRangesEq!0 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!206912)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(assert (= (and d!42914 res!111237) b!133876))

(assert (= (and b!133876 res!111239) b!133877))

(assert (= (and b!133877 (not res!111238)) b!133878))

(assert (=> b!133876 m!202915))

(assert (=> b!133876 m!202919))

(assert (=> b!133878 m!202915))

(assert (=> b!133878 m!202915))

(declare-fun m!203237 () Bool)

(assert (=> b!133878 m!203237))

(assert (=> b!133702 d!42914))

(declare-fun b!133879 () Bool)

(declare-fun e!88788 () Unit!8285)

(declare-fun Unit!8291 () Unit!8285)

(assert (=> b!133879 (= e!88788 Unit!8291)))

(declare-fun d!42916 () Bool)

(declare-fun e!88787 () Bool)

(assert (=> d!42916 e!88787))

(declare-fun res!111241 () Bool)

(assert (=> d!42916 (=> (not res!111241) (not e!88787))))

(declare-fun lt!207356 () tuple2!11590)

(assert (=> d!42916 (= res!111241 (isPrefixOf!0 (_1!6106 lt!207356) (_2!6106 lt!207356)))))

(declare-fun lt!207352 () BitStream!4814)

(assert (=> d!42916 (= lt!207356 (tuple2!11591 lt!207352 (_2!6107 lt!206912)))))

(declare-fun lt!207360 () Unit!8285)

(declare-fun lt!207354 () Unit!8285)

(assert (=> d!42916 (= lt!207360 lt!207354)))

(assert (=> d!42916 (isPrefixOf!0 lt!207352 (_2!6107 lt!206912))))

(assert (=> d!42916 (= lt!207354 (lemmaIsPrefixTransitive!0 lt!207352 (_2!6107 lt!206912) (_2!6107 lt!206912)))))

(declare-fun lt!207345 () Unit!8285)

(declare-fun lt!207348 () Unit!8285)

(assert (=> d!42916 (= lt!207345 lt!207348)))

(assert (=> d!42916 (isPrefixOf!0 lt!207352 (_2!6107 lt!206912))))

(assert (=> d!42916 (= lt!207348 (lemmaIsPrefixTransitive!0 lt!207352 thiss!1634 (_2!6107 lt!206912)))))

(declare-fun lt!207351 () Unit!8285)

(assert (=> d!42916 (= lt!207351 e!88788)))

(declare-fun c!7640 () Bool)

(assert (=> d!42916 (= c!7640 (not (= (size!2775 (buf!3158 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!207350 () Unit!8285)

(declare-fun lt!207347 () Unit!8285)

(assert (=> d!42916 (= lt!207350 lt!207347)))

(assert (=> d!42916 (isPrefixOf!0 (_2!6107 lt!206912) (_2!6107 lt!206912))))

(assert (=> d!42916 (= lt!207347 (lemmaIsPrefixRefl!0 (_2!6107 lt!206912)))))

(declare-fun lt!207364 () Unit!8285)

(declare-fun lt!207355 () Unit!8285)

(assert (=> d!42916 (= lt!207364 lt!207355)))

(assert (=> d!42916 (= lt!207355 (lemmaIsPrefixRefl!0 (_2!6107 lt!206912)))))

(declare-fun lt!207358 () Unit!8285)

(declare-fun lt!207357 () Unit!8285)

(assert (=> d!42916 (= lt!207358 lt!207357)))

(assert (=> d!42916 (isPrefixOf!0 lt!207352 lt!207352)))

(assert (=> d!42916 (= lt!207357 (lemmaIsPrefixRefl!0 lt!207352))))

(declare-fun lt!207353 () Unit!8285)

(declare-fun lt!207346 () Unit!8285)

(assert (=> d!42916 (= lt!207353 lt!207346)))

(assert (=> d!42916 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42916 (= lt!207346 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42916 (= lt!207352 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))

(assert (=> d!42916 (isPrefixOf!0 thiss!1634 (_2!6107 lt!206912))))

(assert (=> d!42916 (= (reader!0 thiss!1634 (_2!6107 lt!206912)) lt!207356)))

(declare-fun b!133880 () Bool)

(declare-fun res!111240 () Bool)

(assert (=> b!133880 (=> (not res!111240) (not e!88787))))

(assert (=> b!133880 (= res!111240 (isPrefixOf!0 (_2!6106 lt!207356) (_2!6107 lt!206912)))))

(declare-fun b!133881 () Bool)

(declare-fun res!111242 () Bool)

(assert (=> b!133881 (=> (not res!111242) (not e!88787))))

(assert (=> b!133881 (= res!111242 (isPrefixOf!0 (_1!6106 lt!207356) thiss!1634))))

(declare-fun lt!207361 () (_ BitVec 64))

(declare-fun lt!207359 () (_ BitVec 64))

(declare-fun b!133882 () Bool)

(assert (=> b!133882 (= e!88787 (= (_1!6106 lt!207356) (withMovedBitIndex!0 (_2!6106 lt!207356) (bvsub lt!207361 lt!207359))))))

(assert (=> b!133882 (or (= (bvand lt!207361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207359 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207361 lt!207359) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133882 (= lt!207359 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206912))) (currentByte!5949 (_2!6107 lt!206912)) (currentBit!5944 (_2!6107 lt!206912))))))

(assert (=> b!133882 (= lt!207361 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))

(declare-fun b!133883 () Bool)

(declare-fun lt!207363 () Unit!8285)

(assert (=> b!133883 (= e!88788 lt!207363)))

(declare-fun lt!207349 () (_ BitVec 64))

(assert (=> b!133883 (= lt!207349 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!207362 () (_ BitVec 64))

(assert (=> b!133883 (= lt!207362 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))

(assert (=> b!133883 (= lt!207363 (arrayBitRangesEqSymmetric!0 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!206912)) lt!207349 lt!207362))))

(assert (=> b!133883 (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206912)) (buf!3158 thiss!1634) lt!207349 lt!207362)))

(assert (= (and d!42916 c!7640) b!133883))

(assert (= (and d!42916 (not c!7640)) b!133879))

(assert (= (and d!42916 res!111241) b!133881))

(assert (= (and b!133881 res!111242) b!133880))

(assert (= (and b!133880 res!111240) b!133882))

(assert (=> b!133883 m!202915))

(declare-fun m!203239 () Bool)

(assert (=> b!133883 m!203239))

(declare-fun m!203241 () Bool)

(assert (=> b!133883 m!203241))

(declare-fun m!203243 () Bool)

(assert (=> d!42916 m!203243))

(declare-fun m!203245 () Bool)

(assert (=> d!42916 m!203245))

(assert (=> d!42916 m!202897))

(declare-fun m!203247 () Bool)

(assert (=> d!42916 m!203247))

(assert (=> d!42916 m!203091))

(declare-fun m!203249 () Bool)

(assert (=> d!42916 m!203249))

(assert (=> d!42916 m!203095))

(declare-fun m!203251 () Bool)

(assert (=> d!42916 m!203251))

(declare-fun m!203253 () Bool)

(assert (=> d!42916 m!203253))

(declare-fun m!203255 () Bool)

(assert (=> d!42916 m!203255))

(declare-fun m!203257 () Bool)

(assert (=> d!42916 m!203257))

(declare-fun m!203259 () Bool)

(assert (=> b!133880 m!203259))

(declare-fun m!203261 () Bool)

(assert (=> b!133882 m!203261))

(assert (=> b!133882 m!202919))

(assert (=> b!133882 m!202915))

(declare-fun m!203263 () Bool)

(assert (=> b!133881 m!203263))

(assert (=> b!133702 d!42916))

(declare-fun lt!207365 () tuple3!510)

(declare-fun d!42918 () Bool)

(assert (=> d!42918 (= lt!207365 (readByteArrayLoop!0 (_1!6106 lt!206930) lt!206927 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42918 (= (readByteArrayLoopPure!0 (_1!6106 lt!206930) lt!206927 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11587 (_2!6110 lt!207365) (_3!312 lt!207365)))))

(declare-fun bs!10471 () Bool)

(assert (= bs!10471 d!42918))

(declare-fun m!203265 () Bool)

(assert (=> bs!10471 m!203265))

(assert (=> b!133702 d!42918))

(declare-fun d!42920 () Bool)

(assert (=> d!42920 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!206922) (bvsle ((_ sign_extend 32) lt!206922) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10472 () Bool)

(assert (= bs!10472 d!42920))

(assert (=> bs!10472 m!203135))

(assert (=> b!133702 d!42920))

(declare-fun d!42922 () Bool)

(assert (=> d!42922 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!207366 () Unit!8285)

(assert (=> d!42922 (= lt!207366 (choose!26 thiss!1634 (buf!3158 (_2!6107 lt!206912)) (bvsub to!404 from!447) (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(assert (=> d!42922 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3158 (_2!6107 lt!206912)) (bvsub to!404 from!447)) lt!207366)))

(declare-fun bs!10473 () Bool)

(assert (= bs!10473 d!42922))

(assert (=> bs!10473 m!202881))

(declare-fun m!203267 () Bool)

(assert (=> bs!10473 m!203267))

(assert (=> b!133702 d!42922))

(declare-fun d!42924 () Bool)

(declare-fun e!88791 () Bool)

(assert (=> d!42924 e!88791))

(declare-fun res!111245 () Bool)

(assert (=> d!42924 (=> (not res!111245) (not e!88791))))

(declare-fun lt!207375 () tuple2!11588)

(declare-fun lt!207376 () tuple2!11588)

(assert (=> d!42924 (= res!111245 (= (bitIndex!0 (size!2775 (buf!3158 (_1!6105 lt!207375))) (currentByte!5949 (_1!6105 lt!207375)) (currentBit!5944 (_1!6105 lt!207375))) (bitIndex!0 (size!2775 (buf!3158 (_1!6105 lt!207376))) (currentByte!5949 (_1!6105 lt!207376)) (currentBit!5944 (_1!6105 lt!207376)))))))

(declare-fun lt!207377 () BitStream!4814)

(declare-fun lt!207378 () Unit!8285)

(declare-fun choose!14 (BitStream!4814 BitStream!4814 BitStream!4814 tuple2!11588 tuple2!11588 BitStream!4814 (_ BitVec 8) tuple2!11588 tuple2!11588 BitStream!4814 (_ BitVec 8)) Unit!8285)

(assert (=> d!42924 (= lt!207378 (choose!14 lt!206913 (_2!6107 lt!206912) lt!207377 lt!207375 (tuple2!11589 (_1!6105 lt!207375) (_2!6105 lt!207375)) (_1!6105 lt!207375) (_2!6105 lt!207375) lt!207376 (tuple2!11589 (_1!6105 lt!207376) (_2!6105 lt!207376)) (_1!6105 lt!207376) (_2!6105 lt!207376)))))

(assert (=> d!42924 (= lt!207376 (readBytePure!0 lt!207377))))

(assert (=> d!42924 (= lt!207375 (readBytePure!0 lt!206913))))

(assert (=> d!42924 (= lt!207377 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 lt!206913) (currentBit!5944 lt!206913)))))

(assert (=> d!42924 (= (readBytePrefixLemma!0 lt!206913 (_2!6107 lt!206912)) lt!207378)))

(declare-fun b!133886 () Bool)

(assert (=> b!133886 (= e!88791 (= (_2!6105 lt!207375) (_2!6105 lt!207376)))))

(assert (= (and d!42924 res!111245) b!133886))

(assert (=> d!42924 m!202859))

(declare-fun m!203269 () Bool)

(assert (=> d!42924 m!203269))

(declare-fun m!203271 () Bool)

(assert (=> d!42924 m!203271))

(declare-fun m!203273 () Bool)

(assert (=> d!42924 m!203273))

(declare-fun m!203275 () Bool)

(assert (=> d!42924 m!203275))

(assert (=> b!133702 d!42924))

(declare-fun d!42926 () Bool)

(declare-fun lt!207379 () tuple3!510)

(assert (=> d!42926 (= lt!207379 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001) lt!206927 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42926 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001) lt!206927 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11587 (_2!6110 lt!207379) (_3!312 lt!207379)))))

(declare-fun bs!10474 () Bool)

(assert (= bs!10474 d!42926))

(assert (=> bs!10474 m!202863))

(declare-fun m!203277 () Bool)

(assert (=> bs!10474 m!203277))

(assert (=> b!133702 d!42926))

(declare-fun d!42928 () Bool)

(declare-fun e!88792 () Bool)

(assert (=> d!42928 e!88792))

(declare-fun res!111246 () Bool)

(assert (=> d!42928 (=> (not res!111246) (not e!88792))))

(declare-fun lt!207384 () (_ BitVec 64))

(declare-fun lt!207381 () (_ BitVec 64))

(declare-fun lt!207380 () (_ BitVec 64))

(assert (=> d!42928 (= res!111246 (= lt!207381 (bvsub lt!207380 lt!207384)))))

(assert (=> d!42928 (or (= (bvand lt!207380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207384 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207380 lt!207384) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42928 (= lt!207384 (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!206928)))) ((_ sign_extend 32) (currentByte!5949 (_1!6105 lt!206928))) ((_ sign_extend 32) (currentBit!5944 (_1!6105 lt!206928)))))))

(declare-fun lt!207383 () (_ BitVec 64))

(declare-fun lt!207382 () (_ BitVec 64))

(assert (=> d!42928 (= lt!207380 (bvmul lt!207383 lt!207382))))

(assert (=> d!42928 (or (= lt!207383 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!207382 (bvsdiv (bvmul lt!207383 lt!207382) lt!207383)))))

(assert (=> d!42928 (= lt!207382 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42928 (= lt!207383 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!206928)))))))

(assert (=> d!42928 (= lt!207381 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 (_1!6105 lt!206928))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 (_1!6105 lt!206928)))))))

(assert (=> d!42928 (invariant!0 (currentBit!5944 (_1!6105 lt!206928)) (currentByte!5949 (_1!6105 lt!206928)) (size!2775 (buf!3158 (_1!6105 lt!206928))))))

(assert (=> d!42928 (= (bitIndex!0 (size!2775 (buf!3158 (_1!6105 lt!206928))) (currentByte!5949 (_1!6105 lt!206928)) (currentBit!5944 (_1!6105 lt!206928))) lt!207381)))

(declare-fun b!133887 () Bool)

(declare-fun res!111247 () Bool)

(assert (=> b!133887 (=> (not res!111247) (not e!88792))))

(assert (=> b!133887 (= res!111247 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207381))))

(declare-fun b!133888 () Bool)

(declare-fun lt!207385 () (_ BitVec 64))

(assert (=> b!133888 (= e!88792 (bvsle lt!207381 (bvmul lt!207385 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133888 (or (= lt!207385 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!207385 #b0000000000000000000000000000000000000000000000000000000000001000) lt!207385)))))

(assert (=> b!133888 (= lt!207385 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!206928)))))))

(assert (= (and d!42928 res!111246) b!133887))

(assert (= (and b!133887 res!111247) b!133888))

(declare-fun m!203279 () Bool)

(assert (=> d!42928 m!203279))

(declare-fun m!203281 () Bool)

(assert (=> d!42928 m!203281))

(assert (=> b!133702 d!42928))

(declare-fun d!42930 () Bool)

(declare-fun lt!207386 () tuple2!11596)

(assert (=> d!42930 (= lt!207386 (readByte!0 (_1!6106 lt!206911)))))

(assert (=> d!42930 (= (readBytePure!0 (_1!6106 lt!206911)) (tuple2!11589 (_2!6111 lt!207386) (_1!6111 lt!207386)))))

(declare-fun bs!10475 () Bool)

(assert (= bs!10475 d!42930))

(declare-fun m!203283 () Bool)

(assert (=> bs!10475 m!203283))

(assert (=> b!133702 d!42930))

(declare-fun d!42932 () Bool)

(declare-fun lt!207387 () tuple3!510)

(assert (=> d!42932 (= lt!207387 (readByteArrayLoop!0 (_1!6106 lt!206911) arr!237 from!447 to!404))))

(assert (=> d!42932 (= (readByteArrayLoopPure!0 (_1!6106 lt!206911) arr!237 from!447 to!404) (tuple2!11587 (_2!6110 lt!207387) (_3!312 lt!207387)))))

(declare-fun bs!10476 () Bool)

(assert (= bs!10476 d!42932))

(declare-fun m!203285 () Bool)

(assert (=> bs!10476 m!203285))

(assert (=> b!133702 d!42932))

(declare-fun d!42934 () Bool)

(declare-fun lt!207388 () tuple2!11596)

(assert (=> d!42934 (= lt!207388 (readByte!0 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(assert (=> d!42934 (= (readBytePure!0 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))) (tuple2!11589 (_2!6111 lt!207388) (_1!6111 lt!207388)))))

(declare-fun bs!10477 () Bool)

(assert (= bs!10477 d!42934))

(declare-fun m!203287 () Bool)

(assert (=> bs!10477 m!203287))

(assert (=> b!133702 d!42934))

(declare-fun d!42936 () Bool)

(assert (=> d!42936 (= (array_inv!2564 arr!237) (bvsge (size!2775 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26146 d!42936))

(declare-fun d!42938 () Bool)

(assert (=> d!42938 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5944 thiss!1634) (currentByte!5949 thiss!1634) (size!2775 (buf!3158 thiss!1634))))))

(declare-fun bs!10478 () Bool)

(assert (= bs!10478 d!42938))

(assert (=> bs!10478 m!202841))

(assert (=> start!26146 d!42938))

(declare-fun d!42940 () Bool)

(declare-fun res!111248 () Bool)

(declare-fun e!88793 () Bool)

(assert (=> d!42940 (=> (not res!111248) (not e!88793))))

(assert (=> d!42940 (= res!111248 (= (size!2775 (buf!3158 thiss!1634)) (size!2775 (buf!3158 (_2!6107 lt!206919)))))))

(assert (=> d!42940 (= (isPrefixOf!0 thiss!1634 (_2!6107 lt!206919)) e!88793)))

(declare-fun b!133889 () Bool)

(declare-fun res!111250 () Bool)

(assert (=> b!133889 (=> (not res!111250) (not e!88793))))

(assert (=> b!133889 (= res!111250 (bvsle (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))))))

(declare-fun b!133890 () Bool)

(declare-fun e!88794 () Bool)

(assert (=> b!133890 (= e!88793 e!88794)))

(declare-fun res!111249 () Bool)

(assert (=> b!133890 (=> res!111249 e!88794)))

(assert (=> b!133890 (= res!111249 (= (size!2775 (buf!3158 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133891 () Bool)

(assert (=> b!133891 (= e!88794 (arrayBitRangesEq!0 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!206919)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(assert (= (and d!42940 res!111248) b!133889))

(assert (= (and b!133889 res!111250) b!133890))

(assert (= (and b!133890 (not res!111249)) b!133891))

(assert (=> b!133889 m!202915))

(assert (=> b!133889 m!202913))

(assert (=> b!133891 m!202915))

(assert (=> b!133891 m!202915))

(declare-fun m!203289 () Bool)

(assert (=> b!133891 m!203289))

(assert (=> b!133706 d!42940))

(declare-fun d!42942 () Bool)

(assert (=> d!42942 (= (invariant!0 (currentBit!5944 thiss!1634) (currentByte!5949 thiss!1634) (size!2775 (buf!3158 (_2!6107 lt!206919)))) (and (bvsge (currentBit!5944 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5944 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5949 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5949 thiss!1634) (size!2775 (buf!3158 (_2!6107 lt!206919)))) (and (= (currentBit!5944 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5949 thiss!1634) (size!2775 (buf!3158 (_2!6107 lt!206919))))))))))

(assert (=> b!133705 d!42942))

(declare-fun d!42944 () Bool)

(assert (=> d!42944 (= (invariant!0 (currentBit!5944 thiss!1634) (currentByte!5949 thiss!1634) (size!2775 (buf!3158 thiss!1634))) (and (bvsge (currentBit!5944 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5944 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5949 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5949 thiss!1634) (size!2775 (buf!3158 thiss!1634))) (and (= (currentBit!5944 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5949 thiss!1634) (size!2775 (buf!3158 thiss!1634)))))))))

(assert (=> b!133709 d!42944))

(declare-fun d!42946 () Bool)

(declare-fun lt!207389 () tuple2!11596)

(assert (=> d!42946 (= lt!207389 (readByte!0 (_1!6106 lt!206926)))))

(assert (=> d!42946 (= (readBytePure!0 (_1!6106 lt!206926)) (tuple2!11589 (_2!6111 lt!207389) (_1!6111 lt!207389)))))

(declare-fun bs!10479 () Bool)

(assert (= bs!10479 d!42946))

(declare-fun m!203291 () Bool)

(assert (=> bs!10479 m!203291))

(assert (=> b!133708 d!42946))

(declare-fun b!133892 () Bool)

(declare-fun e!88796 () Unit!8285)

(declare-fun Unit!8292 () Unit!8285)

(assert (=> b!133892 (= e!88796 Unit!8292)))

(declare-fun d!42948 () Bool)

(declare-fun e!88795 () Bool)

(assert (=> d!42948 e!88795))

(declare-fun res!111252 () Bool)

(assert (=> d!42948 (=> (not res!111252) (not e!88795))))

(declare-fun lt!207401 () tuple2!11590)

(assert (=> d!42948 (= res!111252 (isPrefixOf!0 (_1!6106 lt!207401) (_2!6106 lt!207401)))))

(declare-fun lt!207397 () BitStream!4814)

(assert (=> d!42948 (= lt!207401 (tuple2!11591 lt!207397 (_2!6107 lt!206919)))))

(declare-fun lt!207405 () Unit!8285)

(declare-fun lt!207399 () Unit!8285)

(assert (=> d!42948 (= lt!207405 lt!207399)))

(assert (=> d!42948 (isPrefixOf!0 lt!207397 (_2!6107 lt!206919))))

(assert (=> d!42948 (= lt!207399 (lemmaIsPrefixTransitive!0 lt!207397 (_2!6107 lt!206919) (_2!6107 lt!206919)))))

(declare-fun lt!207390 () Unit!8285)

(declare-fun lt!207393 () Unit!8285)

(assert (=> d!42948 (= lt!207390 lt!207393)))

(assert (=> d!42948 (isPrefixOf!0 lt!207397 (_2!6107 lt!206919))))

(assert (=> d!42948 (= lt!207393 (lemmaIsPrefixTransitive!0 lt!207397 thiss!1634 (_2!6107 lt!206919)))))

(declare-fun lt!207396 () Unit!8285)

(assert (=> d!42948 (= lt!207396 e!88796)))

(declare-fun c!7641 () Bool)

(assert (=> d!42948 (= c!7641 (not (= (size!2775 (buf!3158 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!207395 () Unit!8285)

(declare-fun lt!207392 () Unit!8285)

(assert (=> d!42948 (= lt!207395 lt!207392)))

(assert (=> d!42948 (isPrefixOf!0 (_2!6107 lt!206919) (_2!6107 lt!206919))))

(assert (=> d!42948 (= lt!207392 (lemmaIsPrefixRefl!0 (_2!6107 lt!206919)))))

(declare-fun lt!207409 () Unit!8285)

(declare-fun lt!207400 () Unit!8285)

(assert (=> d!42948 (= lt!207409 lt!207400)))

(assert (=> d!42948 (= lt!207400 (lemmaIsPrefixRefl!0 (_2!6107 lt!206919)))))

(declare-fun lt!207403 () Unit!8285)

(declare-fun lt!207402 () Unit!8285)

(assert (=> d!42948 (= lt!207403 lt!207402)))

(assert (=> d!42948 (isPrefixOf!0 lt!207397 lt!207397)))

(assert (=> d!42948 (= lt!207402 (lemmaIsPrefixRefl!0 lt!207397))))

(declare-fun lt!207398 () Unit!8285)

(declare-fun lt!207391 () Unit!8285)

(assert (=> d!42948 (= lt!207398 lt!207391)))

(assert (=> d!42948 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42948 (= lt!207391 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42948 (= lt!207397 (BitStream!4815 (buf!3158 (_2!6107 lt!206919)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))

(assert (=> d!42948 (isPrefixOf!0 thiss!1634 (_2!6107 lt!206919))))

(assert (=> d!42948 (= (reader!0 thiss!1634 (_2!6107 lt!206919)) lt!207401)))

(declare-fun b!133893 () Bool)

(declare-fun res!111251 () Bool)

(assert (=> b!133893 (=> (not res!111251) (not e!88795))))

(assert (=> b!133893 (= res!111251 (isPrefixOf!0 (_2!6106 lt!207401) (_2!6107 lt!206919)))))

(declare-fun b!133894 () Bool)

(declare-fun res!111253 () Bool)

(assert (=> b!133894 (=> (not res!111253) (not e!88795))))

(assert (=> b!133894 (= res!111253 (isPrefixOf!0 (_1!6106 lt!207401) thiss!1634))))

(declare-fun b!133895 () Bool)

(declare-fun lt!207404 () (_ BitVec 64))

(declare-fun lt!207406 () (_ BitVec 64))

(assert (=> b!133895 (= e!88795 (= (_1!6106 lt!207401) (withMovedBitIndex!0 (_2!6106 lt!207401) (bvsub lt!207406 lt!207404))))))

(assert (=> b!133895 (or (= (bvand lt!207406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!207404 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!207406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207406 lt!207404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133895 (= lt!207404 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))))))

(assert (=> b!133895 (= lt!207406 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))

(declare-fun b!133896 () Bool)

(declare-fun lt!207408 () Unit!8285)

(assert (=> b!133896 (= e!88796 lt!207408)))

(declare-fun lt!207394 () (_ BitVec 64))

(assert (=> b!133896 (= lt!207394 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!207407 () (_ BitVec 64))

(assert (=> b!133896 (= lt!207407 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))

(assert (=> b!133896 (= lt!207408 (arrayBitRangesEqSymmetric!0 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!206919)) lt!207394 lt!207407))))

(assert (=> b!133896 (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206919)) (buf!3158 thiss!1634) lt!207394 lt!207407)))

(assert (= (and d!42948 c!7641) b!133896))

(assert (= (and d!42948 (not c!7641)) b!133892))

(assert (= (and d!42948 res!111252) b!133894))

(assert (= (and b!133894 res!111253) b!133893))

(assert (= (and b!133893 res!111251) b!133895))

(assert (=> b!133896 m!202915))

(declare-fun m!203293 () Bool)

(assert (=> b!133896 m!203293))

(declare-fun m!203295 () Bool)

(assert (=> b!133896 m!203295))

(declare-fun m!203297 () Bool)

(assert (=> d!42948 m!203297))

(declare-fun m!203299 () Bool)

(assert (=> d!42948 m!203299))

(assert (=> d!42948 m!202921))

(declare-fun m!203301 () Bool)

(assert (=> d!42948 m!203301))

(assert (=> d!42948 m!203101))

(declare-fun m!203303 () Bool)

(assert (=> d!42948 m!203303))

(assert (=> d!42948 m!203099))

(declare-fun m!203305 () Bool)

(assert (=> d!42948 m!203305))

(assert (=> d!42948 m!203253))

(assert (=> d!42948 m!203255))

(declare-fun m!203307 () Bool)

(assert (=> d!42948 m!203307))

(declare-fun m!203309 () Bool)

(assert (=> b!133893 m!203309))

(declare-fun m!203311 () Bool)

(assert (=> b!133895 m!203311))

(assert (=> b!133895 m!202913))

(assert (=> b!133895 m!202915))

(declare-fun m!203313 () Bool)

(assert (=> b!133894 m!203313))

(assert (=> b!133708 d!42948))

(declare-fun d!42950 () Bool)

(assert (=> d!42950 (= (array_inv!2564 (buf!3158 thiss!1634)) (bvsge (size!2775 (buf!3158 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!133707 d!42950))

(push 1)

(assert (not b!133829))

(assert (not d!42922))

(assert (not b!133873))

(assert (not d!42900))

(assert (not d!42946))

(assert (not d!42926))

(assert (not d!42902))

(assert (not d!42898))

(assert (not d!42835))

(assert (not b!133896))

(assert (not b!133881))

(assert (not d!42912))

(assert (not d!42918))

(assert (not d!42859))

(assert (not d!42938))

(assert (not b!133861))

(assert (not b!133811))

(assert (not b!133889))

(assert (not b!133891))

(assert (not b!133860))

(assert (not d!42904))

(assert (not d!42861))

(assert (not b!133802))

(assert (not b!133768))

(assert (not b!133882))

(assert (not d!42920))

(assert (not b!133893))

(assert (not b!133804))

(assert (not b!133878))

(assert (not d!42855))

(assert (not d!42906))

(assert (not b!133876))

(assert (not b!133805))

(assert (not b!133862))

(assert (not b!133874))

(assert (not d!42829))

(assert (not b!133883))

(assert (not b!133866))

(assert (not b!133770))

(assert (not b!133863))

(assert (not d!42896))

(assert (not d!42864))

(assert (not b!133875))

(assert (not d!42857))

(assert (not d!42928))

(assert (not b!133803))

(assert (not d!42924))

(assert (not b!133894))

(assert (not d!42908))

(assert (not d!42833))

(assert (not d!42845))

(assert (not d!42827))

(assert (not d!42831))

(assert (not d!42930))

(assert (not d!42948))

(assert (not b!133895))

(assert (not d!42916))

(assert (not d!42932))

(assert (not d!42934))

(assert (not b!133864))

(assert (not b!133880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!43219 () Bool)

(declare-fun lt!208075 () (_ BitVec 8))

(declare-fun lt!208070 () (_ BitVec 8))

(assert (=> d!43219 (= lt!208075 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3425 (buf!3158 (_1!6106 lt!206926))) (currentByte!5949 (_1!6106 lt!206926)))) ((_ sign_extend 24) lt!208070))))))

(assert (=> d!43219 (= lt!208070 ((_ extract 7 0) (currentBit!5944 (_1!6106 lt!206926))))))

(declare-fun e!89020 () Bool)

(assert (=> d!43219 e!89020))

(declare-fun res!111527 () Bool)

(assert (=> d!43219 (=> (not res!111527) (not e!89020))))

(assert (=> d!43219 (= res!111527 (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6106 lt!206926)))) ((_ sign_extend 32) (currentByte!5949 (_1!6106 lt!206926))) ((_ sign_extend 32) (currentBit!5944 (_1!6106 lt!206926))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!11602 0))(
  ( (tuple2!11603 (_1!6116 Unit!8285) (_2!6116 (_ BitVec 8))) )
))
(declare-fun Unit!8343 () Unit!8285)

(declare-fun Unit!8344 () Unit!8285)

(assert (=> d!43219 (= (readByte!0 (_1!6106 lt!206926)) (tuple2!11597 (_2!6116 (ite (bvsgt ((_ sign_extend 24) lt!208070) #b00000000000000000000000000000000) (tuple2!11603 Unit!8343 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!208075) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3425 (buf!3158 (_1!6106 lt!206926))) (bvadd (currentByte!5949 (_1!6106 lt!206926)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!208070)))))))) (tuple2!11603 Unit!8344 lt!208075))) (BitStream!4815 (buf!3158 (_1!6106 lt!206926)) (bvadd (currentByte!5949 (_1!6106 lt!206926)) #b00000000000000000000000000000001) (currentBit!5944 (_1!6106 lt!206926)))))))

(declare-fun b!134215 () Bool)

(declare-fun e!89021 () Bool)

(assert (=> b!134215 (= e!89020 e!89021)))

(declare-fun res!111526 () Bool)

(assert (=> b!134215 (=> (not res!111526) (not e!89021))))

(declare-fun lt!208074 () tuple2!11596)

(assert (=> b!134215 (= res!111526 (= (buf!3158 (_2!6111 lt!208074)) (buf!3158 (_1!6106 lt!206926))))))

(declare-fun lt!208072 () (_ BitVec 8))

(declare-fun lt!208076 () (_ BitVec 8))

(declare-fun Unit!8345 () Unit!8285)

(declare-fun Unit!8346 () Unit!8285)

(assert (=> b!134215 (= lt!208074 (tuple2!11597 (_2!6116 (ite (bvsgt ((_ sign_extend 24) lt!208072) #b00000000000000000000000000000000) (tuple2!11603 Unit!8345 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!208076) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3425 (buf!3158 (_1!6106 lt!206926))) (bvadd (currentByte!5949 (_1!6106 lt!206926)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!208072)))))))) (tuple2!11603 Unit!8346 lt!208076))) (BitStream!4815 (buf!3158 (_1!6106 lt!206926)) (bvadd (currentByte!5949 (_1!6106 lt!206926)) #b00000000000000000000000000000001) (currentBit!5944 (_1!6106 lt!206926)))))))

(assert (=> b!134215 (= lt!208076 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3425 (buf!3158 (_1!6106 lt!206926))) (currentByte!5949 (_1!6106 lt!206926)))) ((_ sign_extend 24) lt!208072))))))

(assert (=> b!134215 (= lt!208072 ((_ extract 7 0) (currentBit!5944 (_1!6106 lt!206926))))))

(declare-fun b!134216 () Bool)

(declare-fun lt!208073 () (_ BitVec 64))

(declare-fun lt!208071 () (_ BitVec 64))

(assert (=> b!134216 (= e!89021 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6111 lt!208074))) (currentByte!5949 (_2!6111 lt!208074)) (currentBit!5944 (_2!6111 lt!208074))) (bvadd lt!208073 lt!208071)))))

(assert (=> b!134216 (or (not (= (bvand lt!208073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208071 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!208073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!208073 lt!208071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!134216 (= lt!208071 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!134216 (= lt!208073 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!206926))) (currentByte!5949 (_1!6106 lt!206926)) (currentBit!5944 (_1!6106 lt!206926))))))

(assert (= (and d!43219 res!111527) b!134215))

(assert (= (and b!134215 res!111526) b!134216))

(declare-fun m!204067 () Bool)

(assert (=> d!43219 m!204067))

(declare-fun m!204069 () Bool)

(assert (=> d!43219 m!204069))

(declare-fun m!204071 () Bool)

(assert (=> d!43219 m!204071))

(assert (=> b!134215 m!204071))

(assert (=> b!134215 m!204067))

(declare-fun m!204073 () Bool)

(assert (=> b!134216 m!204073))

(declare-fun m!204075 () Bool)

(assert (=> b!134216 m!204075))

(assert (=> d!42946 d!43219))

(declare-fun b!134227 () Bool)

(declare-fun e!89030 () tuple3!510)

(declare-fun lt!208154 () Unit!8285)

(declare-fun lt!208160 () tuple3!510)

(assert (=> b!134227 (= e!89030 (tuple3!511 lt!208154 (_2!6110 lt!208160) (_3!312 lt!208160)))))

(declare-fun lt!208150 () tuple2!11596)

(assert (=> b!134227 (= lt!208150 (readByte!0 (_1!6106 lt!206911)))))

(declare-fun lt!208164 () array!6131)

(assert (=> b!134227 (= lt!208164 (array!6132 (store (arr!3425 arr!237) from!447 (_1!6111 lt!208150)) (size!2775 arr!237)))))

(declare-fun lt!208167 () (_ BitVec 64))

(assert (=> b!134227 (= lt!208167 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!208168 () (_ BitVec 32))

(assert (=> b!134227 (= lt!208168 (bvsub to!404 from!447))))

(declare-fun lt!208183 () Unit!8285)

(assert (=> b!134227 (= lt!208183 (validateOffsetBytesFromBitIndexLemma!0 (_1!6106 lt!206911) (_2!6111 lt!208150) lt!208167 lt!208168))))

(assert (=> b!134227 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6111 lt!208150)))) ((_ sign_extend 32) (currentByte!5949 (_2!6111 lt!208150))) ((_ sign_extend 32) (currentBit!5944 (_2!6111 lt!208150))) (bvsub lt!208168 ((_ extract 31 0) (bvsdiv (bvadd lt!208167 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!208180 () Unit!8285)

(assert (=> b!134227 (= lt!208180 lt!208183)))

(assert (=> b!134227 (= lt!208160 (readByteArrayLoop!0 (_2!6111 lt!208150) lt!208164 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1748 () (_ BitVec 64))

(assert (=> b!134227 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6111 lt!208150))) (currentByte!5949 (_2!6111 lt!208150)) (currentBit!5944 (_2!6111 lt!208150))) (bvadd call!1748 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!208174 () Unit!8285)

(declare-fun Unit!8347 () Unit!8285)

(assert (=> b!134227 (= lt!208174 Unit!8347)))

(assert (=> b!134227 (= (bvadd (bitIndex!0 (size!2775 (buf!3158 (_2!6111 lt!208150))) (currentByte!5949 (_2!6111 lt!208150)) (currentBit!5944 (_2!6111 lt!208150))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2775 (buf!3158 (_2!6110 lt!208160))) (currentByte!5949 (_2!6110 lt!208160)) (currentBit!5944 (_2!6110 lt!208160))))))

(declare-fun lt!208162 () Unit!8285)

(declare-fun Unit!8348 () Unit!8285)

(assert (=> b!134227 (= lt!208162 Unit!8348)))

(assert (=> b!134227 (= (bvadd call!1748 (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2775 (buf!3158 (_2!6110 lt!208160))) (currentByte!5949 (_2!6110 lt!208160)) (currentBit!5944 (_2!6110 lt!208160))))))

(declare-fun lt!208153 () Unit!8285)

(declare-fun Unit!8349 () Unit!8285)

(assert (=> b!134227 (= lt!208153 Unit!8349)))

(assert (=> b!134227 (and (= (buf!3158 (_1!6106 lt!206911)) (buf!3158 (_2!6110 lt!208160))) (= (size!2775 arr!237) (size!2775 (_3!312 lt!208160))))))

(declare-fun lt!208158 () Unit!8285)

(declare-fun Unit!8350 () Unit!8285)

(assert (=> b!134227 (= lt!208158 Unit!8350)))

(declare-fun lt!208166 () Unit!8285)

(declare-fun arrayUpdatedAtPrefixLemma!4 (array!6131 (_ BitVec 32) (_ BitVec 8)) Unit!8285)

(assert (=> b!134227 (= lt!208166 (arrayUpdatedAtPrefixLemma!4 arr!237 from!447 (_1!6111 lt!208150)))))

(declare-fun call!1749 () Bool)

(assert (=> b!134227 call!1749))

(declare-fun lt!208169 () Unit!8285)

(assert (=> b!134227 (= lt!208169 lt!208166)))

(declare-fun lt!208184 () (_ BitVec 32))

(assert (=> b!134227 (= lt!208184 #b00000000000000000000000000000000)))

(declare-fun lt!208173 () Unit!8285)

(declare-fun arrayRangesEqTransitive!4 (array!6131 array!6131 array!6131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8285)

(assert (=> b!134227 (= lt!208173 (arrayRangesEqTransitive!4 arr!237 lt!208164 (_3!312 lt!208160) lt!208184 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!134227 (arrayRangesEq!178 arr!237 (_3!312 lt!208160) lt!208184 from!447)))

(declare-fun lt!208172 () Unit!8285)

(assert (=> b!134227 (= lt!208172 lt!208173)))

(declare-fun call!1750 () Bool)

(assert (=> b!134227 call!1750))

(declare-fun lt!208181 () Unit!8285)

(declare-fun Unit!8351 () Unit!8285)

(assert (=> b!134227 (= lt!208181 Unit!8351)))

(declare-fun lt!208149 () Unit!8285)

(declare-fun arrayRangesEqImpliesEq!4 (array!6131 array!6131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8285)

(assert (=> b!134227 (= lt!208149 (arrayRangesEqImpliesEq!4 lt!208164 (_3!312 lt!208160) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!134227 (= (select (store (arr!3425 arr!237) from!447 (_1!6111 lt!208150)) from!447) (select (arr!3425 (_3!312 lt!208160)) from!447))))

(declare-fun lt!208163 () Unit!8285)

(assert (=> b!134227 (= lt!208163 lt!208149)))

(declare-fun lt!208179 () Bool)

(assert (=> b!134227 (= lt!208179 (= (select (arr!3425 (_3!312 lt!208160)) from!447) (_1!6111 lt!208150)))))

(declare-fun Unit!8352 () Unit!8285)

(assert (=> b!134227 (= lt!208154 Unit!8352)))

(assert (=> b!134227 lt!208179))

(declare-fun b!134228 () Bool)

(declare-fun e!89029 () Bool)

(declare-fun lt!208159 () tuple3!510)

(assert (=> b!134228 (= e!89029 (arrayRangesEq!178 arr!237 (_3!312 lt!208159) #b00000000000000000000000000000000 from!447))))

(declare-fun b!134229 () Bool)

(declare-fun e!89028 () Bool)

(assert (=> b!134229 (= e!89028 (= (select (arr!3425 (_3!312 lt!208159)) from!447) (_2!6105 (readBytePure!0 (_1!6106 lt!206911)))))))

(assert (=> b!134229 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!2775 (_3!312 lt!208159))))))

(declare-fun c!7665 () Bool)

(declare-fun bm!1745 () Bool)

(assert (=> bm!1745 (= call!1749 (arrayRangesEq!178 arr!237 (ite c!7665 (array!6132 (store (arr!3425 arr!237) from!447 (_1!6111 lt!208150)) (size!2775 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!7665 from!447 (size!2775 arr!237))))))

(declare-fun b!134230 () Bool)

(declare-fun res!111534 () Bool)

(assert (=> b!134230 (=> (not res!111534) (not e!89029))))

(assert (=> b!134230 (= res!111534 (and (= (buf!3158 (_1!6106 lt!206911)) (buf!3158 (_2!6110 lt!208159))) (= (size!2775 arr!237) (size!2775 (_3!312 lt!208159)))))))

(declare-fun bm!1746 () Bool)

(assert (=> bm!1746 (= call!1748 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!206911))) (currentByte!5949 (_1!6106 lt!206911)) (currentBit!5944 (_1!6106 lt!206911))))))

(declare-fun d!43221 () Bool)

(assert (=> d!43221 e!89028))

(declare-fun res!111536 () Bool)

(assert (=> d!43221 (=> res!111536 e!89028)))

(assert (=> d!43221 (= res!111536 (bvsge from!447 to!404))))

(declare-fun lt!208152 () Bool)

(assert (=> d!43221 (= lt!208152 e!89029)))

(declare-fun res!111535 () Bool)

(assert (=> d!43221 (=> (not res!111535) (not e!89029))))

(declare-fun lt!208178 () (_ BitVec 64))

(declare-fun lt!208175 () (_ BitVec 64))

(assert (=> d!43221 (= res!111535 (= (bvadd lt!208178 lt!208175) (bitIndex!0 (size!2775 (buf!3158 (_2!6110 lt!208159))) (currentByte!5949 (_2!6110 lt!208159)) (currentBit!5944 (_2!6110 lt!208159)))))))

(assert (=> d!43221 (or (not (= (bvand lt!208178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208175 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!208178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!208178 lt!208175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!208170 () (_ BitVec 64))

(assert (=> d!43221 (= lt!208175 (bvmul lt!208170 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43221 (or (= lt!208170 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!208170 #b0000000000000000000000000000000000000000000000000000000000001000) lt!208170)))))

(assert (=> d!43221 (= lt!208170 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!43221 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!43221 (= lt!208178 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!206911))) (currentByte!5949 (_1!6106 lt!206911)) (currentBit!5944 (_1!6106 lt!206911))))))

(assert (=> d!43221 (= lt!208159 e!89030)))

(assert (=> d!43221 (= c!7665 (bvslt from!447 to!404))))

(assert (=> d!43221 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2775 arr!237)))))

(assert (=> d!43221 (= (readByteArrayLoop!0 (_1!6106 lt!206911) arr!237 from!447 to!404) lt!208159)))

(declare-fun b!134231 () Bool)

(declare-fun lt!208177 () Unit!8285)

(assert (=> b!134231 (= e!89030 (tuple3!511 lt!208177 (_1!6106 lt!206911) arr!237))))

(assert (=> b!134231 (= call!1748 call!1748)))

(declare-fun lt!208165 () Unit!8285)

(declare-fun Unit!8353 () Unit!8285)

(assert (=> b!134231 (= lt!208165 Unit!8353)))

(declare-fun lt!208182 () Unit!8285)

(declare-fun arrayRangesEqReflexiveLemma!4 (array!6131) Unit!8285)

(assert (=> b!134231 (= lt!208182 (arrayRangesEqReflexiveLemma!4 arr!237))))

(assert (=> b!134231 call!1749))

(declare-fun lt!208161 () Unit!8285)

(assert (=> b!134231 (= lt!208161 lt!208182)))

(declare-fun lt!208176 () array!6131)

(assert (=> b!134231 (= lt!208176 arr!237)))

(declare-fun lt!208157 () array!6131)

(assert (=> b!134231 (= lt!208157 arr!237)))

(declare-fun lt!208155 () (_ BitVec 32))

(assert (=> b!134231 (= lt!208155 #b00000000000000000000000000000000)))

(declare-fun lt!208156 () (_ BitVec 32))

(assert (=> b!134231 (= lt!208156 (size!2775 arr!237))))

(declare-fun lt!208151 () (_ BitVec 32))

(assert (=> b!134231 (= lt!208151 #b00000000000000000000000000000000)))

(declare-fun lt!208171 () (_ BitVec 32))

(assert (=> b!134231 (= lt!208171 from!447)))

(declare-fun arrayRangesEqSlicedLemma!4 (array!6131 array!6131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8285)

(assert (=> b!134231 (= lt!208177 (arrayRangesEqSlicedLemma!4 lt!208176 lt!208157 lt!208155 lt!208156 lt!208151 lt!208171))))

(assert (=> b!134231 call!1750))

(declare-fun bm!1747 () Bool)

(assert (=> bm!1747 (= call!1750 (arrayRangesEq!178 (ite c!7665 arr!237 lt!208176) (ite c!7665 (_3!312 lt!208160) lt!208157) (ite c!7665 #b00000000000000000000000000000000 lt!208151) (ite c!7665 from!447 lt!208171)))))

(assert (= (and d!43221 c!7665) b!134227))

(assert (= (and d!43221 (not c!7665)) b!134231))

(assert (= (or b!134227 b!134231) bm!1745))

(assert (= (or b!134227 b!134231) bm!1747))

(assert (= (or b!134227 b!134231) bm!1746))

(assert (= (and d!43221 res!111535) b!134230))

(assert (= (and b!134230 res!111534) b!134228))

(assert (= (and d!43221 (not res!111536)) b!134229))

(declare-fun m!204077 () Bool)

(assert (=> bm!1745 m!204077))

(declare-fun m!204079 () Bool)

(assert (=> bm!1745 m!204079))

(declare-fun m!204081 () Bool)

(assert (=> b!134231 m!204081))

(declare-fun m!204083 () Bool)

(assert (=> b!134231 m!204083))

(declare-fun m!204085 () Bool)

(assert (=> d!43221 m!204085))

(declare-fun m!204087 () Bool)

(assert (=> d!43221 m!204087))

(assert (=> bm!1746 m!204087))

(declare-fun m!204089 () Bool)

(assert (=> bm!1747 m!204089))

(declare-fun m!204091 () Bool)

(assert (=> b!134227 m!204091))

(declare-fun m!204093 () Bool)

(assert (=> b!134227 m!204093))

(declare-fun m!204095 () Bool)

(assert (=> b!134227 m!204095))

(declare-fun m!204097 () Bool)

(assert (=> b!134227 m!204097))

(declare-fun m!204099 () Bool)

(assert (=> b!134227 m!204099))

(declare-fun m!204101 () Bool)

(assert (=> b!134227 m!204101))

(assert (=> b!134227 m!203283))

(declare-fun m!204103 () Bool)

(assert (=> b!134227 m!204103))

(declare-fun m!204105 () Bool)

(assert (=> b!134227 m!204105))

(declare-fun m!204107 () Bool)

(assert (=> b!134227 m!204107))

(assert (=> b!134227 m!204077))

(declare-fun m!204109 () Bool)

(assert (=> b!134227 m!204109))

(declare-fun m!204111 () Bool)

(assert (=> b!134227 m!204111))

(declare-fun m!204113 () Bool)

(assert (=> b!134228 m!204113))

(declare-fun m!204115 () Bool)

(assert (=> b!134229 m!204115))

(assert (=> b!134229 m!202885))

(assert (=> d!42932 d!43221))

(declare-fun d!43223 () Bool)

(declare-fun res!111537 () Bool)

(declare-fun e!89031 () Bool)

(assert (=> d!43223 (=> (not res!111537) (not e!89031))))

(assert (=> d!43223 (= res!111537 (= (size!2775 (buf!3158 thiss!1634)) (size!2775 (buf!3158 (_2!6107 lt!207340)))))))

(assert (=> d!43223 (= (isPrefixOf!0 thiss!1634 (_2!6107 lt!207340)) e!89031)))

(declare-fun b!134232 () Bool)

(declare-fun res!111539 () Bool)

(assert (=> b!134232 (=> (not res!111539) (not e!89031))))

(assert (=> b!134232 (= res!111539 (bvsle (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!207340))) (currentByte!5949 (_2!6107 lt!207340)) (currentBit!5944 (_2!6107 lt!207340)))))))

(declare-fun b!134233 () Bool)

(declare-fun e!89032 () Bool)

(assert (=> b!134233 (= e!89031 e!89032)))

(declare-fun res!111538 () Bool)

(assert (=> b!134233 (=> res!111538 e!89032)))

(assert (=> b!134233 (= res!111538 (= (size!2775 (buf!3158 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!134234 () Bool)

(assert (=> b!134234 (= e!89032 (arrayBitRangesEq!0 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!207340)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(assert (= (and d!43223 res!111537) b!134232))

(assert (= (and b!134232 res!111539) b!134233))

(assert (= (and b!134233 (not res!111538)) b!134234))

(assert (=> b!134232 m!202915))

(assert (=> b!134232 m!203229))

(assert (=> b!134234 m!202915))

(assert (=> b!134234 m!202915))

(declare-fun m!204117 () Bool)

(assert (=> b!134234 m!204117))

(assert (=> b!133874 d!43223))

(declare-fun lt!208185 () tuple3!510)

(declare-fun d!43225 () Bool)

(assert (=> d!43225 (= lt!208185 (readByteArrayLoop!0 lt!207321 (array!6132 (store (arr!3425 arr!237) from!447 (_2!6105 (readBytePure!0 (_1!6106 lt!206911)))) (size!2775 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43225 (= (readByteArrayLoopPure!0 lt!207321 (array!6132 (store (arr!3425 arr!237) from!447 (_2!6105 (readBytePure!0 (_1!6106 lt!206911)))) (size!2775 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!11587 (_2!6110 lt!208185) (_3!312 lt!208185)))))

(declare-fun bs!10533 () Bool)

(assert (= bs!10533 d!43225))

(declare-fun m!204119 () Bool)

(assert (=> bs!10533 m!204119))

(assert (=> d!42898 d!43225))

(declare-fun d!43227 () Bool)

(assert (=> d!43227 (arrayRangesEq!178 (_2!6104 (readByteArrayLoopPure!0 (_1!6106 lt!206911) arr!237 from!447 to!404)) (_2!6104 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001) (array!6132 (store (arr!3425 arr!237) from!447 (_2!6105 (readBytePure!0 (_1!6106 lt!206911)))) (size!2775 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!43227 true))

(declare-fun _$13!43 () Unit!8285)

(assert (=> d!43227 (= (choose!35 (_1!6106 lt!206911) arr!237 from!447 to!404 lt!207320 (_2!6104 lt!207320) lt!207321 lt!207322 (_2!6104 lt!207322)) _$13!43)))

(declare-fun bs!10535 () Bool)

(assert (= bs!10535 d!43227))

(assert (=> bs!10535 m!202863))

(assert (=> bs!10535 m!202885))

(declare-fun m!204121 () Bool)

(assert (=> bs!10535 m!204121))

(assert (=> bs!10535 m!203205))

(assert (=> bs!10535 m!202861))

(assert (=> bs!10535 m!202863))

(declare-fun m!204123 () Bool)

(assert (=> bs!10535 m!204123))

(assert (=> d!42898 d!43227))

(declare-fun d!43229 () Bool)

(declare-fun res!111540 () Bool)

(declare-fun e!89033 () Bool)

(assert (=> d!43229 (=> res!111540 e!89033)))

(assert (=> d!43229 (= res!111540 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43229 (= (arrayRangesEq!178 (_2!6104 lt!207320) (_2!6104 lt!207322) #b00000000000000000000000000000000 to!404) e!89033)))

(declare-fun b!134235 () Bool)

(declare-fun e!89034 () Bool)

(assert (=> b!134235 (= e!89033 e!89034)))

(declare-fun res!111541 () Bool)

(assert (=> b!134235 (=> (not res!111541) (not e!89034))))

(assert (=> b!134235 (= res!111541 (= (select (arr!3425 (_2!6104 lt!207320)) #b00000000000000000000000000000000) (select (arr!3425 (_2!6104 lt!207322)) #b00000000000000000000000000000000)))))

(declare-fun b!134236 () Bool)

(assert (=> b!134236 (= e!89034 (arrayRangesEq!178 (_2!6104 lt!207320) (_2!6104 lt!207322) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43229 (not res!111540)) b!134235))

(assert (= (and b!134235 res!111541) b!134236))

(declare-fun m!204125 () Bool)

(assert (=> b!134235 m!204125))

(declare-fun m!204127 () Bool)

(assert (=> b!134235 m!204127))

(declare-fun m!204129 () Bool)

(assert (=> b!134236 m!204129))

(assert (=> d!42898 d!43229))

(assert (=> d!42898 d!42904))

(assert (=> d!42898 d!42930))

(assert (=> d!42898 d!42932))

(assert (=> b!133876 d!42857))

(assert (=> b!133876 d!42845))

(declare-fun b!134251 () Bool)

(declare-fun e!89050 () Bool)

(declare-fun e!89048 () Bool)

(assert (=> b!134251 (= e!89050 e!89048)))

(declare-datatypes ((tuple4!116 0))(
  ( (tuple4!117 (_1!6117 (_ BitVec 32)) (_2!6117 (_ BitVec 32)) (_3!315 (_ BitVec 32)) (_4!58 (_ BitVec 32))) )
))
(declare-fun lt!208194 () tuple4!116)

(declare-fun lt!208193 () (_ BitVec 32))

(declare-fun res!111552 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134251 (= res!111552 (byteRangesEq!0 (select (arr!3425 (buf!3158 thiss!1634)) (_3!315 lt!208194)) (select (arr!3425 (buf!3158 (_2!6107 lt!206912))) (_3!315 lt!208194)) lt!208193 #b00000000000000000000000000001000))))

(assert (=> b!134251 (=> (not res!111552) (not e!89048))))

(declare-fun e!89049 () Bool)

(declare-fun b!134252 () Bool)

(assert (=> b!134252 (= e!89049 (arrayRangesEq!178 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!206912)) (_1!6117 lt!208194) (_2!6117 lt!208194)))))

(declare-fun b!134253 () Bool)

(declare-fun e!89052 () Bool)

(assert (=> b!134253 (= e!89052 e!89050)))

(declare-fun c!7668 () Bool)

(assert (=> b!134253 (= c!7668 (= (_3!315 lt!208194) (_4!58 lt!208194)))))

(declare-fun bm!1750 () Bool)

(declare-fun lt!208192 () (_ BitVec 32))

(declare-fun call!1753 () Bool)

(assert (=> bm!1750 (= call!1753 (byteRangesEq!0 (ite c!7668 (select (arr!3425 (buf!3158 thiss!1634)) (_3!315 lt!208194)) (select (arr!3425 (buf!3158 thiss!1634)) (_4!58 lt!208194))) (ite c!7668 (select (arr!3425 (buf!3158 (_2!6107 lt!206912))) (_3!315 lt!208194)) (select (arr!3425 (buf!3158 (_2!6107 lt!206912))) (_4!58 lt!208194))) (ite c!7668 lt!208193 #b00000000000000000000000000000000) lt!208192))))

(declare-fun b!134254 () Bool)

(declare-fun e!89051 () Bool)

(assert (=> b!134254 (= e!89051 e!89052)))

(declare-fun res!111553 () Bool)

(assert (=> b!134254 (=> (not res!111553) (not e!89052))))

(assert (=> b!134254 (= res!111553 e!89049)))

(declare-fun res!111554 () Bool)

(assert (=> b!134254 (=> res!111554 e!89049)))

(assert (=> b!134254 (= res!111554 (bvsge (_1!6117 lt!208194) (_2!6117 lt!208194)))))

(assert (=> b!134254 (= lt!208192 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134254 (= lt!208193 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!116)

(assert (=> b!134254 (= lt!208194 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(declare-fun b!134255 () Bool)

(assert (=> b!134255 (= e!89050 call!1753)))

(declare-fun b!134256 () Bool)

(declare-fun res!111556 () Bool)

(assert (=> b!134256 (= res!111556 (= lt!208192 #b00000000000000000000000000000000))))

(declare-fun e!89047 () Bool)

(assert (=> b!134256 (=> res!111556 e!89047)))

(assert (=> b!134256 (= e!89048 e!89047)))

(declare-fun b!134257 () Bool)

(assert (=> b!134257 (= e!89047 call!1753)))

(declare-fun d!43231 () Bool)

(declare-fun res!111555 () Bool)

(assert (=> d!43231 (=> res!111555 e!89051)))

(assert (=> d!43231 (= res!111555 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(assert (=> d!43231 (= (arrayBitRangesEq!0 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!206912)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))) e!89051)))

(assert (= (and d!43231 (not res!111555)) b!134254))

(assert (= (and b!134254 (not res!111554)) b!134252))

(assert (= (and b!134254 res!111553) b!134253))

(assert (= (and b!134253 c!7668) b!134255))

(assert (= (and b!134253 (not c!7668)) b!134251))

(assert (= (and b!134251 res!111552) b!134256))

(assert (= (and b!134256 (not res!111556)) b!134257))

(assert (= (or b!134255 b!134257) bm!1750))

(declare-fun m!204131 () Bool)

(assert (=> b!134251 m!204131))

(declare-fun m!204133 () Bool)

(assert (=> b!134251 m!204133))

(assert (=> b!134251 m!204131))

(assert (=> b!134251 m!204133))

(declare-fun m!204135 () Bool)

(assert (=> b!134251 m!204135))

(declare-fun m!204137 () Bool)

(assert (=> b!134252 m!204137))

(declare-fun m!204139 () Bool)

(assert (=> bm!1750 m!204139))

(assert (=> bm!1750 m!204133))

(declare-fun m!204141 () Bool)

(assert (=> bm!1750 m!204141))

(assert (=> bm!1750 m!204131))

(declare-fun m!204143 () Bool)

(assert (=> bm!1750 m!204143))

(assert (=> b!134254 m!202915))

(declare-fun m!204145 () Bool)

(assert (=> b!134254 m!204145))

(assert (=> b!133878 d!43231))

(assert (=> b!133878 d!42857))

(declare-fun d!43233 () Bool)

(declare-fun res!111557 () Bool)

(declare-fun e!89053 () Bool)

(assert (=> d!43233 (=> (not res!111557) (not e!89053))))

(assert (=> d!43233 (= res!111557 (= (size!2775 (buf!3158 (_1!6106 lt!207401))) (size!2775 (buf!3158 (_2!6106 lt!207401)))))))

(assert (=> d!43233 (= (isPrefixOf!0 (_1!6106 lt!207401) (_2!6106 lt!207401)) e!89053)))

(declare-fun b!134258 () Bool)

(declare-fun res!111559 () Bool)

(assert (=> b!134258 (=> (not res!111559) (not e!89053))))

(assert (=> b!134258 (= res!111559 (bvsle (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!207401))) (currentByte!5949 (_1!6106 lt!207401)) (currentBit!5944 (_1!6106 lt!207401))) (bitIndex!0 (size!2775 (buf!3158 (_2!6106 lt!207401))) (currentByte!5949 (_2!6106 lt!207401)) (currentBit!5944 (_2!6106 lt!207401)))))))

(declare-fun b!134259 () Bool)

(declare-fun e!89054 () Bool)

(assert (=> b!134259 (= e!89053 e!89054)))

(declare-fun res!111558 () Bool)

(assert (=> b!134259 (=> res!111558 e!89054)))

(assert (=> b!134259 (= res!111558 (= (size!2775 (buf!3158 (_1!6106 lt!207401))) #b00000000000000000000000000000000))))

(declare-fun b!134260 () Bool)

(assert (=> b!134260 (= e!89054 (arrayBitRangesEq!0 (buf!3158 (_1!6106 lt!207401)) (buf!3158 (_2!6106 lt!207401)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!207401))) (currentByte!5949 (_1!6106 lt!207401)) (currentBit!5944 (_1!6106 lt!207401)))))))

(assert (= (and d!43233 res!111557) b!134258))

(assert (= (and b!134258 res!111559) b!134259))

(assert (= (and b!134259 (not res!111558)) b!134260))

(declare-fun m!204147 () Bool)

(assert (=> b!134258 m!204147))

(declare-fun m!204149 () Bool)

(assert (=> b!134258 m!204149))

(assert (=> b!134260 m!204147))

(assert (=> b!134260 m!204147))

(declare-fun m!204151 () Bool)

(assert (=> b!134260 m!204151))

(assert (=> d!42948 d!43233))

(declare-fun d!43235 () Bool)

(declare-fun res!111560 () Bool)

(declare-fun e!89055 () Bool)

(assert (=> d!43235 (=> (not res!111560) (not e!89055))))

(assert (=> d!43235 (= res!111560 (= (size!2775 (buf!3158 lt!207397)) (size!2775 (buf!3158 lt!207397))))))

(assert (=> d!43235 (= (isPrefixOf!0 lt!207397 lt!207397) e!89055)))

(declare-fun b!134261 () Bool)

(declare-fun res!111562 () Bool)

(assert (=> b!134261 (=> (not res!111562) (not e!89055))))

(assert (=> b!134261 (= res!111562 (bvsle (bitIndex!0 (size!2775 (buf!3158 lt!207397)) (currentByte!5949 lt!207397) (currentBit!5944 lt!207397)) (bitIndex!0 (size!2775 (buf!3158 lt!207397)) (currentByte!5949 lt!207397) (currentBit!5944 lt!207397))))))

(declare-fun b!134262 () Bool)

(declare-fun e!89056 () Bool)

(assert (=> b!134262 (= e!89055 e!89056)))

(declare-fun res!111561 () Bool)

(assert (=> b!134262 (=> res!111561 e!89056)))

(assert (=> b!134262 (= res!111561 (= (size!2775 (buf!3158 lt!207397)) #b00000000000000000000000000000000))))

(declare-fun b!134263 () Bool)

(assert (=> b!134263 (= e!89056 (arrayBitRangesEq!0 (buf!3158 lt!207397) (buf!3158 lt!207397) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 lt!207397)) (currentByte!5949 lt!207397) (currentBit!5944 lt!207397))))))

(assert (= (and d!43235 res!111560) b!134261))

(assert (= (and b!134261 res!111562) b!134262))

(assert (= (and b!134262 (not res!111561)) b!134263))

(declare-fun m!204153 () Bool)

(assert (=> b!134261 m!204153))

(assert (=> b!134261 m!204153))

(assert (=> b!134263 m!204153))

(assert (=> b!134263 m!204153))

(declare-fun m!204155 () Bool)

(assert (=> b!134263 m!204155))

(assert (=> d!42948 d!43235))

(declare-fun d!43237 () Bool)

(assert (=> d!43237 (isPrefixOf!0 (_2!6107 lt!206919) (_2!6107 lt!206919))))

(declare-fun lt!208197 () Unit!8285)

(declare-fun choose!11 (BitStream!4814) Unit!8285)

(assert (=> d!43237 (= lt!208197 (choose!11 (_2!6107 lt!206919)))))

(assert (=> d!43237 (= (lemmaIsPrefixRefl!0 (_2!6107 lt!206919)) lt!208197)))

(declare-fun bs!10537 () Bool)

(assert (= bs!10537 d!43237))

(assert (=> bs!10537 m!203101))

(declare-fun m!204157 () Bool)

(assert (=> bs!10537 m!204157))

(assert (=> d!42948 d!43237))

(assert (=> d!42948 d!42940))

(declare-fun d!43239 () Bool)

(assert (=> d!43239 (isPrefixOf!0 lt!207397 (_2!6107 lt!206919))))

(declare-fun lt!208198 () Unit!8285)

(assert (=> d!43239 (= lt!208198 (choose!30 lt!207397 thiss!1634 (_2!6107 lt!206919)))))

(assert (=> d!43239 (isPrefixOf!0 lt!207397 thiss!1634)))

(assert (=> d!43239 (= (lemmaIsPrefixTransitive!0 lt!207397 thiss!1634 (_2!6107 lt!206919)) lt!208198)))

(declare-fun bs!10538 () Bool)

(assert (= bs!10538 d!43239))

(assert (=> bs!10538 m!203303))

(declare-fun m!204159 () Bool)

(assert (=> bs!10538 m!204159))

(declare-fun m!204161 () Bool)

(assert (=> bs!10538 m!204161))

(assert (=> d!42948 d!43239))

(declare-fun d!43241 () Bool)

(declare-fun res!111563 () Bool)

(declare-fun e!89057 () Bool)

(assert (=> d!43241 (=> (not res!111563) (not e!89057))))

(assert (=> d!43241 (= res!111563 (= (size!2775 (buf!3158 thiss!1634)) (size!2775 (buf!3158 thiss!1634))))))

(assert (=> d!43241 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!89057)))

(declare-fun b!134264 () Bool)

(declare-fun res!111565 () Bool)

(assert (=> b!134264 (=> (not res!111565) (not e!89057))))

(assert (=> b!134264 (= res!111565 (bvsle (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)) (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(declare-fun b!134265 () Bool)

(declare-fun e!89058 () Bool)

(assert (=> b!134265 (= e!89057 e!89058)))

(declare-fun res!111564 () Bool)

(assert (=> b!134265 (=> res!111564 e!89058)))

(assert (=> b!134265 (= res!111564 (= (size!2775 (buf!3158 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!134266 () Bool)

(assert (=> b!134266 (= e!89058 (arrayBitRangesEq!0 (buf!3158 thiss!1634) (buf!3158 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(assert (= (and d!43241 res!111563) b!134264))

(assert (= (and b!134264 res!111565) b!134265))

(assert (= (and b!134265 (not res!111564)) b!134266))

(assert (=> b!134264 m!202915))

(assert (=> b!134264 m!202915))

(assert (=> b!134266 m!202915))

(assert (=> b!134266 m!202915))

(declare-fun m!204163 () Bool)

(assert (=> b!134266 m!204163))

(assert (=> d!42948 d!43241))

(declare-fun d!43243 () Bool)

(assert (=> d!43243 (isPrefixOf!0 lt!207397 (_2!6107 lt!206919))))

(declare-fun lt!208199 () Unit!8285)

(assert (=> d!43243 (= lt!208199 (choose!30 lt!207397 (_2!6107 lt!206919) (_2!6107 lt!206919)))))

(assert (=> d!43243 (isPrefixOf!0 lt!207397 (_2!6107 lt!206919))))

(assert (=> d!43243 (= (lemmaIsPrefixTransitive!0 lt!207397 (_2!6107 lt!206919) (_2!6107 lt!206919)) lt!208199)))

(declare-fun bs!10539 () Bool)

(assert (= bs!10539 d!43243))

(assert (=> bs!10539 m!203303))

(declare-fun m!204165 () Bool)

(assert (=> bs!10539 m!204165))

(assert (=> bs!10539 m!203303))

(assert (=> d!42948 d!43243))

(declare-fun d!43245 () Bool)

(assert (=> d!43245 (isPrefixOf!0 lt!207397 lt!207397)))

(declare-fun lt!208200 () Unit!8285)

(assert (=> d!43245 (= lt!208200 (choose!11 lt!207397))))

(assert (=> d!43245 (= (lemmaIsPrefixRefl!0 lt!207397) lt!208200)))

(declare-fun bs!10540 () Bool)

(assert (= bs!10540 d!43245))

(assert (=> bs!10540 m!203297))

(declare-fun m!204167 () Bool)

(assert (=> bs!10540 m!204167))

(assert (=> d!42948 d!43245))

(declare-fun d!43247 () Bool)

(assert (=> d!43247 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!208201 () Unit!8285)

(assert (=> d!43247 (= lt!208201 (choose!11 thiss!1634))))

(assert (=> d!43247 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!208201)))

(declare-fun bs!10541 () Bool)

(assert (= bs!10541 d!43247))

(assert (=> bs!10541 m!203255))

(declare-fun m!204169 () Bool)

(assert (=> bs!10541 m!204169))

(assert (=> d!42948 d!43247))

(declare-fun d!43249 () Bool)

(declare-fun res!111566 () Bool)

(declare-fun e!89059 () Bool)

(assert (=> d!43249 (=> (not res!111566) (not e!89059))))

(assert (=> d!43249 (= res!111566 (= (size!2775 (buf!3158 (_2!6107 lt!206919))) (size!2775 (buf!3158 (_2!6107 lt!206919)))))))

(assert (=> d!43249 (= (isPrefixOf!0 (_2!6107 lt!206919) (_2!6107 lt!206919)) e!89059)))

(declare-fun b!134267 () Bool)

(declare-fun res!111568 () Bool)

(assert (=> b!134267 (=> (not res!111568) (not e!89059))))

(assert (=> b!134267 (= res!111568 (bvsle (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))))))

(declare-fun b!134268 () Bool)

(declare-fun e!89060 () Bool)

(assert (=> b!134268 (= e!89059 e!89060)))

(declare-fun res!111567 () Bool)

(assert (=> b!134268 (=> res!111567 e!89060)))

(assert (=> b!134268 (= res!111567 (= (size!2775 (buf!3158 (_2!6107 lt!206919))) #b00000000000000000000000000000000))))

(declare-fun b!134269 () Bool)

(assert (=> b!134269 (= e!89060 (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206919)) (buf!3158 (_2!6107 lt!206919)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))))))

(assert (= (and d!43249 res!111566) b!134267))

(assert (= (and b!134267 res!111568) b!134268))

(assert (= (and b!134268 (not res!111567)) b!134269))

(assert (=> b!134267 m!202913))

(assert (=> b!134267 m!202913))

(assert (=> b!134269 m!202913))

(assert (=> b!134269 m!202913))

(declare-fun m!204171 () Bool)

(assert (=> b!134269 m!204171))

(assert (=> d!42948 d!43249))

(declare-fun d!43251 () Bool)

(declare-fun res!111569 () Bool)

(declare-fun e!89061 () Bool)

(assert (=> d!43251 (=> (not res!111569) (not e!89061))))

(assert (=> d!43251 (= res!111569 (= (size!2775 (buf!3158 lt!207397)) (size!2775 (buf!3158 (_2!6107 lt!206919)))))))

(assert (=> d!43251 (= (isPrefixOf!0 lt!207397 (_2!6107 lt!206919)) e!89061)))

(declare-fun b!134270 () Bool)

(declare-fun res!111571 () Bool)

(assert (=> b!134270 (=> (not res!111571) (not e!89061))))

(assert (=> b!134270 (= res!111571 (bvsle (bitIndex!0 (size!2775 (buf!3158 lt!207397)) (currentByte!5949 lt!207397) (currentBit!5944 lt!207397)) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))))))

(declare-fun b!134271 () Bool)

(declare-fun e!89062 () Bool)

(assert (=> b!134271 (= e!89061 e!89062)))

(declare-fun res!111570 () Bool)

(assert (=> b!134271 (=> res!111570 e!89062)))

(assert (=> b!134271 (= res!111570 (= (size!2775 (buf!3158 lt!207397)) #b00000000000000000000000000000000))))

(declare-fun b!134272 () Bool)

(assert (=> b!134272 (= e!89062 (arrayBitRangesEq!0 (buf!3158 lt!207397) (buf!3158 (_2!6107 lt!206919)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 lt!207397)) (currentByte!5949 lt!207397) (currentBit!5944 lt!207397))))))

(assert (= (and d!43251 res!111569) b!134270))

(assert (= (and b!134270 res!111571) b!134271))

(assert (= (and b!134271 (not res!111570)) b!134272))

(assert (=> b!134270 m!204153))

(assert (=> b!134270 m!202913))

(assert (=> b!134272 m!204153))

(assert (=> b!134272 m!204153))

(declare-fun m!204173 () Bool)

(assert (=> b!134272 m!204173))

(assert (=> d!42948 d!43251))

(declare-fun b!134273 () Bool)

(declare-fun e!89065 () tuple3!510)

(declare-fun lt!208207 () Unit!8285)

(declare-fun lt!208213 () tuple3!510)

(assert (=> b!134273 (= e!89065 (tuple3!511 lt!208207 (_2!6110 lt!208213) (_3!312 lt!208213)))))

(declare-fun lt!208203 () tuple2!11596)

(assert (=> b!134273 (= lt!208203 (readByte!0 (_1!6106 lt!206930)))))

(declare-fun lt!208217 () array!6131)

(assert (=> b!134273 (= lt!208217 (array!6132 (store (arr!3425 lt!206927) (bvadd #b00000000000000000000000000000001 from!447) (_1!6111 lt!208203)) (size!2775 lt!206927)))))

(declare-fun lt!208220 () (_ BitVec 64))

(assert (=> b!134273 (= lt!208220 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!208221 () (_ BitVec 32))

(assert (=> b!134273 (= lt!208221 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!208236 () Unit!8285)

(assert (=> b!134273 (= lt!208236 (validateOffsetBytesFromBitIndexLemma!0 (_1!6106 lt!206930) (_2!6111 lt!208203) lt!208220 lt!208221))))

(assert (=> b!134273 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6111 lt!208203)))) ((_ sign_extend 32) (currentByte!5949 (_2!6111 lt!208203))) ((_ sign_extend 32) (currentBit!5944 (_2!6111 lt!208203))) (bvsub lt!208221 ((_ extract 31 0) (bvsdiv (bvadd lt!208220 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!208233 () Unit!8285)

(assert (=> b!134273 (= lt!208233 lt!208236)))

(assert (=> b!134273 (= lt!208213 (readByteArrayLoop!0 (_2!6111 lt!208203) lt!208217 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1754 () (_ BitVec 64))

(assert (=> b!134273 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6111 lt!208203))) (currentByte!5949 (_2!6111 lt!208203)) (currentBit!5944 (_2!6111 lt!208203))) (bvadd call!1754 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!208227 () Unit!8285)

(declare-fun Unit!8354 () Unit!8285)

(assert (=> b!134273 (= lt!208227 Unit!8354)))

(assert (=> b!134273 (= (bvadd (bitIndex!0 (size!2775 (buf!3158 (_2!6111 lt!208203))) (currentByte!5949 (_2!6111 lt!208203)) (currentBit!5944 (_2!6111 lt!208203))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2775 (buf!3158 (_2!6110 lt!208213))) (currentByte!5949 (_2!6110 lt!208213)) (currentBit!5944 (_2!6110 lt!208213))))))

(declare-fun lt!208215 () Unit!8285)

(declare-fun Unit!8355 () Unit!8285)

(assert (=> b!134273 (= lt!208215 Unit!8355)))

(assert (=> b!134273 (= (bvadd call!1754 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2775 (buf!3158 (_2!6110 lt!208213))) (currentByte!5949 (_2!6110 lt!208213)) (currentBit!5944 (_2!6110 lt!208213))))))

(declare-fun lt!208206 () Unit!8285)

(declare-fun Unit!8356 () Unit!8285)

(assert (=> b!134273 (= lt!208206 Unit!8356)))

(assert (=> b!134273 (and (= (buf!3158 (_1!6106 lt!206930)) (buf!3158 (_2!6110 lt!208213))) (= (size!2775 lt!206927) (size!2775 (_3!312 lt!208213))))))

(declare-fun lt!208211 () Unit!8285)

(declare-fun Unit!8357 () Unit!8285)

(assert (=> b!134273 (= lt!208211 Unit!8357)))

(declare-fun lt!208219 () Unit!8285)

(assert (=> b!134273 (= lt!208219 (arrayUpdatedAtPrefixLemma!4 lt!206927 (bvadd #b00000000000000000000000000000001 from!447) (_1!6111 lt!208203)))))

(declare-fun call!1755 () Bool)

(assert (=> b!134273 call!1755))

(declare-fun lt!208222 () Unit!8285)

(assert (=> b!134273 (= lt!208222 lt!208219)))

(declare-fun lt!208237 () (_ BitVec 32))

(assert (=> b!134273 (= lt!208237 #b00000000000000000000000000000000)))

(declare-fun lt!208226 () Unit!8285)

(assert (=> b!134273 (= lt!208226 (arrayRangesEqTransitive!4 lt!206927 lt!208217 (_3!312 lt!208213) lt!208237 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!134273 (arrayRangesEq!178 lt!206927 (_3!312 lt!208213) lt!208237 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!208225 () Unit!8285)

(assert (=> b!134273 (= lt!208225 lt!208226)))

(declare-fun call!1756 () Bool)

(assert (=> b!134273 call!1756))

(declare-fun lt!208234 () Unit!8285)

(declare-fun Unit!8358 () Unit!8285)

(assert (=> b!134273 (= lt!208234 Unit!8358)))

(declare-fun lt!208202 () Unit!8285)

(assert (=> b!134273 (= lt!208202 (arrayRangesEqImpliesEq!4 lt!208217 (_3!312 lt!208213) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!134273 (= (select (store (arr!3425 lt!206927) (bvadd #b00000000000000000000000000000001 from!447) (_1!6111 lt!208203)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3425 (_3!312 lt!208213)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!208216 () Unit!8285)

(assert (=> b!134273 (= lt!208216 lt!208202)))

(declare-fun lt!208232 () Bool)

(assert (=> b!134273 (= lt!208232 (= (select (arr!3425 (_3!312 lt!208213)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6111 lt!208203)))))

(declare-fun Unit!8359 () Unit!8285)

(assert (=> b!134273 (= lt!208207 Unit!8359)))

(assert (=> b!134273 lt!208232))

(declare-fun e!89064 () Bool)

(declare-fun b!134274 () Bool)

(declare-fun lt!208212 () tuple3!510)

(assert (=> b!134274 (= e!89064 (arrayRangesEq!178 lt!206927 (_3!312 lt!208212) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun e!89063 () Bool)

(declare-fun b!134275 () Bool)

(assert (=> b!134275 (= e!89063 (= (select (arr!3425 (_3!312 lt!208212)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6105 (readBytePure!0 (_1!6106 lt!206930)))))))

(assert (=> b!134275 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2775 (_3!312 lt!208212))))))

(declare-fun bm!1751 () Bool)

(declare-fun c!7669 () Bool)

(assert (=> bm!1751 (= call!1755 (arrayRangesEq!178 lt!206927 (ite c!7669 (array!6132 (store (arr!3425 lt!206927) (bvadd #b00000000000000000000000000000001 from!447) (_1!6111 lt!208203)) (size!2775 lt!206927)) lt!206927) #b00000000000000000000000000000000 (ite c!7669 (bvadd #b00000000000000000000000000000001 from!447) (size!2775 lt!206927))))))

(declare-fun b!134276 () Bool)

(declare-fun res!111572 () Bool)

(assert (=> b!134276 (=> (not res!111572) (not e!89064))))

(assert (=> b!134276 (= res!111572 (and (= (buf!3158 (_1!6106 lt!206930)) (buf!3158 (_2!6110 lt!208212))) (= (size!2775 lt!206927) (size!2775 (_3!312 lt!208212)))))))

(declare-fun bm!1752 () Bool)

(assert (=> bm!1752 (= call!1754 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!206930))) (currentByte!5949 (_1!6106 lt!206930)) (currentBit!5944 (_1!6106 lt!206930))))))

(declare-fun d!43253 () Bool)

(assert (=> d!43253 e!89063))

(declare-fun res!111574 () Bool)

(assert (=> d!43253 (=> res!111574 e!89063)))

(assert (=> d!43253 (= res!111574 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208205 () Bool)

(assert (=> d!43253 (= lt!208205 e!89064)))

(declare-fun res!111573 () Bool)

(assert (=> d!43253 (=> (not res!111573) (not e!89064))))

(declare-fun lt!208228 () (_ BitVec 64))

(declare-fun lt!208231 () (_ BitVec 64))

(assert (=> d!43253 (= res!111573 (= (bvadd lt!208231 lt!208228) (bitIndex!0 (size!2775 (buf!3158 (_2!6110 lt!208212))) (currentByte!5949 (_2!6110 lt!208212)) (currentBit!5944 (_2!6110 lt!208212)))))))

(assert (=> d!43253 (or (not (= (bvand lt!208231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208228 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!208231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!208231 lt!208228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!208223 () (_ BitVec 64))

(assert (=> d!43253 (= lt!208228 (bvmul lt!208223 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43253 (or (= lt!208223 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!208223 #b0000000000000000000000000000000000000000000000000000000000001000) lt!208223)))))

(assert (=> d!43253 (= lt!208223 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!43253 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!43253 (= lt!208231 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!206930))) (currentByte!5949 (_1!6106 lt!206930)) (currentBit!5944 (_1!6106 lt!206930))))))

(assert (=> d!43253 (= lt!208212 e!89065)))

(assert (=> d!43253 (= c!7669 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43253 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2775 lt!206927)))))

(assert (=> d!43253 (= (readByteArrayLoop!0 (_1!6106 lt!206930) lt!206927 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!208212)))

(declare-fun b!134277 () Bool)

(declare-fun lt!208230 () Unit!8285)

(assert (=> b!134277 (= e!89065 (tuple3!511 lt!208230 (_1!6106 lt!206930) lt!206927))))

(assert (=> b!134277 (= call!1754 call!1754)))

(declare-fun lt!208218 () Unit!8285)

(declare-fun Unit!8360 () Unit!8285)

(assert (=> b!134277 (= lt!208218 Unit!8360)))

(declare-fun lt!208235 () Unit!8285)

(assert (=> b!134277 (= lt!208235 (arrayRangesEqReflexiveLemma!4 lt!206927))))

(assert (=> b!134277 call!1755))

(declare-fun lt!208214 () Unit!8285)

(assert (=> b!134277 (= lt!208214 lt!208235)))

(declare-fun lt!208229 () array!6131)

(assert (=> b!134277 (= lt!208229 lt!206927)))

(declare-fun lt!208210 () array!6131)

(assert (=> b!134277 (= lt!208210 lt!206927)))

(declare-fun lt!208208 () (_ BitVec 32))

(assert (=> b!134277 (= lt!208208 #b00000000000000000000000000000000)))

(declare-fun lt!208209 () (_ BitVec 32))

(assert (=> b!134277 (= lt!208209 (size!2775 lt!206927))))

(declare-fun lt!208204 () (_ BitVec 32))

(assert (=> b!134277 (= lt!208204 #b00000000000000000000000000000000)))

(declare-fun lt!208224 () (_ BitVec 32))

(assert (=> b!134277 (= lt!208224 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!134277 (= lt!208230 (arrayRangesEqSlicedLemma!4 lt!208229 lt!208210 lt!208208 lt!208209 lt!208204 lt!208224))))

(assert (=> b!134277 call!1756))

(declare-fun bm!1753 () Bool)

(assert (=> bm!1753 (= call!1756 (arrayRangesEq!178 (ite c!7669 lt!206927 lt!208229) (ite c!7669 (_3!312 lt!208213) lt!208210) (ite c!7669 #b00000000000000000000000000000000 lt!208204) (ite c!7669 (bvadd #b00000000000000000000000000000001 from!447) lt!208224)))))

(assert (= (and d!43253 c!7669) b!134273))

(assert (= (and d!43253 (not c!7669)) b!134277))

(assert (= (or b!134273 b!134277) bm!1751))

(assert (= (or b!134273 b!134277) bm!1753))

(assert (= (or b!134273 b!134277) bm!1752))

(assert (= (and d!43253 res!111573) b!134276))

(assert (= (and b!134276 res!111572) b!134274))

(assert (= (and d!43253 (not res!111574)) b!134275))

(declare-fun m!204175 () Bool)

(assert (=> bm!1751 m!204175))

(declare-fun m!204177 () Bool)

(assert (=> bm!1751 m!204177))

(declare-fun m!204179 () Bool)

(assert (=> b!134277 m!204179))

(declare-fun m!204181 () Bool)

(assert (=> b!134277 m!204181))

(declare-fun m!204183 () Bool)

(assert (=> d!43253 m!204183))

(declare-fun m!204185 () Bool)

(assert (=> d!43253 m!204185))

(assert (=> bm!1752 m!204185))

(declare-fun m!204187 () Bool)

(assert (=> bm!1753 m!204187))

(declare-fun m!204189 () Bool)

(assert (=> b!134273 m!204189))

(declare-fun m!204191 () Bool)

(assert (=> b!134273 m!204191))

(declare-fun m!204193 () Bool)

(assert (=> b!134273 m!204193))

(declare-fun m!204195 () Bool)

(assert (=> b!134273 m!204195))

(declare-fun m!204197 () Bool)

(assert (=> b!134273 m!204197))

(declare-fun m!204199 () Bool)

(assert (=> b!134273 m!204199))

(declare-fun m!204201 () Bool)

(assert (=> b!134273 m!204201))

(declare-fun m!204203 () Bool)

(assert (=> b!134273 m!204203))

(declare-fun m!204205 () Bool)

(assert (=> b!134273 m!204205))

(declare-fun m!204207 () Bool)

(assert (=> b!134273 m!204207))

(assert (=> b!134273 m!204175))

(declare-fun m!204209 () Bool)

(assert (=> b!134273 m!204209))

(declare-fun m!204211 () Bool)

(assert (=> b!134273 m!204211))

(declare-fun m!204213 () Bool)

(assert (=> b!134274 m!204213))

(declare-fun m!204215 () Bool)

(assert (=> b!134275 m!204215))

(declare-fun m!204217 () Bool)

(assert (=> b!134275 m!204217))

(assert (=> d!42918 d!43253))

(declare-fun d!43255 () Bool)

(declare-fun lt!208243 () (_ BitVec 8))

(declare-fun lt!208238 () (_ BitVec 8))

(assert (=> d!43255 (= lt!208243 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3425 (buf!3158 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))) (currentByte!5949 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))) ((_ sign_extend 24) lt!208238))))))

(assert (=> d!43255 (= lt!208238 ((_ extract 7 0) (currentBit!5944 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))))

(declare-fun e!89066 () Bool)

(assert (=> d!43255 e!89066))

(declare-fun res!111576 () Bool)

(assert (=> d!43255 (=> (not res!111576) (not e!89066))))

(assert (=> d!43255 (= res!111576 (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))) ((_ sign_extend 32) (currentByte!5949 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))) ((_ sign_extend 32) (currentBit!5944 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8361 () Unit!8285)

(declare-fun Unit!8362 () Unit!8285)

(assert (=> d!43255 (= (readByte!0 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))) (tuple2!11597 (_2!6116 (ite (bvsgt ((_ sign_extend 24) lt!208238) #b00000000000000000000000000000000) (tuple2!11603 Unit!8361 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!208243) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3425 (buf!3158 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))) (bvadd (currentByte!5949 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!208238)))))))) (tuple2!11603 Unit!8362 lt!208243))) (BitStream!4815 (buf!3158 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))) (bvadd (currentByte!5949 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))) #b00000000000000000000000000000001) (currentBit!5944 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))))

(declare-fun b!134278 () Bool)

(declare-fun e!89067 () Bool)

(assert (=> b!134278 (= e!89066 e!89067)))

(declare-fun res!111575 () Bool)

(assert (=> b!134278 (=> (not res!111575) (not e!89067))))

(declare-fun lt!208242 () tuple2!11596)

(assert (=> b!134278 (= res!111575 (= (buf!3158 (_2!6111 lt!208242)) (buf!3158 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))))

(declare-fun lt!208244 () (_ BitVec 8))

(declare-fun lt!208240 () (_ BitVec 8))

(declare-fun Unit!8363 () Unit!8285)

(declare-fun Unit!8364 () Unit!8285)

(assert (=> b!134278 (= lt!208242 (tuple2!11597 (_2!6116 (ite (bvsgt ((_ sign_extend 24) lt!208240) #b00000000000000000000000000000000) (tuple2!11603 Unit!8363 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!208244) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3425 (buf!3158 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))) (bvadd (currentByte!5949 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!208240)))))))) (tuple2!11603 Unit!8364 lt!208244))) (BitStream!4815 (buf!3158 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))) (bvadd (currentByte!5949 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))) #b00000000000000000000000000000001) (currentBit!5944 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))))

(assert (=> b!134278 (= lt!208244 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3425 (buf!3158 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))) (currentByte!5949 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))) ((_ sign_extend 24) lt!208240))))))

(assert (=> b!134278 (= lt!208240 ((_ extract 7 0) (currentBit!5944 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))))

(declare-fun lt!208241 () (_ BitVec 64))

(declare-fun b!134279 () Bool)

(declare-fun lt!208239 () (_ BitVec 64))

(assert (=> b!134279 (= e!89067 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6111 lt!208242))) (currentByte!5949 (_2!6111 lt!208242)) (currentBit!5944 (_2!6111 lt!208242))) (bvadd lt!208241 lt!208239)))))

(assert (=> b!134279 (or (not (= (bvand lt!208241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208239 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!208241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!208241 lt!208239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!134279 (= lt!208239 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!134279 (= lt!208241 (bitIndex!0 (size!2775 (buf!3158 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))) (currentByte!5949 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))) (currentBit!5944 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))))

(assert (= (and d!43255 res!111576) b!134278))

(assert (= (and b!134278 res!111575) b!134279))

(declare-fun m!204219 () Bool)

(assert (=> d!43255 m!204219))

(declare-fun m!204221 () Bool)

(assert (=> d!43255 m!204221))

(declare-fun m!204223 () Bool)

(assert (=> d!43255 m!204223))

(assert (=> b!134278 m!204223))

(assert (=> b!134278 m!204219))

(declare-fun m!204225 () Bool)

(assert (=> b!134279 m!204225))

(declare-fun m!204227 () Bool)

(assert (=> b!134279 m!204227))

(assert (=> d!42934 d!43255))

(declare-fun d!43257 () Bool)

(declare-fun res!111577 () Bool)

(declare-fun e!89068 () Bool)

(assert (=> d!43257 (=> (not res!111577) (not e!89068))))

(assert (=> d!43257 (= res!111577 (= (size!2775 (buf!3158 (_2!6107 lt!206919))) (size!2775 (buf!3158 (_2!6107 lt!207302)))))))

(assert (=> d!43257 (= (isPrefixOf!0 (_2!6107 lt!206919) (_2!6107 lt!207302)) e!89068)))

(declare-fun b!134280 () Bool)

(declare-fun res!111579 () Bool)

(assert (=> b!134280 (=> (not res!111579) (not e!89068))))

(assert (=> b!134280 (= res!111579 (bvsle (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!207302))) (currentByte!5949 (_2!6107 lt!207302)) (currentBit!5944 (_2!6107 lt!207302)))))))

(declare-fun b!134281 () Bool)

(declare-fun e!89069 () Bool)

(assert (=> b!134281 (= e!89068 e!89069)))

(declare-fun res!111578 () Bool)

(assert (=> b!134281 (=> res!111578 e!89069)))

(assert (=> b!134281 (= res!111578 (= (size!2775 (buf!3158 (_2!6107 lt!206919))) #b00000000000000000000000000000000))))

(declare-fun b!134282 () Bool)

(assert (=> b!134282 (= e!89069 (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206919)) (buf!3158 (_2!6107 lt!207302)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))))))

(assert (= (and d!43257 res!111577) b!134280))

(assert (= (and b!134280 res!111579) b!134281))

(assert (= (and b!134281 (not res!111578)) b!134282))

(assert (=> b!134280 m!202913))

(assert (=> b!134280 m!203191))

(assert (=> b!134282 m!202913))

(assert (=> b!134282 m!202913))

(declare-fun m!204229 () Bool)

(assert (=> b!134282 m!204229))

(assert (=> b!133860 d!43257))

(declare-fun b!134283 () Bool)

(declare-fun e!89073 () Bool)

(declare-fun e!89071 () Bool)

(assert (=> b!134283 (= e!89073 e!89071)))

(declare-fun res!111580 () Bool)

(declare-fun lt!208246 () (_ BitVec 32))

(declare-fun lt!208247 () tuple4!116)

(assert (=> b!134283 (= res!111580 (byteRangesEq!0 (select (arr!3425 (buf!3158 thiss!1634)) (_3!315 lt!208247)) (select (arr!3425 (buf!3158 (_2!6107 lt!206919))) (_3!315 lt!208247)) lt!208246 #b00000000000000000000000000001000))))

(assert (=> b!134283 (=> (not res!111580) (not e!89071))))

(declare-fun e!89072 () Bool)

(declare-fun b!134284 () Bool)

(assert (=> b!134284 (= e!89072 (arrayRangesEq!178 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!206919)) (_1!6117 lt!208247) (_2!6117 lt!208247)))))

(declare-fun b!134285 () Bool)

(declare-fun e!89075 () Bool)

(assert (=> b!134285 (= e!89075 e!89073)))

(declare-fun c!7670 () Bool)

(assert (=> b!134285 (= c!7670 (= (_3!315 lt!208247) (_4!58 lt!208247)))))

(declare-fun lt!208245 () (_ BitVec 32))

(declare-fun bm!1754 () Bool)

(declare-fun call!1757 () Bool)

(assert (=> bm!1754 (= call!1757 (byteRangesEq!0 (ite c!7670 (select (arr!3425 (buf!3158 thiss!1634)) (_3!315 lt!208247)) (select (arr!3425 (buf!3158 thiss!1634)) (_4!58 lt!208247))) (ite c!7670 (select (arr!3425 (buf!3158 (_2!6107 lt!206919))) (_3!315 lt!208247)) (select (arr!3425 (buf!3158 (_2!6107 lt!206919))) (_4!58 lt!208247))) (ite c!7670 lt!208246 #b00000000000000000000000000000000) lt!208245))))

(declare-fun b!134286 () Bool)

(declare-fun e!89074 () Bool)

(assert (=> b!134286 (= e!89074 e!89075)))

(declare-fun res!111581 () Bool)

(assert (=> b!134286 (=> (not res!111581) (not e!89075))))

(assert (=> b!134286 (= res!111581 e!89072)))

(declare-fun res!111582 () Bool)

(assert (=> b!134286 (=> res!111582 e!89072)))

(assert (=> b!134286 (= res!111582 (bvsge (_1!6117 lt!208247) (_2!6117 lt!208247)))))

(assert (=> b!134286 (= lt!208245 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134286 (= lt!208246 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134286 (= lt!208247 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(declare-fun b!134287 () Bool)

(assert (=> b!134287 (= e!89073 call!1757)))

(declare-fun b!134288 () Bool)

(declare-fun res!111584 () Bool)

(assert (=> b!134288 (= res!111584 (= lt!208245 #b00000000000000000000000000000000))))

(declare-fun e!89070 () Bool)

(assert (=> b!134288 (=> res!111584 e!89070)))

(assert (=> b!134288 (= e!89071 e!89070)))

(declare-fun b!134289 () Bool)

(assert (=> b!134289 (= e!89070 call!1757)))

(declare-fun d!43259 () Bool)

(declare-fun res!111583 () Bool)

(assert (=> d!43259 (=> res!111583 e!89074)))

(assert (=> d!43259 (= res!111583 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(assert (=> d!43259 (= (arrayBitRangesEq!0 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!206919)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))) e!89074)))

(assert (= (and d!43259 (not res!111583)) b!134286))

(assert (= (and b!134286 (not res!111582)) b!134284))

(assert (= (and b!134286 res!111581) b!134285))

(assert (= (and b!134285 c!7670) b!134287))

(assert (= (and b!134285 (not c!7670)) b!134283))

(assert (= (and b!134283 res!111580) b!134288))

(assert (= (and b!134288 (not res!111584)) b!134289))

(assert (= (or b!134287 b!134289) bm!1754))

(declare-fun m!204231 () Bool)

(assert (=> b!134283 m!204231))

(declare-fun m!204233 () Bool)

(assert (=> b!134283 m!204233))

(assert (=> b!134283 m!204231))

(assert (=> b!134283 m!204233))

(declare-fun m!204235 () Bool)

(assert (=> b!134283 m!204235))

(declare-fun m!204237 () Bool)

(assert (=> b!134284 m!204237))

(declare-fun m!204239 () Bool)

(assert (=> bm!1754 m!204239))

(assert (=> bm!1754 m!204233))

(declare-fun m!204241 () Bool)

(assert (=> bm!1754 m!204241))

(assert (=> bm!1754 m!204231))

(declare-fun m!204243 () Bool)

(assert (=> bm!1754 m!204243))

(assert (=> b!134286 m!202915))

(assert (=> b!134286 m!204145))

(assert (=> b!133891 d!43259))

(assert (=> b!133891 d!42857))

(declare-fun d!43261 () Bool)

(declare-fun res!111585 () Bool)

(declare-fun e!89076 () Bool)

(assert (=> d!43261 (=> res!111585 e!89076)))

(assert (=> d!43261 (= res!111585 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43261 (= (arrayRangesEq!178 arr!237 (_2!6104 lt!206929) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!89076)))

(declare-fun b!134290 () Bool)

(declare-fun e!89077 () Bool)

(assert (=> b!134290 (= e!89076 e!89077)))

(declare-fun res!111586 () Bool)

(assert (=> b!134290 (=> (not res!111586) (not e!89077))))

(assert (=> b!134290 (= res!111586 (= (select (arr!3425 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3425 (_2!6104 lt!206929)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!134291 () Bool)

(assert (=> b!134291 (= e!89077 (arrayRangesEq!178 arr!237 (_2!6104 lt!206929) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43261 (not res!111585)) b!134290))

(assert (= (and b!134290 res!111586) b!134291))

(declare-fun m!204245 () Bool)

(assert (=> b!134290 m!204245))

(declare-fun m!204247 () Bool)

(assert (=> b!134290 m!204247))

(declare-fun m!204249 () Bool)

(assert (=> b!134291 m!204249))

(assert (=> b!133811 d!43261))

(assert (=> b!133889 d!42857))

(assert (=> b!133889 d!42855))

(declare-fun d!43263 () Bool)

(assert (=> d!43263 (= (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 thiss!1634)))))))

(assert (=> d!42906 d!43263))

(assert (=> d!42916 d!42914))

(declare-fun d!43265 () Bool)

(declare-fun res!111587 () Bool)

(declare-fun e!89078 () Bool)

(assert (=> d!43265 (=> (not res!111587) (not e!89078))))

(assert (=> d!43265 (= res!111587 (= (size!2775 (buf!3158 lt!207352)) (size!2775 (buf!3158 (_2!6107 lt!206912)))))))

(assert (=> d!43265 (= (isPrefixOf!0 lt!207352 (_2!6107 lt!206912)) e!89078)))

(declare-fun b!134292 () Bool)

(declare-fun res!111589 () Bool)

(assert (=> b!134292 (=> (not res!111589) (not e!89078))))

(assert (=> b!134292 (= res!111589 (bvsle (bitIndex!0 (size!2775 (buf!3158 lt!207352)) (currentByte!5949 lt!207352) (currentBit!5944 lt!207352)) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206912))) (currentByte!5949 (_2!6107 lt!206912)) (currentBit!5944 (_2!6107 lt!206912)))))))

(declare-fun b!134293 () Bool)

(declare-fun e!89079 () Bool)

(assert (=> b!134293 (= e!89078 e!89079)))

(declare-fun res!111588 () Bool)

(assert (=> b!134293 (=> res!111588 e!89079)))

(assert (=> b!134293 (= res!111588 (= (size!2775 (buf!3158 lt!207352)) #b00000000000000000000000000000000))))

(declare-fun b!134294 () Bool)

(assert (=> b!134294 (= e!89079 (arrayBitRangesEq!0 (buf!3158 lt!207352) (buf!3158 (_2!6107 lt!206912)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 lt!207352)) (currentByte!5949 lt!207352) (currentBit!5944 lt!207352))))))

(assert (= (and d!43265 res!111587) b!134292))

(assert (= (and b!134292 res!111589) b!134293))

(assert (= (and b!134293 (not res!111588)) b!134294))

(declare-fun m!204251 () Bool)

(assert (=> b!134292 m!204251))

(assert (=> b!134292 m!202919))

(assert (=> b!134294 m!204251))

(assert (=> b!134294 m!204251))

(declare-fun m!204253 () Bool)

(assert (=> b!134294 m!204253))

(assert (=> d!42916 d!43265))

(declare-fun d!43267 () Bool)

(declare-fun res!111590 () Bool)

(declare-fun e!89080 () Bool)

(assert (=> d!43267 (=> (not res!111590) (not e!89080))))

(assert (=> d!43267 (= res!111590 (= (size!2775 (buf!3158 (_2!6107 lt!206912))) (size!2775 (buf!3158 (_2!6107 lt!206912)))))))

(assert (=> d!43267 (= (isPrefixOf!0 (_2!6107 lt!206912) (_2!6107 lt!206912)) e!89080)))

(declare-fun b!134295 () Bool)

(declare-fun res!111592 () Bool)

(assert (=> b!134295 (=> (not res!111592) (not e!89080))))

(assert (=> b!134295 (= res!111592 (bvsle (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206912))) (currentByte!5949 (_2!6107 lt!206912)) (currentBit!5944 (_2!6107 lt!206912))) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206912))) (currentByte!5949 (_2!6107 lt!206912)) (currentBit!5944 (_2!6107 lt!206912)))))))

(declare-fun b!134296 () Bool)

(declare-fun e!89081 () Bool)

(assert (=> b!134296 (= e!89080 e!89081)))

(declare-fun res!111591 () Bool)

(assert (=> b!134296 (=> res!111591 e!89081)))

(assert (=> b!134296 (= res!111591 (= (size!2775 (buf!3158 (_2!6107 lt!206912))) #b00000000000000000000000000000000))))

(declare-fun b!134297 () Bool)

(assert (=> b!134297 (= e!89081 (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206912)) (buf!3158 (_2!6107 lt!206912)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206912))) (currentByte!5949 (_2!6107 lt!206912)) (currentBit!5944 (_2!6107 lt!206912)))))))

(assert (= (and d!43267 res!111590) b!134295))

(assert (= (and b!134295 res!111592) b!134296))

(assert (= (and b!134296 (not res!111591)) b!134297))

(assert (=> b!134295 m!202919))

(assert (=> b!134295 m!202919))

(assert (=> b!134297 m!202919))

(assert (=> b!134297 m!202919))

(declare-fun m!204255 () Bool)

(assert (=> b!134297 m!204255))

(assert (=> d!42916 d!43267))

(declare-fun d!43269 () Bool)

(declare-fun res!111593 () Bool)

(declare-fun e!89082 () Bool)

(assert (=> d!43269 (=> (not res!111593) (not e!89082))))

(assert (=> d!43269 (= res!111593 (= (size!2775 (buf!3158 lt!207352)) (size!2775 (buf!3158 lt!207352))))))

(assert (=> d!43269 (= (isPrefixOf!0 lt!207352 lt!207352) e!89082)))

(declare-fun b!134298 () Bool)

(declare-fun res!111595 () Bool)

(assert (=> b!134298 (=> (not res!111595) (not e!89082))))

(assert (=> b!134298 (= res!111595 (bvsle (bitIndex!0 (size!2775 (buf!3158 lt!207352)) (currentByte!5949 lt!207352) (currentBit!5944 lt!207352)) (bitIndex!0 (size!2775 (buf!3158 lt!207352)) (currentByte!5949 lt!207352) (currentBit!5944 lt!207352))))))

(declare-fun b!134299 () Bool)

(declare-fun e!89083 () Bool)

(assert (=> b!134299 (= e!89082 e!89083)))

(declare-fun res!111594 () Bool)

(assert (=> b!134299 (=> res!111594 e!89083)))

(assert (=> b!134299 (= res!111594 (= (size!2775 (buf!3158 lt!207352)) #b00000000000000000000000000000000))))

(declare-fun b!134300 () Bool)

(assert (=> b!134300 (= e!89083 (arrayBitRangesEq!0 (buf!3158 lt!207352) (buf!3158 lt!207352) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 lt!207352)) (currentByte!5949 lt!207352) (currentBit!5944 lt!207352))))))

(assert (= (and d!43269 res!111593) b!134298))

(assert (= (and b!134298 res!111595) b!134299))

(assert (= (and b!134299 (not res!111594)) b!134300))

(assert (=> b!134298 m!204251))

(assert (=> b!134298 m!204251))

(assert (=> b!134300 m!204251))

(assert (=> b!134300 m!204251))

(declare-fun m!204257 () Bool)

(assert (=> b!134300 m!204257))

(assert (=> d!42916 d!43269))

(assert (=> d!42916 d!43241))

(declare-fun d!43271 () Bool)

(assert (=> d!43271 (isPrefixOf!0 lt!207352 (_2!6107 lt!206912))))

(declare-fun lt!208248 () Unit!8285)

(assert (=> d!43271 (= lt!208248 (choose!30 lt!207352 (_2!6107 lt!206912) (_2!6107 lt!206912)))))

(assert (=> d!43271 (isPrefixOf!0 lt!207352 (_2!6107 lt!206912))))

(assert (=> d!43271 (= (lemmaIsPrefixTransitive!0 lt!207352 (_2!6107 lt!206912) (_2!6107 lt!206912)) lt!208248)))

(declare-fun bs!10542 () Bool)

(assert (= bs!10542 d!43271))

(assert (=> bs!10542 m!203249))

(declare-fun m!204259 () Bool)

(assert (=> bs!10542 m!204259))

(assert (=> bs!10542 m!203249))

(assert (=> d!42916 d!43271))

(declare-fun d!43273 () Bool)

(declare-fun res!111596 () Bool)

(declare-fun e!89084 () Bool)

(assert (=> d!43273 (=> (not res!111596) (not e!89084))))

(assert (=> d!43273 (= res!111596 (= (size!2775 (buf!3158 (_1!6106 lt!207356))) (size!2775 (buf!3158 (_2!6106 lt!207356)))))))

(assert (=> d!43273 (= (isPrefixOf!0 (_1!6106 lt!207356) (_2!6106 lt!207356)) e!89084)))

(declare-fun b!134301 () Bool)

(declare-fun res!111598 () Bool)

(assert (=> b!134301 (=> (not res!111598) (not e!89084))))

(assert (=> b!134301 (= res!111598 (bvsle (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!207356))) (currentByte!5949 (_1!6106 lt!207356)) (currentBit!5944 (_1!6106 lt!207356))) (bitIndex!0 (size!2775 (buf!3158 (_2!6106 lt!207356))) (currentByte!5949 (_2!6106 lt!207356)) (currentBit!5944 (_2!6106 lt!207356)))))))

(declare-fun b!134302 () Bool)

(declare-fun e!89085 () Bool)

(assert (=> b!134302 (= e!89084 e!89085)))

(declare-fun res!111597 () Bool)

(assert (=> b!134302 (=> res!111597 e!89085)))

(assert (=> b!134302 (= res!111597 (= (size!2775 (buf!3158 (_1!6106 lt!207356))) #b00000000000000000000000000000000))))

(declare-fun b!134303 () Bool)

(assert (=> b!134303 (= e!89085 (arrayBitRangesEq!0 (buf!3158 (_1!6106 lt!207356)) (buf!3158 (_2!6106 lt!207356)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!207356))) (currentByte!5949 (_1!6106 lt!207356)) (currentBit!5944 (_1!6106 lt!207356)))))))

(assert (= (and d!43273 res!111596) b!134301))

(assert (= (and b!134301 res!111598) b!134302))

(assert (= (and b!134302 (not res!111597)) b!134303))

(declare-fun m!204261 () Bool)

(assert (=> b!134301 m!204261))

(declare-fun m!204263 () Bool)

(assert (=> b!134301 m!204263))

(assert (=> b!134303 m!204261))

(assert (=> b!134303 m!204261))

(declare-fun m!204265 () Bool)

(assert (=> b!134303 m!204265))

(assert (=> d!42916 d!43273))

(declare-fun d!43275 () Bool)

(assert (=> d!43275 (isPrefixOf!0 (_2!6107 lt!206912) (_2!6107 lt!206912))))

(declare-fun lt!208249 () Unit!8285)

(assert (=> d!43275 (= lt!208249 (choose!11 (_2!6107 lt!206912)))))

(assert (=> d!43275 (= (lemmaIsPrefixRefl!0 (_2!6107 lt!206912)) lt!208249)))

(declare-fun bs!10543 () Bool)

(assert (= bs!10543 d!43275))

(assert (=> bs!10543 m!203091))

(declare-fun m!204267 () Bool)

(assert (=> bs!10543 m!204267))

(assert (=> d!42916 d!43275))

(declare-fun d!43277 () Bool)

(assert (=> d!43277 (isPrefixOf!0 lt!207352 (_2!6107 lt!206912))))

(declare-fun lt!208250 () Unit!8285)

(assert (=> d!43277 (= lt!208250 (choose!30 lt!207352 thiss!1634 (_2!6107 lt!206912)))))

(assert (=> d!43277 (isPrefixOf!0 lt!207352 thiss!1634)))

(assert (=> d!43277 (= (lemmaIsPrefixTransitive!0 lt!207352 thiss!1634 (_2!6107 lt!206912)) lt!208250)))

(declare-fun bs!10544 () Bool)

(assert (= bs!10544 d!43277))

(assert (=> bs!10544 m!203249))

(declare-fun m!204269 () Bool)

(assert (=> bs!10544 m!204269))

(declare-fun m!204271 () Bool)

(assert (=> bs!10544 m!204271))

(assert (=> d!42916 d!43277))

(assert (=> d!42916 d!43247))

(declare-fun d!43279 () Bool)

(assert (=> d!43279 (isPrefixOf!0 lt!207352 lt!207352)))

(declare-fun lt!208251 () Unit!8285)

(assert (=> d!43279 (= lt!208251 (choose!11 lt!207352))))

(assert (=> d!43279 (= (lemmaIsPrefixRefl!0 lt!207352) lt!208251)))

(declare-fun bs!10545 () Bool)

(assert (= bs!10545 d!43279))

(assert (=> bs!10545 m!203243))

(declare-fun m!204273 () Bool)

(assert (=> bs!10545 m!204273))

(assert (=> d!42916 d!43279))

(declare-fun d!43281 () Bool)

(assert (=> d!43281 (= (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919)))) (bvsub (bvmul ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))))))))

(assert (=> d!42920 d!43281))

(declare-fun d!43283 () Bool)

(declare-fun e!89086 () Bool)

(assert (=> d!43283 e!89086))

(declare-fun res!111599 () Bool)

(assert (=> d!43283 (=> (not res!111599) (not e!89086))))

(declare-fun lt!208252 () (_ BitVec 64))

(declare-fun lt!208253 () (_ BitVec 64))

(declare-fun lt!208256 () (_ BitVec 64))

(assert (=> d!43283 (= res!111599 (= lt!208253 (bvsub lt!208252 lt!208256)))))

(assert (=> d!43283 (or (= (bvand lt!208252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208256 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!208252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!208252 lt!208256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43283 (= lt!208256 (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!207302)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!207302))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!207302)))))))

(declare-fun lt!208255 () (_ BitVec 64))

(declare-fun lt!208254 () (_ BitVec 64))

(assert (=> d!43283 (= lt!208252 (bvmul lt!208255 lt!208254))))

(assert (=> d!43283 (or (= lt!208255 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!208254 (bvsdiv (bvmul lt!208255 lt!208254) lt!208255)))))

(assert (=> d!43283 (= lt!208254 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43283 (= lt!208255 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!207302)))))))

(assert (=> d!43283 (= lt!208253 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!207302))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!207302)))))))

(assert (=> d!43283 (invariant!0 (currentBit!5944 (_2!6107 lt!207302)) (currentByte!5949 (_2!6107 lt!207302)) (size!2775 (buf!3158 (_2!6107 lt!207302))))))

(assert (=> d!43283 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!207302))) (currentByte!5949 (_2!6107 lt!207302)) (currentBit!5944 (_2!6107 lt!207302))) lt!208253)))

(declare-fun b!134304 () Bool)

(declare-fun res!111600 () Bool)

(assert (=> b!134304 (=> (not res!111600) (not e!89086))))

(assert (=> b!134304 (= res!111600 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!208253))))

(declare-fun b!134305 () Bool)

(declare-fun lt!208257 () (_ BitVec 64))

(assert (=> b!134305 (= e!89086 (bvsle lt!208253 (bvmul lt!208257 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134305 (or (= lt!208257 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!208257 #b0000000000000000000000000000000000000000000000000000000000001000) lt!208257)))))

(assert (=> b!134305 (= lt!208257 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!207302)))))))

(assert (= (and d!43283 res!111599) b!134304))

(assert (= (and b!134304 res!111600) b!134305))

(declare-fun m!204275 () Bool)

(assert (=> d!43283 m!204275))

(declare-fun m!204277 () Bool)

(assert (=> d!43283 m!204277))

(assert (=> b!133862 d!43283))

(assert (=> b!133862 d!42855))

(declare-fun d!43285 () Bool)

(declare-fun e!89089 () Bool)

(assert (=> d!43285 e!89089))

(declare-fun res!111603 () Bool)

(assert (=> d!43285 (=> (not res!111603) (not e!89089))))

(declare-fun lt!208263 () (_ BitVec 64))

(declare-fun lt!208262 () BitStream!4814)

(assert (=> d!43285 (= res!111603 (= (bvadd lt!208263 (bvsub lt!207178 lt!207176)) (bitIndex!0 (size!2775 (buf!3158 lt!208262)) (currentByte!5949 lt!208262) (currentBit!5944 lt!208262))))))

(assert (=> d!43285 (or (not (= (bvand lt!208263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207178 lt!207176) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!208263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!208263 (bvsub lt!207178 lt!207176)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43285 (= lt!208263 (bitIndex!0 (size!2775 (buf!3158 (_2!6106 lt!207173))) (currentByte!5949 (_2!6106 lt!207173)) (currentBit!5944 (_2!6106 lt!207173))))))

(declare-fun moveBitIndex!0 (BitStream!4814 (_ BitVec 64)) tuple2!11592)

(assert (=> d!43285 (= lt!208262 (_2!6107 (moveBitIndex!0 (_2!6106 lt!207173) (bvsub lt!207178 lt!207176))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4814 (_ BitVec 64)) Bool)

(assert (=> d!43285 (moveBitIndexPrecond!0 (_2!6106 lt!207173) (bvsub lt!207178 lt!207176))))

(assert (=> d!43285 (= (withMovedBitIndex!0 (_2!6106 lt!207173) (bvsub lt!207178 lt!207176)) lt!208262)))

(declare-fun b!134308 () Bool)

(assert (=> b!134308 (= e!89089 (= (size!2775 (buf!3158 (_2!6106 lt!207173))) (size!2775 (buf!3158 lt!208262))))))

(assert (= (and d!43285 res!111603) b!134308))

(declare-fun m!204279 () Bool)

(assert (=> d!43285 m!204279))

(declare-fun m!204281 () Bool)

(assert (=> d!43285 m!204281))

(declare-fun m!204283 () Bool)

(assert (=> d!43285 m!204283))

(declare-fun m!204285 () Bool)

(assert (=> d!43285 m!204285))

(assert (=> b!133804 d!43285))

(assert (=> b!133804 d!42845))

(assert (=> b!133804 d!42855))

(declare-fun d!43287 () Bool)

(declare-fun res!111604 () Bool)

(declare-fun e!89090 () Bool)

(assert (=> d!43287 (=> (not res!111604) (not e!89090))))

(assert (=> d!43287 (= res!111604 (= (size!2775 (buf!3158 (_1!6106 lt!207401))) (size!2775 (buf!3158 thiss!1634))))))

(assert (=> d!43287 (= (isPrefixOf!0 (_1!6106 lt!207401) thiss!1634) e!89090)))

(declare-fun b!134309 () Bool)

(declare-fun res!111606 () Bool)

(assert (=> b!134309 (=> (not res!111606) (not e!89090))))

(assert (=> b!134309 (= res!111606 (bvsle (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!207401))) (currentByte!5949 (_1!6106 lt!207401)) (currentBit!5944 (_1!6106 lt!207401))) (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(declare-fun b!134310 () Bool)

(declare-fun e!89091 () Bool)

(assert (=> b!134310 (= e!89090 e!89091)))

(declare-fun res!111605 () Bool)

(assert (=> b!134310 (=> res!111605 e!89091)))

(assert (=> b!134310 (= res!111605 (= (size!2775 (buf!3158 (_1!6106 lt!207401))) #b00000000000000000000000000000000))))

(declare-fun b!134311 () Bool)

(assert (=> b!134311 (= e!89091 (arrayBitRangesEq!0 (buf!3158 (_1!6106 lt!207401)) (buf!3158 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!207401))) (currentByte!5949 (_1!6106 lt!207401)) (currentBit!5944 (_1!6106 lt!207401)))))))

(assert (= (and d!43287 res!111604) b!134309))

(assert (= (and b!134309 res!111606) b!134310))

(assert (= (and b!134310 (not res!111605)) b!134311))

(assert (=> b!134309 m!204147))

(assert (=> b!134309 m!202915))

(assert (=> b!134311 m!204147))

(assert (=> b!134311 m!204147))

(declare-fun m!204287 () Bool)

(assert (=> b!134311 m!204287))

(assert (=> b!133894 d!43287))

(declare-fun lt!208264 () tuple3!510)

(declare-fun d!43289 () Bool)

(assert (=> d!43289 (= lt!208264 (readByteArrayLoop!0 (_1!6106 lt!207304) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43289 (= (readByteArrayLoopPure!0 (_1!6106 lt!207304) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11587 (_2!6110 lt!208264) (_3!312 lt!208264)))))

(declare-fun bs!10546 () Bool)

(assert (= bs!10546 d!43289))

(declare-fun m!204289 () Bool)

(assert (=> bs!10546 m!204289))

(assert (=> b!133864 d!43289))

(declare-fun d!43291 () Bool)

(assert (=> d!43291 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!207302)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!207303) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!207302)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919)))) lt!207303))))

(declare-fun bs!10547 () Bool)

(assert (= bs!10547 d!43291))

(declare-fun m!204291 () Bool)

(assert (=> bs!10547 m!204291))

(assert (=> b!133864 d!43291))

(declare-fun d!43293 () Bool)

(assert (=> d!43293 (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!207302)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!207303)))

(declare-fun lt!208265 () Unit!8285)

(assert (=> d!43293 (= lt!208265 (choose!9 (_2!6107 lt!206919) (buf!3158 (_2!6107 lt!207302)) lt!207303 (BitStream!4815 (buf!3158 (_2!6107 lt!207302)) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))))))

(assert (=> d!43293 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6107 lt!206919) (buf!3158 (_2!6107 lt!207302)) lt!207303) lt!208265)))

(declare-fun bs!10548 () Bool)

(assert (= bs!10548 d!43293))

(assert (=> bs!10548 m!203185))

(declare-fun m!204293 () Bool)

(assert (=> bs!10548 m!204293))

(assert (=> b!133864 d!43293))

(declare-fun b!134312 () Bool)

(declare-fun e!89093 () Unit!8285)

(declare-fun Unit!8365 () Unit!8285)

(assert (=> b!134312 (= e!89093 Unit!8365)))

(declare-fun d!43295 () Bool)

(declare-fun e!89092 () Bool)

(assert (=> d!43295 e!89092))

(declare-fun res!111608 () Bool)

(assert (=> d!43295 (=> (not res!111608) (not e!89092))))

(declare-fun lt!208277 () tuple2!11590)

(assert (=> d!43295 (= res!111608 (isPrefixOf!0 (_1!6106 lt!208277) (_2!6106 lt!208277)))))

(declare-fun lt!208273 () BitStream!4814)

(assert (=> d!43295 (= lt!208277 (tuple2!11591 lt!208273 (_2!6107 lt!207302)))))

(declare-fun lt!208281 () Unit!8285)

(declare-fun lt!208275 () Unit!8285)

(assert (=> d!43295 (= lt!208281 lt!208275)))

(assert (=> d!43295 (isPrefixOf!0 lt!208273 (_2!6107 lt!207302))))

(assert (=> d!43295 (= lt!208275 (lemmaIsPrefixTransitive!0 lt!208273 (_2!6107 lt!207302) (_2!6107 lt!207302)))))

(declare-fun lt!208266 () Unit!8285)

(declare-fun lt!208269 () Unit!8285)

(assert (=> d!43295 (= lt!208266 lt!208269)))

(assert (=> d!43295 (isPrefixOf!0 lt!208273 (_2!6107 lt!207302))))

(assert (=> d!43295 (= lt!208269 (lemmaIsPrefixTransitive!0 lt!208273 (_2!6107 lt!206919) (_2!6107 lt!207302)))))

(declare-fun lt!208272 () Unit!8285)

(assert (=> d!43295 (= lt!208272 e!89093)))

(declare-fun c!7671 () Bool)

(assert (=> d!43295 (= c!7671 (not (= (size!2775 (buf!3158 (_2!6107 lt!206919))) #b00000000000000000000000000000000)))))

(declare-fun lt!208271 () Unit!8285)

(declare-fun lt!208268 () Unit!8285)

(assert (=> d!43295 (= lt!208271 lt!208268)))

(assert (=> d!43295 (isPrefixOf!0 (_2!6107 lt!207302) (_2!6107 lt!207302))))

(assert (=> d!43295 (= lt!208268 (lemmaIsPrefixRefl!0 (_2!6107 lt!207302)))))

(declare-fun lt!208285 () Unit!8285)

(declare-fun lt!208276 () Unit!8285)

(assert (=> d!43295 (= lt!208285 lt!208276)))

(assert (=> d!43295 (= lt!208276 (lemmaIsPrefixRefl!0 (_2!6107 lt!207302)))))

(declare-fun lt!208279 () Unit!8285)

(declare-fun lt!208278 () Unit!8285)

(assert (=> d!43295 (= lt!208279 lt!208278)))

(assert (=> d!43295 (isPrefixOf!0 lt!208273 lt!208273)))

(assert (=> d!43295 (= lt!208278 (lemmaIsPrefixRefl!0 lt!208273))))

(declare-fun lt!208274 () Unit!8285)

(declare-fun lt!208267 () Unit!8285)

(assert (=> d!43295 (= lt!208274 lt!208267)))

(assert (=> d!43295 (isPrefixOf!0 (_2!6107 lt!206919) (_2!6107 lt!206919))))

(assert (=> d!43295 (= lt!208267 (lemmaIsPrefixRefl!0 (_2!6107 lt!206919)))))

(assert (=> d!43295 (= lt!208273 (BitStream!4815 (buf!3158 (_2!6107 lt!207302)) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))))))

(assert (=> d!43295 (isPrefixOf!0 (_2!6107 lt!206919) (_2!6107 lt!207302))))

(assert (=> d!43295 (= (reader!0 (_2!6107 lt!206919) (_2!6107 lt!207302)) lt!208277)))

(declare-fun b!134313 () Bool)

(declare-fun res!111607 () Bool)

(assert (=> b!134313 (=> (not res!111607) (not e!89092))))

(assert (=> b!134313 (= res!111607 (isPrefixOf!0 (_2!6106 lt!208277) (_2!6107 lt!207302)))))

(declare-fun b!134314 () Bool)

(declare-fun res!111609 () Bool)

(assert (=> b!134314 (=> (not res!111609) (not e!89092))))

(assert (=> b!134314 (= res!111609 (isPrefixOf!0 (_1!6106 lt!208277) (_2!6107 lt!206919)))))

(declare-fun b!134315 () Bool)

(declare-fun lt!208280 () (_ BitVec 64))

(declare-fun lt!208282 () (_ BitVec 64))

(assert (=> b!134315 (= e!89092 (= (_1!6106 lt!208277) (withMovedBitIndex!0 (_2!6106 lt!208277) (bvsub lt!208282 lt!208280))))))

(assert (=> b!134315 (or (= (bvand lt!208282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208280 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!208282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!208282 lt!208280) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!134315 (= lt!208280 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!207302))) (currentByte!5949 (_2!6107 lt!207302)) (currentBit!5944 (_2!6107 lt!207302))))))

(assert (=> b!134315 (= lt!208282 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))))))

(declare-fun b!134316 () Bool)

(declare-fun lt!208284 () Unit!8285)

(assert (=> b!134316 (= e!89093 lt!208284)))

(declare-fun lt!208270 () (_ BitVec 64))

(assert (=> b!134316 (= lt!208270 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!208283 () (_ BitVec 64))

(assert (=> b!134316 (= lt!208283 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))))))

(assert (=> b!134316 (= lt!208284 (arrayBitRangesEqSymmetric!0 (buf!3158 (_2!6107 lt!206919)) (buf!3158 (_2!6107 lt!207302)) lt!208270 lt!208283))))

(assert (=> b!134316 (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!207302)) (buf!3158 (_2!6107 lt!206919)) lt!208270 lt!208283)))

(assert (= (and d!43295 c!7671) b!134316))

(assert (= (and d!43295 (not c!7671)) b!134312))

(assert (= (and d!43295 res!111608) b!134314))

(assert (= (and b!134314 res!111609) b!134313))

(assert (= (and b!134313 res!111607) b!134315))

(assert (=> b!134316 m!202913))

(declare-fun m!204295 () Bool)

(assert (=> b!134316 m!204295))

(declare-fun m!204297 () Bool)

(assert (=> b!134316 m!204297))

(declare-fun m!204299 () Bool)

(assert (=> d!43295 m!204299))

(declare-fun m!204301 () Bool)

(assert (=> d!43295 m!204301))

(assert (=> d!43295 m!203197))

(declare-fun m!204303 () Bool)

(assert (=> d!43295 m!204303))

(declare-fun m!204305 () Bool)

(assert (=> d!43295 m!204305))

(declare-fun m!204307 () Bool)

(assert (=> d!43295 m!204307))

(declare-fun m!204309 () Bool)

(assert (=> d!43295 m!204309))

(declare-fun m!204311 () Bool)

(assert (=> d!43295 m!204311))

(assert (=> d!43295 m!203099))

(assert (=> d!43295 m!203101))

(declare-fun m!204313 () Bool)

(assert (=> d!43295 m!204313))

(declare-fun m!204315 () Bool)

(assert (=> b!134313 m!204315))

(declare-fun m!204317 () Bool)

(assert (=> b!134315 m!204317))

(assert (=> b!134315 m!203191))

(assert (=> b!134315 m!202913))

(declare-fun m!204319 () Bool)

(assert (=> b!134314 m!204319))

(assert (=> b!133864 d!43295))

(assert (=> d!42896 d!42914))

(declare-fun d!43297 () Bool)

(assert (=> d!43297 (isPrefixOf!0 thiss!1634 (_2!6107 lt!206912))))

(assert (=> d!43297 true))

(declare-fun _$15!210 () Unit!8285)

(assert (=> d!43297 (= (choose!30 thiss!1634 (_2!6107 lt!206919) (_2!6107 lt!206912)) _$15!210)))

(declare-fun bs!10549 () Bool)

(assert (= bs!10549 d!43297))

(assert (=> bs!10549 m!202897))

(assert (=> d!42896 d!43297))

(assert (=> d!42896 d!42940))

(declare-fun d!43299 () Bool)

(declare-fun res!111610 () Bool)

(declare-fun e!89094 () Bool)

(assert (=> d!43299 (=> (not res!111610) (not e!89094))))

(assert (=> d!43299 (= res!111610 (= (size!2775 (buf!3158 (_2!6106 lt!207173))) (size!2775 (buf!3158 (_2!6107 lt!206912)))))))

(assert (=> d!43299 (= (isPrefixOf!0 (_2!6106 lt!207173) (_2!6107 lt!206912)) e!89094)))

(declare-fun b!134317 () Bool)

(declare-fun res!111612 () Bool)

(assert (=> b!134317 (=> (not res!111612) (not e!89094))))

(assert (=> b!134317 (= res!111612 (bvsle (bitIndex!0 (size!2775 (buf!3158 (_2!6106 lt!207173))) (currentByte!5949 (_2!6106 lt!207173)) (currentBit!5944 (_2!6106 lt!207173))) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206912))) (currentByte!5949 (_2!6107 lt!206912)) (currentBit!5944 (_2!6107 lt!206912)))))))

(declare-fun b!134318 () Bool)

(declare-fun e!89095 () Bool)

(assert (=> b!134318 (= e!89094 e!89095)))

(declare-fun res!111611 () Bool)

(assert (=> b!134318 (=> res!111611 e!89095)))

(assert (=> b!134318 (= res!111611 (= (size!2775 (buf!3158 (_2!6106 lt!207173))) #b00000000000000000000000000000000))))

(declare-fun b!134319 () Bool)

(assert (=> b!134319 (= e!89095 (arrayBitRangesEq!0 (buf!3158 (_2!6106 lt!207173)) (buf!3158 (_2!6107 lt!206912)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_2!6106 lt!207173))) (currentByte!5949 (_2!6106 lt!207173)) (currentBit!5944 (_2!6106 lt!207173)))))))

(assert (= (and d!43299 res!111610) b!134317))

(assert (= (and b!134317 res!111612) b!134318))

(assert (= (and b!134318 (not res!111611)) b!134319))

(assert (=> b!134317 m!204281))

(assert (=> b!134317 m!202919))

(assert (=> b!134319 m!204281))

(assert (=> b!134319 m!204281))

(declare-fun m!204321 () Bool)

(assert (=> b!134319 m!204321))

(assert (=> b!133802 d!43299))

(declare-fun d!43301 () Bool)

(assert (=> d!43301 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!43301 true))

(declare-fun _$7!55 () Unit!8285)

(assert (=> d!43301 (= (choose!57 thiss!1634 (_2!6107 lt!206919) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!55)))

(declare-fun bs!10550 () Bool)

(assert (= bs!10550 d!43301))

(declare-fun m!204323 () Bool)

(assert (=> bs!10550 m!204323))

(assert (=> d!42861 d!43301))

(assert (=> b!133896 d!42857))

(declare-fun d!43303 () Bool)

(assert (=> d!43303 (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206919)) (buf!3158 thiss!1634) lt!207394 lt!207407)))

(declare-fun lt!208288 () Unit!8285)

(declare-fun choose!8 (array!6131 array!6131 (_ BitVec 64) (_ BitVec 64)) Unit!8285)

(assert (=> d!43303 (= lt!208288 (choose!8 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!206919)) lt!207394 lt!207407))))

(assert (=> d!43303 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207394) (bvsle lt!207394 lt!207407))))

(assert (=> d!43303 (= (arrayBitRangesEqSymmetric!0 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!206919)) lt!207394 lt!207407) lt!208288)))

(declare-fun bs!10551 () Bool)

(assert (= bs!10551 d!43303))

(assert (=> bs!10551 m!203295))

(declare-fun m!204325 () Bool)

(assert (=> bs!10551 m!204325))

(assert (=> b!133896 d!43303))

(declare-fun b!134320 () Bool)

(declare-fun e!89099 () Bool)

(declare-fun e!89097 () Bool)

(assert (=> b!134320 (= e!89099 e!89097)))

(declare-fun lt!208291 () tuple4!116)

(declare-fun res!111613 () Bool)

(declare-fun lt!208290 () (_ BitVec 32))

(assert (=> b!134320 (= res!111613 (byteRangesEq!0 (select (arr!3425 (buf!3158 (_2!6107 lt!206919))) (_3!315 lt!208291)) (select (arr!3425 (buf!3158 thiss!1634)) (_3!315 lt!208291)) lt!208290 #b00000000000000000000000000001000))))

(assert (=> b!134320 (=> (not res!111613) (not e!89097))))

(declare-fun e!89098 () Bool)

(declare-fun b!134321 () Bool)

(assert (=> b!134321 (= e!89098 (arrayRangesEq!178 (buf!3158 (_2!6107 lt!206919)) (buf!3158 thiss!1634) (_1!6117 lt!208291) (_2!6117 lt!208291)))))

(declare-fun b!134322 () Bool)

(declare-fun e!89101 () Bool)

(assert (=> b!134322 (= e!89101 e!89099)))

(declare-fun c!7672 () Bool)

(assert (=> b!134322 (= c!7672 (= (_3!315 lt!208291) (_4!58 lt!208291)))))

(declare-fun bm!1755 () Bool)

(declare-fun lt!208289 () (_ BitVec 32))

(declare-fun call!1758 () Bool)

(assert (=> bm!1755 (= call!1758 (byteRangesEq!0 (ite c!7672 (select (arr!3425 (buf!3158 (_2!6107 lt!206919))) (_3!315 lt!208291)) (select (arr!3425 (buf!3158 (_2!6107 lt!206919))) (_4!58 lt!208291))) (ite c!7672 (select (arr!3425 (buf!3158 thiss!1634)) (_3!315 lt!208291)) (select (arr!3425 (buf!3158 thiss!1634)) (_4!58 lt!208291))) (ite c!7672 lt!208290 #b00000000000000000000000000000000) lt!208289))))

(declare-fun b!134323 () Bool)

(declare-fun e!89100 () Bool)

(assert (=> b!134323 (= e!89100 e!89101)))

(declare-fun res!111614 () Bool)

(assert (=> b!134323 (=> (not res!111614) (not e!89101))))

(assert (=> b!134323 (= res!111614 e!89098)))

(declare-fun res!111615 () Bool)

(assert (=> b!134323 (=> res!111615 e!89098)))

(assert (=> b!134323 (= res!111615 (bvsge (_1!6117 lt!208291) (_2!6117 lt!208291)))))

(assert (=> b!134323 (= lt!208289 ((_ extract 31 0) (bvsrem lt!207407 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134323 (= lt!208290 ((_ extract 31 0) (bvsrem lt!207394 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134323 (= lt!208291 (arrayBitIndices!0 lt!207394 lt!207407))))

(declare-fun b!134324 () Bool)

(assert (=> b!134324 (= e!89099 call!1758)))

(declare-fun b!134325 () Bool)

(declare-fun res!111617 () Bool)

(assert (=> b!134325 (= res!111617 (= lt!208289 #b00000000000000000000000000000000))))

(declare-fun e!89096 () Bool)

(assert (=> b!134325 (=> res!111617 e!89096)))

(assert (=> b!134325 (= e!89097 e!89096)))

(declare-fun b!134326 () Bool)

(assert (=> b!134326 (= e!89096 call!1758)))

(declare-fun d!43305 () Bool)

(declare-fun res!111616 () Bool)

(assert (=> d!43305 (=> res!111616 e!89100)))

(assert (=> d!43305 (= res!111616 (bvsge lt!207394 lt!207407))))

(assert (=> d!43305 (= (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206919)) (buf!3158 thiss!1634) lt!207394 lt!207407) e!89100)))

(assert (= (and d!43305 (not res!111616)) b!134323))

(assert (= (and b!134323 (not res!111615)) b!134321))

(assert (= (and b!134323 res!111614) b!134322))

(assert (= (and b!134322 c!7672) b!134324))

(assert (= (and b!134322 (not c!7672)) b!134320))

(assert (= (and b!134320 res!111613) b!134325))

(assert (= (and b!134325 (not res!111617)) b!134326))

(assert (= (or b!134324 b!134326) bm!1755))

(declare-fun m!204327 () Bool)

(assert (=> b!134320 m!204327))

(declare-fun m!204329 () Bool)

(assert (=> b!134320 m!204329))

(assert (=> b!134320 m!204327))

(assert (=> b!134320 m!204329))

(declare-fun m!204331 () Bool)

(assert (=> b!134320 m!204331))

(declare-fun m!204333 () Bool)

(assert (=> b!134321 m!204333))

(declare-fun m!204335 () Bool)

(assert (=> bm!1755 m!204335))

(assert (=> bm!1755 m!204329))

(declare-fun m!204337 () Bool)

(assert (=> bm!1755 m!204337))

(assert (=> bm!1755 m!204327))

(declare-fun m!204339 () Bool)

(assert (=> bm!1755 m!204339))

(declare-fun m!204341 () Bool)

(assert (=> b!134323 m!204341))

(assert (=> b!133896 d!43305))

(declare-fun d!43307 () Bool)

(declare-fun res!111618 () Bool)

(declare-fun e!89102 () Bool)

(assert (=> d!43307 (=> (not res!111618) (not e!89102))))

(assert (=> d!43307 (= res!111618 (= (size!2775 (buf!3158 (_1!6106 lt!207356))) (size!2775 (buf!3158 thiss!1634))))))

(assert (=> d!43307 (= (isPrefixOf!0 (_1!6106 lt!207356) thiss!1634) e!89102)))

(declare-fun b!134327 () Bool)

(declare-fun res!111620 () Bool)

(assert (=> b!134327 (=> (not res!111620) (not e!89102))))

(assert (=> b!134327 (= res!111620 (bvsle (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!207356))) (currentByte!5949 (_1!6106 lt!207356)) (currentBit!5944 (_1!6106 lt!207356))) (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))))))

(declare-fun b!134328 () Bool)

(declare-fun e!89103 () Bool)

(assert (=> b!134328 (= e!89102 e!89103)))

(declare-fun res!111619 () Bool)

(assert (=> b!134328 (=> res!111619 e!89103)))

(assert (=> b!134328 (= res!111619 (= (size!2775 (buf!3158 (_1!6106 lt!207356))) #b00000000000000000000000000000000))))

(declare-fun b!134329 () Bool)

(assert (=> b!134329 (= e!89103 (arrayBitRangesEq!0 (buf!3158 (_1!6106 lt!207356)) (buf!3158 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!207356))) (currentByte!5949 (_1!6106 lt!207356)) (currentBit!5944 (_1!6106 lt!207356)))))))

(assert (= (and d!43307 res!111618) b!134327))

(assert (= (and b!134327 res!111620) b!134328))

(assert (= (and b!134328 (not res!111619)) b!134329))

(assert (=> b!134327 m!204261))

(assert (=> b!134327 m!202915))

(assert (=> b!134329 m!204261))

(assert (=> b!134329 m!204261))

(declare-fun m!204343 () Bool)

(assert (=> b!134329 m!204343))

(assert (=> b!133881 d!43307))

(declare-fun d!43309 () Bool)

(assert (=> d!43309 (= (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206912))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206912)))) (bvsub (bvmul ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206912))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206912))))))))

(assert (=> d!42845 d!43309))

(declare-fun d!43311 () Bool)

(assert (=> d!43311 (= (invariant!0 (currentBit!5944 (_2!6107 lt!206912)) (currentByte!5949 (_2!6107 lt!206912)) (size!2775 (buf!3158 (_2!6107 lt!206912)))) (and (bvsge (currentBit!5944 (_2!6107 lt!206912)) #b00000000000000000000000000000000) (bvslt (currentBit!5944 (_2!6107 lt!206912)) #b00000000000000000000000000001000) (bvsge (currentByte!5949 (_2!6107 lt!206912)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5949 (_2!6107 lt!206912)) (size!2775 (buf!3158 (_2!6107 lt!206912)))) (and (= (currentBit!5944 (_2!6107 lt!206912)) #b00000000000000000000000000000000) (= (currentByte!5949 (_2!6107 lt!206912)) (size!2775 (buf!3158 (_2!6107 lt!206912))))))))))

(assert (=> d!42845 d!43311))

(assert (=> b!133883 d!42857))

(declare-fun d!43313 () Bool)

(assert (=> d!43313 (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206912)) (buf!3158 thiss!1634) lt!207349 lt!207362)))

(declare-fun lt!208292 () Unit!8285)

(assert (=> d!43313 (= lt!208292 (choose!8 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!206912)) lt!207349 lt!207362))))

(assert (=> d!43313 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207349) (bvsle lt!207349 lt!207362))))

(assert (=> d!43313 (= (arrayBitRangesEqSymmetric!0 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!206912)) lt!207349 lt!207362) lt!208292)))

(declare-fun bs!10552 () Bool)

(assert (= bs!10552 d!43313))

(assert (=> bs!10552 m!203241))

(declare-fun m!204345 () Bool)

(assert (=> bs!10552 m!204345))

(assert (=> b!133883 d!43313))

(declare-fun b!134330 () Bool)

(declare-fun e!89107 () Bool)

(declare-fun e!89105 () Bool)

(assert (=> b!134330 (= e!89107 e!89105)))

(declare-fun lt!208294 () (_ BitVec 32))

(declare-fun res!111621 () Bool)

(declare-fun lt!208295 () tuple4!116)

(assert (=> b!134330 (= res!111621 (byteRangesEq!0 (select (arr!3425 (buf!3158 (_2!6107 lt!206912))) (_3!315 lt!208295)) (select (arr!3425 (buf!3158 thiss!1634)) (_3!315 lt!208295)) lt!208294 #b00000000000000000000000000001000))))

(assert (=> b!134330 (=> (not res!111621) (not e!89105))))

(declare-fun e!89106 () Bool)

(declare-fun b!134331 () Bool)

(assert (=> b!134331 (= e!89106 (arrayRangesEq!178 (buf!3158 (_2!6107 lt!206912)) (buf!3158 thiss!1634) (_1!6117 lt!208295) (_2!6117 lt!208295)))))

(declare-fun b!134332 () Bool)

(declare-fun e!89109 () Bool)

(assert (=> b!134332 (= e!89109 e!89107)))

(declare-fun c!7673 () Bool)

(assert (=> b!134332 (= c!7673 (= (_3!315 lt!208295) (_4!58 lt!208295)))))

(declare-fun bm!1756 () Bool)

(declare-fun call!1759 () Bool)

(declare-fun lt!208293 () (_ BitVec 32))

(assert (=> bm!1756 (= call!1759 (byteRangesEq!0 (ite c!7673 (select (arr!3425 (buf!3158 (_2!6107 lt!206912))) (_3!315 lt!208295)) (select (arr!3425 (buf!3158 (_2!6107 lt!206912))) (_4!58 lt!208295))) (ite c!7673 (select (arr!3425 (buf!3158 thiss!1634)) (_3!315 lt!208295)) (select (arr!3425 (buf!3158 thiss!1634)) (_4!58 lt!208295))) (ite c!7673 lt!208294 #b00000000000000000000000000000000) lt!208293))))

(declare-fun b!134333 () Bool)

(declare-fun e!89108 () Bool)

(assert (=> b!134333 (= e!89108 e!89109)))

(declare-fun res!111622 () Bool)

(assert (=> b!134333 (=> (not res!111622) (not e!89109))))

(assert (=> b!134333 (= res!111622 e!89106)))

(declare-fun res!111623 () Bool)

(assert (=> b!134333 (=> res!111623 e!89106)))

(assert (=> b!134333 (= res!111623 (bvsge (_1!6117 lt!208295) (_2!6117 lt!208295)))))

(assert (=> b!134333 (= lt!208293 ((_ extract 31 0) (bvsrem lt!207362 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134333 (= lt!208294 ((_ extract 31 0) (bvsrem lt!207349 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134333 (= lt!208295 (arrayBitIndices!0 lt!207349 lt!207362))))

(declare-fun b!134334 () Bool)

(assert (=> b!134334 (= e!89107 call!1759)))

(declare-fun b!134335 () Bool)

(declare-fun res!111625 () Bool)

(assert (=> b!134335 (= res!111625 (= lt!208293 #b00000000000000000000000000000000))))

(declare-fun e!89104 () Bool)

(assert (=> b!134335 (=> res!111625 e!89104)))

(assert (=> b!134335 (= e!89105 e!89104)))

(declare-fun b!134336 () Bool)

(assert (=> b!134336 (= e!89104 call!1759)))

(declare-fun d!43315 () Bool)

(declare-fun res!111624 () Bool)

(assert (=> d!43315 (=> res!111624 e!89108)))

(assert (=> d!43315 (= res!111624 (bvsge lt!207349 lt!207362))))

(assert (=> d!43315 (= (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206912)) (buf!3158 thiss!1634) lt!207349 lt!207362) e!89108)))

(assert (= (and d!43315 (not res!111624)) b!134333))

(assert (= (and b!134333 (not res!111623)) b!134331))

(assert (= (and b!134333 res!111622) b!134332))

(assert (= (and b!134332 c!7673) b!134334))

(assert (= (and b!134332 (not c!7673)) b!134330))

(assert (= (and b!134330 res!111621) b!134335))

(assert (= (and b!134335 (not res!111625)) b!134336))

(assert (= (or b!134334 b!134336) bm!1756))

(declare-fun m!204347 () Bool)

(assert (=> b!134330 m!204347))

(declare-fun m!204349 () Bool)

(assert (=> b!134330 m!204349))

(assert (=> b!134330 m!204347))

(assert (=> b!134330 m!204349))

(declare-fun m!204351 () Bool)

(assert (=> b!134330 m!204351))

(declare-fun m!204353 () Bool)

(assert (=> b!134331 m!204353))

(declare-fun m!204355 () Bool)

(assert (=> bm!1756 m!204355))

(assert (=> bm!1756 m!204349))

(declare-fun m!204357 () Bool)

(assert (=> bm!1756 m!204357))

(assert (=> bm!1756 m!204347))

(declare-fun m!204359 () Bool)

(assert (=> bm!1756 m!204359))

(declare-fun m!204361 () Bool)

(assert (=> b!134333 m!204361))

(assert (=> b!133883 d!43315))

(declare-fun d!43317 () Bool)

(declare-fun e!89112 () Bool)

(assert (=> d!43317 e!89112))

(declare-fun res!111628 () Bool)

(assert (=> d!43317 (=> (not res!111628) (not e!89112))))

(declare-fun moveByteIndexPrecond!0 (BitStream!4814 (_ BitVec 32)) Bool)

(assert (=> d!43317 (= res!111628 (moveByteIndexPrecond!0 (_1!6106 lt!206911) #b00000000000000000000000000000001))))

(declare-fun Unit!8366 () Unit!8285)

(assert (=> d!43317 (= (moveByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001) (tuple2!11593 Unit!8366 (BitStream!4815 (buf!3158 (_1!6106 lt!206911)) (bvadd (currentByte!5949 (_1!6106 lt!206911)) #b00000000000000000000000000000001) (currentBit!5944 (_1!6106 lt!206911)))))))

(declare-fun b!134339 () Bool)

(assert (=> b!134339 (= e!89112 (and (or (not (= (bvand (currentByte!5949 (_1!6106 lt!206911)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!5949 (_1!6106 lt!206911)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!5949 (_1!6106 lt!206911)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!5949 (_1!6106 lt!206911)) #b00000000000000000000000000000001) (bvadd (currentByte!5949 (_1!6106 lt!206911)) #b00000000000000000000000000000001))))))

(assert (= (and d!43317 res!111628) b!134339))

(declare-fun m!204363 () Bool)

(assert (=> d!43317 m!204363))

(assert (=> d!42904 d!43317))

(declare-fun d!43319 () Bool)

(assert (=> d!43319 (isPrefixOf!0 lt!207169 (_2!6107 lt!206912))))

(declare-fun lt!208296 () Unit!8285)

(assert (=> d!43319 (= lt!208296 (choose!30 lt!207169 (_2!6107 lt!206912) (_2!6107 lt!206912)))))

(assert (=> d!43319 (isPrefixOf!0 lt!207169 (_2!6107 lt!206912))))

(assert (=> d!43319 (= (lemmaIsPrefixTransitive!0 lt!207169 (_2!6107 lt!206912) (_2!6107 lt!206912)) lt!208296)))

(declare-fun bs!10553 () Bool)

(assert (= bs!10553 d!43319))

(assert (=> bs!10553 m!203093))

(declare-fun m!204365 () Bool)

(assert (=> bs!10553 m!204365))

(assert (=> bs!10553 m!203093))

(assert (=> d!42835 d!43319))

(assert (=> d!42835 d!43237))

(declare-fun d!43321 () Bool)

(assert (=> d!43321 (isPrefixOf!0 lt!207169 (_2!6107 lt!206912))))

(declare-fun lt!208297 () Unit!8285)

(assert (=> d!43321 (= lt!208297 (choose!30 lt!207169 (_2!6107 lt!206919) (_2!6107 lt!206912)))))

(assert (=> d!43321 (isPrefixOf!0 lt!207169 (_2!6107 lt!206919))))

(assert (=> d!43321 (= (lemmaIsPrefixTransitive!0 lt!207169 (_2!6107 lt!206919) (_2!6107 lt!206912)) lt!208297)))

(declare-fun bs!10554 () Bool)

(assert (= bs!10554 d!43321))

(assert (=> bs!10554 m!203093))

(declare-fun m!204367 () Bool)

(assert (=> bs!10554 m!204367))

(declare-fun m!204369 () Bool)

(assert (=> bs!10554 m!204369))

(assert (=> d!42835 d!43321))

(assert (=> d!42835 d!43249))

(assert (=> d!42835 d!42825))

(assert (=> d!42835 d!43275))

(declare-fun d!43323 () Bool)

(declare-fun res!111629 () Bool)

(declare-fun e!89113 () Bool)

(assert (=> d!43323 (=> (not res!111629) (not e!89113))))

(assert (=> d!43323 (= res!111629 (= (size!2775 (buf!3158 lt!207169)) (size!2775 (buf!3158 (_2!6107 lt!206912)))))))

(assert (=> d!43323 (= (isPrefixOf!0 lt!207169 (_2!6107 lt!206912)) e!89113)))

(declare-fun b!134340 () Bool)

(declare-fun res!111631 () Bool)

(assert (=> b!134340 (=> (not res!111631) (not e!89113))))

(assert (=> b!134340 (= res!111631 (bvsle (bitIndex!0 (size!2775 (buf!3158 lt!207169)) (currentByte!5949 lt!207169) (currentBit!5944 lt!207169)) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206912))) (currentByte!5949 (_2!6107 lt!206912)) (currentBit!5944 (_2!6107 lt!206912)))))))

(declare-fun b!134341 () Bool)

(declare-fun e!89114 () Bool)

(assert (=> b!134341 (= e!89113 e!89114)))

(declare-fun res!111630 () Bool)

(assert (=> b!134341 (=> res!111630 e!89114)))

(assert (=> b!134341 (= res!111630 (= (size!2775 (buf!3158 lt!207169)) #b00000000000000000000000000000000))))

(declare-fun b!134342 () Bool)

(assert (=> b!134342 (= e!89114 (arrayBitRangesEq!0 (buf!3158 lt!207169) (buf!3158 (_2!6107 lt!206912)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 lt!207169)) (currentByte!5949 lt!207169) (currentBit!5944 lt!207169))))))

(assert (= (and d!43323 res!111629) b!134340))

(assert (= (and b!134340 res!111631) b!134341))

(assert (= (and b!134341 (not res!111630)) b!134342))

(declare-fun m!204371 () Bool)

(assert (=> b!134340 m!204371))

(assert (=> b!134340 m!202919))

(assert (=> b!134342 m!204371))

(assert (=> b!134342 m!204371))

(declare-fun m!204373 () Bool)

(assert (=> b!134342 m!204373))

(assert (=> d!42835 d!43323))

(declare-fun d!43325 () Bool)

(assert (=> d!43325 (isPrefixOf!0 lt!207169 lt!207169)))

(declare-fun lt!208298 () Unit!8285)

(assert (=> d!43325 (= lt!208298 (choose!11 lt!207169))))

(assert (=> d!43325 (= (lemmaIsPrefixRefl!0 lt!207169) lt!208298)))

(declare-fun bs!10555 () Bool)

(assert (= bs!10555 d!43325))

(assert (=> bs!10555 m!203085))

(declare-fun m!204375 () Bool)

(assert (=> bs!10555 m!204375))

(assert (=> d!42835 d!43325))

(declare-fun d!43327 () Bool)

(declare-fun res!111632 () Bool)

(declare-fun e!89115 () Bool)

(assert (=> d!43327 (=> (not res!111632) (not e!89115))))

(assert (=> d!43327 (= res!111632 (= (size!2775 (buf!3158 (_1!6106 lt!207173))) (size!2775 (buf!3158 (_2!6106 lt!207173)))))))

(assert (=> d!43327 (= (isPrefixOf!0 (_1!6106 lt!207173) (_2!6106 lt!207173)) e!89115)))

(declare-fun b!134343 () Bool)

(declare-fun res!111634 () Bool)

(assert (=> b!134343 (=> (not res!111634) (not e!89115))))

(assert (=> b!134343 (= res!111634 (bvsle (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!207173))) (currentByte!5949 (_1!6106 lt!207173)) (currentBit!5944 (_1!6106 lt!207173))) (bitIndex!0 (size!2775 (buf!3158 (_2!6106 lt!207173))) (currentByte!5949 (_2!6106 lt!207173)) (currentBit!5944 (_2!6106 lt!207173)))))))

(declare-fun b!134344 () Bool)

(declare-fun e!89116 () Bool)

(assert (=> b!134344 (= e!89115 e!89116)))

(declare-fun res!111633 () Bool)

(assert (=> b!134344 (=> res!111633 e!89116)))

(assert (=> b!134344 (= res!111633 (= (size!2775 (buf!3158 (_1!6106 lt!207173))) #b00000000000000000000000000000000))))

(declare-fun b!134345 () Bool)

(assert (=> b!134345 (= e!89116 (arrayBitRangesEq!0 (buf!3158 (_1!6106 lt!207173)) (buf!3158 (_2!6106 lt!207173)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!207173))) (currentByte!5949 (_1!6106 lt!207173)) (currentBit!5944 (_1!6106 lt!207173)))))))

(assert (= (and d!43327 res!111632) b!134343))

(assert (= (and b!134343 res!111634) b!134344))

(assert (= (and b!134344 (not res!111633)) b!134345))

(declare-fun m!204377 () Bool)

(assert (=> b!134343 m!204377))

(assert (=> b!134343 m!204281))

(assert (=> b!134345 m!204377))

(assert (=> b!134345 m!204377))

(declare-fun m!204379 () Bool)

(assert (=> b!134345 m!204379))

(assert (=> d!42835 d!43327))

(declare-fun d!43329 () Bool)

(declare-fun res!111635 () Bool)

(declare-fun e!89117 () Bool)

(assert (=> d!43329 (=> (not res!111635) (not e!89117))))

(assert (=> d!43329 (= res!111635 (= (size!2775 (buf!3158 lt!207169)) (size!2775 (buf!3158 lt!207169))))))

(assert (=> d!43329 (= (isPrefixOf!0 lt!207169 lt!207169) e!89117)))

(declare-fun b!134346 () Bool)

(declare-fun res!111637 () Bool)

(assert (=> b!134346 (=> (not res!111637) (not e!89117))))

(assert (=> b!134346 (= res!111637 (bvsle (bitIndex!0 (size!2775 (buf!3158 lt!207169)) (currentByte!5949 lt!207169) (currentBit!5944 lt!207169)) (bitIndex!0 (size!2775 (buf!3158 lt!207169)) (currentByte!5949 lt!207169) (currentBit!5944 lt!207169))))))

(declare-fun b!134347 () Bool)

(declare-fun e!89118 () Bool)

(assert (=> b!134347 (= e!89117 e!89118)))

(declare-fun res!111636 () Bool)

(assert (=> b!134347 (=> res!111636 e!89118)))

(assert (=> b!134347 (= res!111636 (= (size!2775 (buf!3158 lt!207169)) #b00000000000000000000000000000000))))

(declare-fun b!134348 () Bool)

(assert (=> b!134348 (= e!89118 (arrayBitRangesEq!0 (buf!3158 lt!207169) (buf!3158 lt!207169) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 lt!207169)) (currentByte!5949 lt!207169) (currentBit!5944 lt!207169))))))

(assert (= (and d!43329 res!111635) b!134346))

(assert (= (and b!134346 res!111637) b!134347))

(assert (= (and b!134347 (not res!111636)) b!134348))

(assert (=> b!134346 m!204371))

(assert (=> b!134346 m!204371))

(assert (=> b!134348 m!204371))

(assert (=> b!134348 m!204371))

(declare-fun m!204381 () Bool)

(assert (=> b!134348 m!204381))

(assert (=> d!42835 d!43329))

(assert (=> d!42835 d!43267))

(declare-fun d!43331 () Bool)

(assert (=> d!43331 (= (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!206931)))) ((_ sign_extend 32) (currentByte!5949 (_1!6105 lt!206931))) ((_ sign_extend 32) (currentBit!5944 (_1!6105 lt!206931)))) (bvsub (bvmul ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!206931)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 (_1!6105 lt!206931))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 (_1!6105 lt!206931))))))))

(assert (=> d!42859 d!43331))

(declare-fun d!43333 () Bool)

(assert (=> d!43333 (= (invariant!0 (currentBit!5944 (_1!6105 lt!206931)) (currentByte!5949 (_1!6105 lt!206931)) (size!2775 (buf!3158 (_1!6105 lt!206931)))) (and (bvsge (currentBit!5944 (_1!6105 lt!206931)) #b00000000000000000000000000000000) (bvslt (currentBit!5944 (_1!6105 lt!206931)) #b00000000000000000000000000001000) (bvsge (currentByte!5949 (_1!6105 lt!206931)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5949 (_1!6105 lt!206931)) (size!2775 (buf!3158 (_1!6105 lt!206931)))) (and (= (currentBit!5944 (_1!6105 lt!206931)) #b00000000000000000000000000000000) (= (currentByte!5949 (_1!6105 lt!206931)) (size!2775 (buf!3158 (_1!6105 lt!206931))))))))))

(assert (=> d!42859 d!43333))

(declare-fun d!43335 () Bool)

(declare-fun res!111638 () Bool)

(declare-fun e!89119 () Bool)

(assert (=> d!43335 (=> res!111638 e!89119)))

(assert (=> d!43335 (= res!111638 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!43335 (= (arrayRangesEq!178 (_2!6104 lt!206914) (_2!6104 lt!206918) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!89119)))

(declare-fun b!134349 () Bool)

(declare-fun e!89120 () Bool)

(assert (=> b!134349 (= e!89119 e!89120)))

(declare-fun res!111639 () Bool)

(assert (=> b!134349 (=> (not res!111639) (not e!89120))))

(assert (=> b!134349 (= res!111639 (= (select (arr!3425 (_2!6104 lt!206914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3425 (_2!6104 lt!206918)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!134350 () Bool)

(assert (=> b!134350 (= e!89120 (arrayRangesEq!178 (_2!6104 lt!206914) (_2!6104 lt!206918) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43335 (not res!111638)) b!134349))

(assert (= (and b!134349 res!111639) b!134350))

(declare-fun m!204383 () Bool)

(assert (=> b!134349 m!204383))

(declare-fun m!204385 () Bool)

(assert (=> b!134349 m!204385))

(declare-fun m!204387 () Bool)

(assert (=> b!134350 m!204387))

(assert (=> b!133866 d!43335))

(declare-fun d!43337 () Bool)

(declare-fun e!89121 () Bool)

(assert (=> d!43337 e!89121))

(declare-fun res!111640 () Bool)

(assert (=> d!43337 (=> (not res!111640) (not e!89121))))

(declare-fun lt!208299 () (_ BitVec 64))

(declare-fun lt!208300 () (_ BitVec 64))

(declare-fun lt!208303 () (_ BitVec 64))

(assert (=> d!43337 (= res!111640 (= lt!208300 (bvsub lt!208299 lt!208303)))))

(assert (=> d!43337 (or (= (bvand lt!208299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!208299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!208299 lt!208303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43337 (= lt!208303 (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!207340)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!207340))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!207340)))))))

(declare-fun lt!208302 () (_ BitVec 64))

(declare-fun lt!208301 () (_ BitVec 64))

(assert (=> d!43337 (= lt!208299 (bvmul lt!208302 lt!208301))))

(assert (=> d!43337 (or (= lt!208302 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!208301 (bvsdiv (bvmul lt!208302 lt!208301) lt!208302)))))

(assert (=> d!43337 (= lt!208301 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43337 (= lt!208302 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!207340)))))))

(assert (=> d!43337 (= lt!208300 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!207340))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!207340)))))))

(assert (=> d!43337 (invariant!0 (currentBit!5944 (_2!6107 lt!207340)) (currentByte!5949 (_2!6107 lt!207340)) (size!2775 (buf!3158 (_2!6107 lt!207340))))))

(assert (=> d!43337 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!207340))) (currentByte!5949 (_2!6107 lt!207340)) (currentBit!5944 (_2!6107 lt!207340))) lt!208300)))

(declare-fun b!134351 () Bool)

(declare-fun res!111641 () Bool)

(assert (=> b!134351 (=> (not res!111641) (not e!89121))))

(assert (=> b!134351 (= res!111641 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!208300))))

(declare-fun b!134352 () Bool)

(declare-fun lt!208304 () (_ BitVec 64))

(assert (=> b!134352 (= e!89121 (bvsle lt!208300 (bvmul lt!208304 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134352 (or (= lt!208304 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!208304 #b0000000000000000000000000000000000000000000000000000000000001000) lt!208304)))))

(assert (=> b!134352 (= lt!208304 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!207340)))))))

(assert (= (and d!43337 res!111640) b!134351))

(assert (= (and b!134351 res!111641) b!134352))

(declare-fun m!204389 () Bool)

(assert (=> d!43337 m!204389))

(declare-fun m!204391 () Bool)

(assert (=> d!43337 m!204391))

(assert (=> b!133873 d!43337))

(assert (=> b!133873 d!42857))

(declare-fun d!43339 () Bool)

(assert (=> d!43339 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) (bvsub (bvsub to!404 from!447) lt!207242)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!207242)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10556 () Bool)

(assert (= bs!10556 d!43339))

(assert (=> bs!10556 m!203135))

(assert (=> b!133829 d!43339))

(declare-fun b!134353 () Bool)

(declare-fun e!89124 () tuple3!510)

(declare-fun lt!208310 () Unit!8285)

(declare-fun lt!208316 () tuple3!510)

(assert (=> b!134353 (= e!89124 (tuple3!511 lt!208310 (_2!6110 lt!208316) (_3!312 lt!208316)))))

(declare-fun lt!208306 () tuple2!11596)

(assert (=> b!134353 (= lt!208306 (readByte!0 (_1!6106 lt!206921)))))

(declare-fun lt!208320 () array!6131)

(assert (=> b!134353 (= lt!208320 (array!6132 (store (arr!3425 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6111 lt!208306)) (size!2775 arr!237)))))

(declare-fun lt!208323 () (_ BitVec 64))

(assert (=> b!134353 (= lt!208323 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!208324 () (_ BitVec 32))

(assert (=> b!134353 (= lt!208324 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!208339 () Unit!8285)

(assert (=> b!134353 (= lt!208339 (validateOffsetBytesFromBitIndexLemma!0 (_1!6106 lt!206921) (_2!6111 lt!208306) lt!208323 lt!208324))))

(assert (=> b!134353 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6111 lt!208306)))) ((_ sign_extend 32) (currentByte!5949 (_2!6111 lt!208306))) ((_ sign_extend 32) (currentBit!5944 (_2!6111 lt!208306))) (bvsub lt!208324 ((_ extract 31 0) (bvsdiv (bvadd lt!208323 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!208336 () Unit!8285)

(assert (=> b!134353 (= lt!208336 lt!208339)))

(assert (=> b!134353 (= lt!208316 (readByteArrayLoop!0 (_2!6111 lt!208306) lt!208320 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1760 () (_ BitVec 64))

(assert (=> b!134353 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6111 lt!208306))) (currentByte!5949 (_2!6111 lt!208306)) (currentBit!5944 (_2!6111 lt!208306))) (bvadd call!1760 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!208330 () Unit!8285)

(declare-fun Unit!8367 () Unit!8285)

(assert (=> b!134353 (= lt!208330 Unit!8367)))

(assert (=> b!134353 (= (bvadd (bitIndex!0 (size!2775 (buf!3158 (_2!6111 lt!208306))) (currentByte!5949 (_2!6111 lt!208306)) (currentBit!5944 (_2!6111 lt!208306))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2775 (buf!3158 (_2!6110 lt!208316))) (currentByte!5949 (_2!6110 lt!208316)) (currentBit!5944 (_2!6110 lt!208316))))))

(declare-fun lt!208318 () Unit!8285)

(declare-fun Unit!8368 () Unit!8285)

(assert (=> b!134353 (= lt!208318 Unit!8368)))

(assert (=> b!134353 (= (bvadd call!1760 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2775 (buf!3158 (_2!6110 lt!208316))) (currentByte!5949 (_2!6110 lt!208316)) (currentBit!5944 (_2!6110 lt!208316))))))

(declare-fun lt!208309 () Unit!8285)

(declare-fun Unit!8369 () Unit!8285)

(assert (=> b!134353 (= lt!208309 Unit!8369)))

(assert (=> b!134353 (and (= (buf!3158 (_1!6106 lt!206921)) (buf!3158 (_2!6110 lt!208316))) (= (size!2775 arr!237) (size!2775 (_3!312 lt!208316))))))

(declare-fun lt!208314 () Unit!8285)

(declare-fun Unit!8370 () Unit!8285)

(assert (=> b!134353 (= lt!208314 Unit!8370)))

(declare-fun lt!208322 () Unit!8285)

(assert (=> b!134353 (= lt!208322 (arrayUpdatedAtPrefixLemma!4 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6111 lt!208306)))))

(declare-fun call!1761 () Bool)

(assert (=> b!134353 call!1761))

(declare-fun lt!208325 () Unit!8285)

(assert (=> b!134353 (= lt!208325 lt!208322)))

(declare-fun lt!208340 () (_ BitVec 32))

(assert (=> b!134353 (= lt!208340 #b00000000000000000000000000000000)))

(declare-fun lt!208329 () Unit!8285)

(assert (=> b!134353 (= lt!208329 (arrayRangesEqTransitive!4 arr!237 lt!208320 (_3!312 lt!208316) lt!208340 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!134353 (arrayRangesEq!178 arr!237 (_3!312 lt!208316) lt!208340 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!208328 () Unit!8285)

(assert (=> b!134353 (= lt!208328 lt!208329)))

(declare-fun call!1762 () Bool)

(assert (=> b!134353 call!1762))

(declare-fun lt!208337 () Unit!8285)

(declare-fun Unit!8371 () Unit!8285)

(assert (=> b!134353 (= lt!208337 Unit!8371)))

(declare-fun lt!208305 () Unit!8285)

(assert (=> b!134353 (= lt!208305 (arrayRangesEqImpliesEq!4 lt!208320 (_3!312 lt!208316) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!134353 (= (select (store (arr!3425 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6111 lt!208306)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3425 (_3!312 lt!208316)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!208319 () Unit!8285)

(assert (=> b!134353 (= lt!208319 lt!208305)))

(declare-fun lt!208335 () Bool)

(assert (=> b!134353 (= lt!208335 (= (select (arr!3425 (_3!312 lt!208316)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6111 lt!208306)))))

(declare-fun Unit!8372 () Unit!8285)

(assert (=> b!134353 (= lt!208310 Unit!8372)))

(assert (=> b!134353 lt!208335))

(declare-fun e!89123 () Bool)

(declare-fun b!134354 () Bool)

(declare-fun lt!208315 () tuple3!510)

(assert (=> b!134354 (= e!89123 (arrayRangesEq!178 arr!237 (_3!312 lt!208315) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!134355 () Bool)

(declare-fun e!89122 () Bool)

(assert (=> b!134355 (= e!89122 (= (select (arr!3425 (_3!312 lt!208315)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6105 (readBytePure!0 (_1!6106 lt!206921)))))))

(assert (=> b!134355 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2775 (_3!312 lt!208315))))))

(declare-fun c!7674 () Bool)

(declare-fun bm!1757 () Bool)

(assert (=> bm!1757 (= call!1761 (arrayRangesEq!178 arr!237 (ite c!7674 (array!6132 (store (arr!3425 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6111 lt!208306)) (size!2775 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!7674 (bvadd #b00000000000000000000000000000001 from!447) (size!2775 arr!237))))))

(declare-fun b!134356 () Bool)

(declare-fun res!111642 () Bool)

(assert (=> b!134356 (=> (not res!111642) (not e!89123))))

(assert (=> b!134356 (= res!111642 (and (= (buf!3158 (_1!6106 lt!206921)) (buf!3158 (_2!6110 lt!208315))) (= (size!2775 arr!237) (size!2775 (_3!312 lt!208315)))))))

(declare-fun bm!1758 () Bool)

(assert (=> bm!1758 (= call!1760 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!206921))) (currentByte!5949 (_1!6106 lt!206921)) (currentBit!5944 (_1!6106 lt!206921))))))

(declare-fun d!43341 () Bool)

(assert (=> d!43341 e!89122))

(declare-fun res!111644 () Bool)

(assert (=> d!43341 (=> res!111644 e!89122)))

(assert (=> d!43341 (= res!111644 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208308 () Bool)

(assert (=> d!43341 (= lt!208308 e!89123)))

(declare-fun res!111643 () Bool)

(assert (=> d!43341 (=> (not res!111643) (not e!89123))))

(declare-fun lt!208334 () (_ BitVec 64))

(declare-fun lt!208331 () (_ BitVec 64))

(assert (=> d!43341 (= res!111643 (= (bvadd lt!208334 lt!208331) (bitIndex!0 (size!2775 (buf!3158 (_2!6110 lt!208315))) (currentByte!5949 (_2!6110 lt!208315)) (currentBit!5944 (_2!6110 lt!208315)))))))

(assert (=> d!43341 (or (not (= (bvand lt!208334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208331 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!208334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!208334 lt!208331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!208326 () (_ BitVec 64))

(assert (=> d!43341 (= lt!208331 (bvmul lt!208326 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43341 (or (= lt!208326 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!208326 #b0000000000000000000000000000000000000000000000000000000000001000) lt!208326)))))

(assert (=> d!43341 (= lt!208326 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!43341 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!43341 (= lt!208334 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!206921))) (currentByte!5949 (_1!6106 lt!206921)) (currentBit!5944 (_1!6106 lt!206921))))))

(assert (=> d!43341 (= lt!208315 e!89124)))

(assert (=> d!43341 (= c!7674 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43341 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2775 arr!237)))))

(assert (=> d!43341 (= (readByteArrayLoop!0 (_1!6106 lt!206921) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!208315)))

(declare-fun lt!208333 () Unit!8285)

(declare-fun b!134357 () Bool)

(assert (=> b!134357 (= e!89124 (tuple3!511 lt!208333 (_1!6106 lt!206921) arr!237))))

(assert (=> b!134357 (= call!1760 call!1760)))

(declare-fun lt!208321 () Unit!8285)

(declare-fun Unit!8373 () Unit!8285)

(assert (=> b!134357 (= lt!208321 Unit!8373)))

(declare-fun lt!208338 () Unit!8285)

(assert (=> b!134357 (= lt!208338 (arrayRangesEqReflexiveLemma!4 arr!237))))

(assert (=> b!134357 call!1761))

(declare-fun lt!208317 () Unit!8285)

(assert (=> b!134357 (= lt!208317 lt!208338)))

(declare-fun lt!208332 () array!6131)

(assert (=> b!134357 (= lt!208332 arr!237)))

(declare-fun lt!208313 () array!6131)

(assert (=> b!134357 (= lt!208313 arr!237)))

(declare-fun lt!208311 () (_ BitVec 32))

(assert (=> b!134357 (= lt!208311 #b00000000000000000000000000000000)))

(declare-fun lt!208312 () (_ BitVec 32))

(assert (=> b!134357 (= lt!208312 (size!2775 arr!237))))

(declare-fun lt!208307 () (_ BitVec 32))

(assert (=> b!134357 (= lt!208307 #b00000000000000000000000000000000)))

(declare-fun lt!208327 () (_ BitVec 32))

(assert (=> b!134357 (= lt!208327 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!134357 (= lt!208333 (arrayRangesEqSlicedLemma!4 lt!208332 lt!208313 lt!208311 lt!208312 lt!208307 lt!208327))))

(assert (=> b!134357 call!1762))

(declare-fun bm!1759 () Bool)

(assert (=> bm!1759 (= call!1762 (arrayRangesEq!178 (ite c!7674 arr!237 lt!208332) (ite c!7674 (_3!312 lt!208316) lt!208313) (ite c!7674 #b00000000000000000000000000000000 lt!208307) (ite c!7674 (bvadd #b00000000000000000000000000000001 from!447) lt!208327)))))

(assert (= (and d!43341 c!7674) b!134353))

(assert (= (and d!43341 (not c!7674)) b!134357))

(assert (= (or b!134353 b!134357) bm!1757))

(assert (= (or b!134353 b!134357) bm!1759))

(assert (= (or b!134353 b!134357) bm!1758))

(assert (= (and d!43341 res!111643) b!134356))

(assert (= (and b!134356 res!111642) b!134354))

(assert (= (and d!43341 (not res!111644)) b!134355))

(declare-fun m!204393 () Bool)

(assert (=> bm!1757 m!204393))

(declare-fun m!204395 () Bool)

(assert (=> bm!1757 m!204395))

(assert (=> b!134357 m!204081))

(declare-fun m!204397 () Bool)

(assert (=> b!134357 m!204397))

(declare-fun m!204399 () Bool)

(assert (=> d!43341 m!204399))

(declare-fun m!204401 () Bool)

(assert (=> d!43341 m!204401))

(assert (=> bm!1758 m!204401))

(declare-fun m!204403 () Bool)

(assert (=> bm!1759 m!204403))

(declare-fun m!204405 () Bool)

(assert (=> b!134353 m!204405))

(declare-fun m!204407 () Bool)

(assert (=> b!134353 m!204407))

(declare-fun m!204409 () Bool)

(assert (=> b!134353 m!204409))

(declare-fun m!204411 () Bool)

(assert (=> b!134353 m!204411))

(declare-fun m!204413 () Bool)

(assert (=> b!134353 m!204413))

(declare-fun m!204415 () Bool)

(assert (=> b!134353 m!204415))

(declare-fun m!204417 () Bool)

(assert (=> b!134353 m!204417))

(declare-fun m!204419 () Bool)

(assert (=> b!134353 m!204419))

(declare-fun m!204421 () Bool)

(assert (=> b!134353 m!204421))

(declare-fun m!204423 () Bool)

(assert (=> b!134353 m!204423))

(assert (=> b!134353 m!204393))

(declare-fun m!204425 () Bool)

(assert (=> b!134353 m!204425))

(declare-fun m!204427 () Bool)

(assert (=> b!134353 m!204427))

(declare-fun m!204429 () Bool)

(assert (=> b!134354 m!204429))

(declare-fun m!204431 () Bool)

(assert (=> b!134355 m!204431))

(declare-fun m!204433 () Bool)

(assert (=> b!134355 m!204433))

(assert (=> d!42829 d!43341))

(declare-fun d!43343 () Bool)

(declare-fun lt!208341 () tuple2!11596)

(assert (=> d!43343 (= lt!208341 (readByte!0 (_1!6106 lt!207341)))))

(assert (=> d!43343 (= (readBytePure!0 (_1!6106 lt!207341)) (tuple2!11589 (_2!6111 lt!208341) (_1!6111 lt!208341)))))

(declare-fun bs!10557 () Bool)

(assert (= bs!10557 d!43343))

(declare-fun m!204435 () Bool)

(assert (=> bs!10557 m!204435))

(assert (=> b!133875 d!43343))

(declare-fun b!134358 () Bool)

(declare-fun e!89126 () Unit!8285)

(declare-fun Unit!8374 () Unit!8285)

(assert (=> b!134358 (= e!89126 Unit!8374)))

(declare-fun d!43345 () Bool)

(declare-fun e!89125 () Bool)

(assert (=> d!43345 e!89125))

(declare-fun res!111646 () Bool)

(assert (=> d!43345 (=> (not res!111646) (not e!89125))))

(declare-fun lt!208353 () tuple2!11590)

(assert (=> d!43345 (= res!111646 (isPrefixOf!0 (_1!6106 lt!208353) (_2!6106 lt!208353)))))

(declare-fun lt!208349 () BitStream!4814)

(assert (=> d!43345 (= lt!208353 (tuple2!11591 lt!208349 (_2!6107 lt!207340)))))

(declare-fun lt!208357 () Unit!8285)

(declare-fun lt!208351 () Unit!8285)

(assert (=> d!43345 (= lt!208357 lt!208351)))

(assert (=> d!43345 (isPrefixOf!0 lt!208349 (_2!6107 lt!207340))))

(assert (=> d!43345 (= lt!208351 (lemmaIsPrefixTransitive!0 lt!208349 (_2!6107 lt!207340) (_2!6107 lt!207340)))))

(declare-fun lt!208342 () Unit!8285)

(declare-fun lt!208345 () Unit!8285)

(assert (=> d!43345 (= lt!208342 lt!208345)))

(assert (=> d!43345 (isPrefixOf!0 lt!208349 (_2!6107 lt!207340))))

(assert (=> d!43345 (= lt!208345 (lemmaIsPrefixTransitive!0 lt!208349 thiss!1634 (_2!6107 lt!207340)))))

(declare-fun lt!208348 () Unit!8285)

(assert (=> d!43345 (= lt!208348 e!89126)))

(declare-fun c!7675 () Bool)

(assert (=> d!43345 (= c!7675 (not (= (size!2775 (buf!3158 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!208347 () Unit!8285)

(declare-fun lt!208344 () Unit!8285)

(assert (=> d!43345 (= lt!208347 lt!208344)))

(assert (=> d!43345 (isPrefixOf!0 (_2!6107 lt!207340) (_2!6107 lt!207340))))

(assert (=> d!43345 (= lt!208344 (lemmaIsPrefixRefl!0 (_2!6107 lt!207340)))))

(declare-fun lt!208361 () Unit!8285)

(declare-fun lt!208352 () Unit!8285)

(assert (=> d!43345 (= lt!208361 lt!208352)))

(assert (=> d!43345 (= lt!208352 (lemmaIsPrefixRefl!0 (_2!6107 lt!207340)))))

(declare-fun lt!208355 () Unit!8285)

(declare-fun lt!208354 () Unit!8285)

(assert (=> d!43345 (= lt!208355 lt!208354)))

(assert (=> d!43345 (isPrefixOf!0 lt!208349 lt!208349)))

(assert (=> d!43345 (= lt!208354 (lemmaIsPrefixRefl!0 lt!208349))))

(declare-fun lt!208350 () Unit!8285)

(declare-fun lt!208343 () Unit!8285)

(assert (=> d!43345 (= lt!208350 lt!208343)))

(assert (=> d!43345 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!43345 (= lt!208343 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!43345 (= lt!208349 (BitStream!4815 (buf!3158 (_2!6107 lt!207340)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))

(assert (=> d!43345 (isPrefixOf!0 thiss!1634 (_2!6107 lt!207340))))

(assert (=> d!43345 (= (reader!0 thiss!1634 (_2!6107 lt!207340)) lt!208353)))

(declare-fun b!134359 () Bool)

(declare-fun res!111645 () Bool)

(assert (=> b!134359 (=> (not res!111645) (not e!89125))))

(assert (=> b!134359 (= res!111645 (isPrefixOf!0 (_2!6106 lt!208353) (_2!6107 lt!207340)))))

(declare-fun b!134360 () Bool)

(declare-fun res!111647 () Bool)

(assert (=> b!134360 (=> (not res!111647) (not e!89125))))

(assert (=> b!134360 (= res!111647 (isPrefixOf!0 (_1!6106 lt!208353) thiss!1634))))

(declare-fun lt!208356 () (_ BitVec 64))

(declare-fun b!134361 () Bool)

(declare-fun lt!208358 () (_ BitVec 64))

(assert (=> b!134361 (= e!89125 (= (_1!6106 lt!208353) (withMovedBitIndex!0 (_2!6106 lt!208353) (bvsub lt!208358 lt!208356))))))

(assert (=> b!134361 (or (= (bvand lt!208358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208356 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!208358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!208358 lt!208356) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!134361 (= lt!208356 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!207340))) (currentByte!5949 (_2!6107 lt!207340)) (currentBit!5944 (_2!6107 lt!207340))))))

(assert (=> b!134361 (= lt!208358 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))

(declare-fun b!134362 () Bool)

(declare-fun lt!208360 () Unit!8285)

(assert (=> b!134362 (= e!89126 lt!208360)))

(declare-fun lt!208346 () (_ BitVec 64))

(assert (=> b!134362 (= lt!208346 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!208359 () (_ BitVec 64))

(assert (=> b!134362 (= lt!208359 (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)))))

(assert (=> b!134362 (= lt!208360 (arrayBitRangesEqSymmetric!0 (buf!3158 thiss!1634) (buf!3158 (_2!6107 lt!207340)) lt!208346 lt!208359))))

(assert (=> b!134362 (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!207340)) (buf!3158 thiss!1634) lt!208346 lt!208359)))

(assert (= (and d!43345 c!7675) b!134362))

(assert (= (and d!43345 (not c!7675)) b!134358))

(assert (= (and d!43345 res!111646) b!134360))

(assert (= (and b!134360 res!111647) b!134359))

(assert (= (and b!134359 res!111645) b!134361))

(assert (=> b!134362 m!202915))

(declare-fun m!204437 () Bool)

(assert (=> b!134362 m!204437))

(declare-fun m!204439 () Bool)

(assert (=> b!134362 m!204439))

(declare-fun m!204441 () Bool)

(assert (=> d!43345 m!204441))

(declare-fun m!204443 () Bool)

(assert (=> d!43345 m!204443))

(assert (=> d!43345 m!203231))

(declare-fun m!204445 () Bool)

(assert (=> d!43345 m!204445))

(declare-fun m!204447 () Bool)

(assert (=> d!43345 m!204447))

(declare-fun m!204449 () Bool)

(assert (=> d!43345 m!204449))

(declare-fun m!204451 () Bool)

(assert (=> d!43345 m!204451))

(declare-fun m!204453 () Bool)

(assert (=> d!43345 m!204453))

(assert (=> d!43345 m!203253))

(assert (=> d!43345 m!203255))

(declare-fun m!204455 () Bool)

(assert (=> d!43345 m!204455))

(declare-fun m!204457 () Bool)

(assert (=> b!134359 m!204457))

(declare-fun m!204459 () Bool)

(assert (=> b!134361 m!204459))

(assert (=> b!134361 m!203229))

(assert (=> b!134361 m!202915))

(declare-fun m!204461 () Bool)

(assert (=> b!134360 m!204461))

(assert (=> b!133875 d!43345))

(declare-fun d!43347 () Bool)

(declare-fun lt!208367 () (_ BitVec 8))

(declare-fun lt!208362 () (_ BitVec 8))

(assert (=> d!43347 (= lt!208367 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3425 (buf!3158 lt!206913)) (currentByte!5949 lt!206913))) ((_ sign_extend 24) lt!208362))))))

(assert (=> d!43347 (= lt!208362 ((_ extract 7 0) (currentBit!5944 lt!206913)))))

(declare-fun e!89127 () Bool)

(assert (=> d!43347 e!89127))

(declare-fun res!111649 () Bool)

(assert (=> d!43347 (=> (not res!111649) (not e!89127))))

(assert (=> d!43347 (= res!111649 (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 lt!206913))) ((_ sign_extend 32) (currentByte!5949 lt!206913)) ((_ sign_extend 32) (currentBit!5944 lt!206913)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8375 () Unit!8285)

(declare-fun Unit!8376 () Unit!8285)

(assert (=> d!43347 (= (readByte!0 lt!206913) (tuple2!11597 (_2!6116 (ite (bvsgt ((_ sign_extend 24) lt!208362) #b00000000000000000000000000000000) (tuple2!11603 Unit!8375 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!208367) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3425 (buf!3158 lt!206913)) (bvadd (currentByte!5949 lt!206913) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!208362)))))))) (tuple2!11603 Unit!8376 lt!208367))) (BitStream!4815 (buf!3158 lt!206913) (bvadd (currentByte!5949 lt!206913) #b00000000000000000000000000000001) (currentBit!5944 lt!206913))))))

(declare-fun b!134363 () Bool)

(declare-fun e!89128 () Bool)

(assert (=> b!134363 (= e!89127 e!89128)))

(declare-fun res!111648 () Bool)

(assert (=> b!134363 (=> (not res!111648) (not e!89128))))

(declare-fun lt!208366 () tuple2!11596)

(assert (=> b!134363 (= res!111648 (= (buf!3158 (_2!6111 lt!208366)) (buf!3158 lt!206913)))))

(declare-fun lt!208364 () (_ BitVec 8))

(declare-fun lt!208368 () (_ BitVec 8))

(declare-fun Unit!8377 () Unit!8285)

(declare-fun Unit!8378 () Unit!8285)

(assert (=> b!134363 (= lt!208366 (tuple2!11597 (_2!6116 (ite (bvsgt ((_ sign_extend 24) lt!208364) #b00000000000000000000000000000000) (tuple2!11603 Unit!8377 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!208368) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3425 (buf!3158 lt!206913)) (bvadd (currentByte!5949 lt!206913) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!208364)))))))) (tuple2!11603 Unit!8378 lt!208368))) (BitStream!4815 (buf!3158 lt!206913) (bvadd (currentByte!5949 lt!206913) #b00000000000000000000000000000001) (currentBit!5944 lt!206913))))))

(assert (=> b!134363 (= lt!208368 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3425 (buf!3158 lt!206913)) (currentByte!5949 lt!206913))) ((_ sign_extend 24) lt!208364))))))

(assert (=> b!134363 (= lt!208364 ((_ extract 7 0) (currentBit!5944 lt!206913)))))

(declare-fun b!134364 () Bool)

(declare-fun lt!208365 () (_ BitVec 64))

(declare-fun lt!208363 () (_ BitVec 64))

(assert (=> b!134364 (= e!89128 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6111 lt!208366))) (currentByte!5949 (_2!6111 lt!208366)) (currentBit!5944 (_2!6111 lt!208366))) (bvadd lt!208365 lt!208363)))))

(assert (=> b!134364 (or (not (= (bvand lt!208365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208363 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!208365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!208365 lt!208363) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!134364 (= lt!208363 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!134364 (= lt!208365 (bitIndex!0 (size!2775 (buf!3158 lt!206913)) (currentByte!5949 lt!206913) (currentBit!5944 lt!206913)))))

(assert (= (and d!43347 res!111649) b!134363))

(assert (= (and b!134363 res!111648) b!134364))

(declare-fun m!204463 () Bool)

(assert (=> d!43347 m!204463))

(declare-fun m!204465 () Bool)

(assert (=> d!43347 m!204465))

(declare-fun m!204467 () Bool)

(assert (=> d!43347 m!204467))

(assert (=> b!134363 m!204467))

(assert (=> b!134363 m!204463))

(declare-fun m!204469 () Bool)

(assert (=> b!134364 m!204469))

(declare-fun m!204471 () Bool)

(assert (=> b!134364 m!204471))

(assert (=> d!42902 d!43347))

(declare-fun d!43349 () Bool)

(assert (=> d!43349 (= (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 thiss!1634))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2775 (buf!3158 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 thiss!1634)))))))

(assert (=> d!42857 d!43349))

(assert (=> d!42857 d!42944))

(declare-fun b!134374 () Bool)

(declare-fun res!111656 () Bool)

(declare-fun e!89136 () Bool)

(assert (=> b!134374 (=> (not res!111656) (not e!89136))))

(declare-fun _$37!20 () tuple2!11592)

(assert (=> b!134374 (= res!111656 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6107 _$37!20))) (currentByte!5949 (_2!6107 _$37!20)) (currentBit!5944 (_2!6107 _$37!20))) (bvadd (bitIndex!0 (size!2775 (buf!3158 thiss!1634)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!134375 () Bool)

(declare-fun res!111657 () Bool)

(assert (=> b!134375 (=> (not res!111657) (not e!89136))))

(assert (=> b!134375 (= res!111657 (isPrefixOf!0 thiss!1634 (_2!6107 _$37!20)))))

(declare-fun d!43351 () Bool)

(assert (=> d!43351 e!89136))

(declare-fun res!111658 () Bool)

(assert (=> d!43351 (=> (not res!111658) (not e!89136))))

(assert (=> d!43351 (= res!111658 (= (size!2775 (buf!3158 thiss!1634)) (size!2775 (buf!3158 (_2!6107 _$37!20)))))))

(declare-fun e!89135 () Bool)

(assert (=> d!43351 (and (inv!12 (_2!6107 _$37!20)) e!89135)))

(assert (=> d!43351 (= (choose!6 thiss!1634 (select (arr!3425 arr!237) from!447)) _$37!20)))

(declare-fun b!134373 () Bool)

(assert (=> b!134373 (= e!89135 (array_inv!2564 (buf!3158 (_2!6107 _$37!20))))))

(declare-fun lt!208374 () tuple2!11588)

(declare-fun b!134376 () Bool)

(declare-fun lt!208373 () tuple2!11590)

(assert (=> b!134376 (= e!89136 (and (= (_2!6105 lt!208374) (select (arr!3425 arr!237) from!447)) (= (_1!6105 lt!208374) (_2!6106 lt!208373))))))

(assert (=> b!134376 (= lt!208374 (readBytePure!0 (_1!6106 lt!208373)))))

(assert (=> b!134376 (= lt!208373 (reader!0 thiss!1634 (_2!6107 _$37!20)))))

(assert (= d!43351 b!134373))

(assert (= (and d!43351 res!111658) b!134374))

(assert (= (and b!134374 res!111656) b!134375))

(assert (= (and b!134375 res!111657) b!134376))

(declare-fun m!204473 () Bool)

(assert (=> b!134374 m!204473))

(assert (=> b!134374 m!202915))

(declare-fun m!204475 () Bool)

(assert (=> b!134373 m!204475))

(declare-fun m!204477 () Bool)

(assert (=> d!43351 m!204477))

(declare-fun m!204479 () Bool)

(assert (=> b!134376 m!204479))

(declare-fun m!204481 () Bool)

(assert (=> b!134376 m!204481))

(declare-fun m!204483 () Bool)

(assert (=> b!134375 m!204483))

(assert (=> d!42912 d!43351))

(declare-fun d!43353 () Bool)

(assert (=> d!43353 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2775 (buf!3158 thiss!1634))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 thiss!1634))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!10558 () Bool)

(assert (= bs!10558 d!43353))

(assert (=> bs!10558 m!203031))

(assert (=> d!42912 d!43353))

(declare-fun d!43355 () Bool)

(assert (=> d!43355 (= (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919)))) (bvsub (bvmul ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))))))))

(assert (=> d!42908 d!43355))

(declare-fun d!43357 () Bool)

(assert (=> d!43357 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!207303) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206919)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919)))) lt!207303))))

(declare-fun bs!10559 () Bool)

(assert (= bs!10559 d!43357))

(assert (=> bs!10559 m!203135))

(assert (=> b!133863 d!43357))

(assert (=> b!133768 d!42855))

(assert (=> b!133768 d!42845))

(declare-fun d!43359 () Bool)

(declare-fun res!111659 () Bool)

(declare-fun e!89138 () Bool)

(assert (=> d!43359 (=> res!111659 e!89138)))

(assert (=> d!43359 (= res!111659 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!43359 (= (arrayRangesEq!178 arr!237 (_2!6104 lt!207300) #b00000000000000000000000000000000 to!404) e!89138)))

(declare-fun b!134377 () Bool)

(declare-fun e!89139 () Bool)

(assert (=> b!134377 (= e!89138 e!89139)))

(declare-fun res!111660 () Bool)

(assert (=> b!134377 (=> (not res!111660) (not e!89139))))

(assert (=> b!134377 (= res!111660 (= (select (arr!3425 arr!237) #b00000000000000000000000000000000) (select (arr!3425 (_2!6104 lt!207300)) #b00000000000000000000000000000000)))))

(declare-fun b!134378 () Bool)

(assert (=> b!134378 (= e!89139 (arrayRangesEq!178 arr!237 (_2!6104 lt!207300) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!43359 (not res!111659)) b!134377))

(assert (= (and b!134377 res!111660) b!134378))

(assert (=> b!134377 m!203111))

(declare-fun m!204485 () Bool)

(assert (=> b!134377 m!204485))

(declare-fun m!204487 () Bool)

(assert (=> b!134378 m!204487))

(assert (=> b!133861 d!43359))

(declare-fun b!134389 () Bool)

(declare-fun e!89151 () Bool)

(declare-fun e!89149 () Bool)

(assert (=> b!134389 (= e!89151 e!89149)))

(declare-fun res!111670 () Bool)

(assert (=> b!134389 (=> (not res!111670) (not e!89149))))

(declare-fun lt!208385 () tuple2!11590)

(declare-fun lt!208387 () tuple2!11586)

(assert (=> b!134389 (= res!111670 (and (= (size!2775 (_2!6104 lt!208387)) (size!2775 arr!237)) (= (_1!6104 lt!208387) (_2!6106 lt!208385))))))

(assert (=> b!134389 (= lt!208387 (readByteArrayLoopPure!0 (_1!6106 lt!208385) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208389 () Unit!8285)

(declare-fun lt!208386 () Unit!8285)

(assert (=> b!134389 (= lt!208389 lt!208386)))

(declare-fun _$39!24 () tuple2!11592)

(declare-fun lt!208388 () (_ BitVec 64))

(assert (=> b!134389 (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 _$39!24)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!208388)))

(assert (=> b!134389 (= lt!208386 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6107 lt!206919) (buf!3158 (_2!6107 _$39!24)) lt!208388))))

(assert (=> b!134389 (= lt!208388 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!134389 (= lt!208385 (reader!0 (_2!6107 lt!206919) (_2!6107 _$39!24)))))

(declare-fun b!134390 () Bool)

(declare-fun e!89148 () Bool)

(assert (=> b!134390 (= e!89148 (array_inv!2564 (buf!3158 (_2!6107 _$39!24))))))

(declare-fun b!134391 () Bool)

(declare-fun res!111671 () Bool)

(assert (=> b!134391 (=> (not res!111671) (not e!89151))))

(assert (=> b!134391 (= res!111671 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6107 _$39!24))) (currentByte!5949 (_2!6107 _$39!24)) (currentBit!5944 (_2!6107 _$39!24))) (bvadd (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun d!43361 () Bool)

(assert (=> d!43361 e!89151))

(declare-fun res!111672 () Bool)

(assert (=> d!43361 (=> (not res!111672) (not e!89151))))

(assert (=> d!43361 (= res!111672 (= (size!2775 (buf!3158 (_2!6107 lt!206919))) (size!2775 (buf!3158 (_2!6107 _$39!24)))))))

(assert (=> d!43361 (and (inv!12 (_2!6107 _$39!24)) e!89148)))

(assert (=> d!43361 (= (choose!64 (_2!6107 lt!206919) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!24)))

(declare-fun b!134392 () Bool)

(declare-fun res!111669 () Bool)

(assert (=> b!134392 (=> (not res!111669) (not e!89151))))

(assert (=> b!134392 (= res!111669 (isPrefixOf!0 (_2!6107 lt!206919) (_2!6107 _$39!24)))))

(declare-fun b!134393 () Bool)

(assert (=> b!134393 (= e!89149 (arrayRangesEq!178 arr!237 (_2!6104 lt!208387) #b00000000000000000000000000000000 to!404))))

(assert (= d!43361 b!134390))

(assert (= (and d!43361 res!111672) b!134391))

(assert (= (and b!134391 res!111671) b!134392))

(assert (= (and b!134392 res!111669) b!134389))

(assert (= (and b!134389 res!111670) b!134393))

(declare-fun m!204489 () Bool)

(assert (=> b!134390 m!204489))

(declare-fun m!204491 () Bool)

(assert (=> d!43361 m!204491))

(declare-fun m!204493 () Bool)

(assert (=> b!134392 m!204493))

(declare-fun m!204495 () Bool)

(assert (=> b!134393 m!204495))

(declare-fun m!204497 () Bool)

(assert (=> b!134389 m!204497))

(declare-fun m!204499 () Bool)

(assert (=> b!134389 m!204499))

(declare-fun m!204501 () Bool)

(assert (=> b!134389 m!204501))

(declare-fun m!204503 () Bool)

(assert (=> b!134389 m!204503))

(declare-fun m!204505 () Bool)

(assert (=> b!134391 m!204505))

(assert (=> b!134391 m!202913))

(assert (=> d!42864 d!43361))

(assert (=> d!42833 d!42831))

(declare-fun d!43363 () Bool)

(assert (=> d!43363 (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!206917)))

(assert (=> d!43363 true))

(declare-fun _$6!283 () Unit!8285)

(assert (=> d!43363 (= (choose!9 (_2!6107 lt!206919) (buf!3158 (_2!6107 lt!206912)) lt!206917 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))) _$6!283)))

(declare-fun bs!10560 () Bool)

(assert (= bs!10560 d!43363))

(assert (=> bs!10560 m!202847))

(assert (=> d!42833 d!43363))

(assert (=> d!42922 d!42906))

(declare-fun d!43365 () Bool)

(assert (=> d!43365 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 thiss!1634)) ((_ sign_extend 32) (currentBit!5944 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!43365 true))

(declare-fun _$5!40 () Unit!8285)

(assert (=> d!43365 (= (choose!26 thiss!1634 (buf!3158 (_2!6107 lt!206912)) (bvsub to!404 from!447) (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 thiss!1634) (currentBit!5944 thiss!1634))) _$5!40)))

(declare-fun bs!10561 () Bool)

(assert (= bs!10561 d!43365))

(assert (=> bs!10561 m!202881))

(assert (=> d!42922 d!43365))

(declare-fun d!43367 () Bool)

(declare-fun res!111673 () Bool)

(declare-fun e!89152 () Bool)

(assert (=> d!43367 (=> (not res!111673) (not e!89152))))

(assert (=> d!43367 (= res!111673 (= (size!2775 (buf!3158 (_1!6106 lt!207173))) (size!2775 (buf!3158 (_2!6107 lt!206919)))))))

(assert (=> d!43367 (= (isPrefixOf!0 (_1!6106 lt!207173) (_2!6107 lt!206919)) e!89152)))

(declare-fun b!134394 () Bool)

(declare-fun res!111675 () Bool)

(assert (=> b!134394 (=> (not res!111675) (not e!89152))))

(assert (=> b!134394 (= res!111675 (bvsle (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!207173))) (currentByte!5949 (_1!6106 lt!207173)) (currentBit!5944 (_1!6106 lt!207173))) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))))))

(declare-fun b!134395 () Bool)

(declare-fun e!89153 () Bool)

(assert (=> b!134395 (= e!89152 e!89153)))

(declare-fun res!111674 () Bool)

(assert (=> b!134395 (=> res!111674 e!89153)))

(assert (=> b!134395 (= res!111674 (= (size!2775 (buf!3158 (_1!6106 lt!207173))) #b00000000000000000000000000000000))))

(declare-fun b!134396 () Bool)

(assert (=> b!134396 (= e!89153 (arrayBitRangesEq!0 (buf!3158 (_1!6106 lt!207173)) (buf!3158 (_2!6107 lt!206919)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!207173))) (currentByte!5949 (_1!6106 lt!207173)) (currentBit!5944 (_1!6106 lt!207173)))))))

(assert (= (and d!43367 res!111673) b!134394))

(assert (= (and b!134394 res!111675) b!134395))

(assert (= (and b!134395 (not res!111674)) b!134396))

(assert (=> b!134394 m!204377))

(assert (=> b!134394 m!202913))

(assert (=> b!134396 m!204377))

(assert (=> b!134396 m!204377))

(declare-fun m!204507 () Bool)

(assert (=> b!134396 m!204507))

(assert (=> b!133803 d!43367))

(declare-fun d!43369 () Bool)

(declare-fun lt!208395 () (_ BitVec 8))

(declare-fun lt!208390 () (_ BitVec 8))

(assert (=> d!43369 (= lt!208395 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3425 (buf!3158 (_1!6106 lt!206911))) (currentByte!5949 (_1!6106 lt!206911)))) ((_ sign_extend 24) lt!208390))))))

(assert (=> d!43369 (= lt!208390 ((_ extract 7 0) (currentBit!5944 (_1!6106 lt!206911))))))

(declare-fun e!89154 () Bool)

(assert (=> d!43369 e!89154))

(declare-fun res!111677 () Bool)

(assert (=> d!43369 (=> (not res!111677) (not e!89154))))

(assert (=> d!43369 (= res!111677 (validate_offset_bits!1 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6106 lt!206911)))) ((_ sign_extend 32) (currentByte!5949 (_1!6106 lt!206911))) ((_ sign_extend 32) (currentBit!5944 (_1!6106 lt!206911))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8379 () Unit!8285)

(declare-fun Unit!8380 () Unit!8285)

(assert (=> d!43369 (= (readByte!0 (_1!6106 lt!206911)) (tuple2!11597 (_2!6116 (ite (bvsgt ((_ sign_extend 24) lt!208390) #b00000000000000000000000000000000) (tuple2!11603 Unit!8379 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!208395) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3425 (buf!3158 (_1!6106 lt!206911))) (bvadd (currentByte!5949 (_1!6106 lt!206911)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!208390)))))))) (tuple2!11603 Unit!8380 lt!208395))) (BitStream!4815 (buf!3158 (_1!6106 lt!206911)) (bvadd (currentByte!5949 (_1!6106 lt!206911)) #b00000000000000000000000000000001) (currentBit!5944 (_1!6106 lt!206911)))))))

(declare-fun b!134397 () Bool)

(declare-fun e!89155 () Bool)

(assert (=> b!134397 (= e!89154 e!89155)))

(declare-fun res!111676 () Bool)

(assert (=> b!134397 (=> (not res!111676) (not e!89155))))

(declare-fun lt!208394 () tuple2!11596)

(assert (=> b!134397 (= res!111676 (= (buf!3158 (_2!6111 lt!208394)) (buf!3158 (_1!6106 lt!206911))))))

(declare-fun lt!208392 () (_ BitVec 8))

(declare-fun lt!208396 () (_ BitVec 8))

(declare-fun Unit!8381 () Unit!8285)

(declare-fun Unit!8382 () Unit!8285)

(assert (=> b!134397 (= lt!208394 (tuple2!11597 (_2!6116 (ite (bvsgt ((_ sign_extend 24) lt!208392) #b00000000000000000000000000000000) (tuple2!11603 Unit!8381 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!208396) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3425 (buf!3158 (_1!6106 lt!206911))) (bvadd (currentByte!5949 (_1!6106 lt!206911)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!208392)))))))) (tuple2!11603 Unit!8382 lt!208396))) (BitStream!4815 (buf!3158 (_1!6106 lt!206911)) (bvadd (currentByte!5949 (_1!6106 lt!206911)) #b00000000000000000000000000000001) (currentBit!5944 (_1!6106 lt!206911)))))))

(assert (=> b!134397 (= lt!208396 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3425 (buf!3158 (_1!6106 lt!206911))) (currentByte!5949 (_1!6106 lt!206911)))) ((_ sign_extend 24) lt!208392))))))

(assert (=> b!134397 (= lt!208392 ((_ extract 7 0) (currentBit!5944 (_1!6106 lt!206911))))))

(declare-fun lt!208393 () (_ BitVec 64))

(declare-fun b!134398 () Bool)

(declare-fun lt!208391 () (_ BitVec 64))

(assert (=> b!134398 (= e!89155 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6111 lt!208394))) (currentByte!5949 (_2!6111 lt!208394)) (currentBit!5944 (_2!6111 lt!208394))) (bvadd lt!208393 lt!208391)))))

(assert (=> b!134398 (or (not (= (bvand lt!208393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208391 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!208393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!208393 lt!208391) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!134398 (= lt!208391 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!134398 (= lt!208393 (bitIndex!0 (size!2775 (buf!3158 (_1!6106 lt!206911))) (currentByte!5949 (_1!6106 lt!206911)) (currentBit!5944 (_1!6106 lt!206911))))))

(assert (= (and d!43369 res!111677) b!134397))

(assert (= (and b!134397 res!111676) b!134398))

(declare-fun m!204509 () Bool)

(assert (=> d!43369 m!204509))

(declare-fun m!204511 () Bool)

(assert (=> d!43369 m!204511))

(declare-fun m!204513 () Bool)

(assert (=> d!43369 m!204513))

(assert (=> b!134397 m!204513))

(assert (=> b!134397 m!204509))

(declare-fun m!204515 () Bool)

(assert (=> b!134398 m!204515))

(assert (=> b!134398 m!204087))

(assert (=> d!42930 d!43369))

(assert (=> d!42855 d!43281))

(declare-fun d!43371 () Bool)

(assert (=> d!43371 (= (invariant!0 (currentBit!5944 (_2!6107 lt!206919)) (currentByte!5949 (_2!6107 lt!206919)) (size!2775 (buf!3158 (_2!6107 lt!206919)))) (and (bvsge (currentBit!5944 (_2!6107 lt!206919)) #b00000000000000000000000000000000) (bvslt (currentBit!5944 (_2!6107 lt!206919)) #b00000000000000000000000000001000) (bvsge (currentByte!5949 (_2!6107 lt!206919)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5949 (_2!6107 lt!206919)) (size!2775 (buf!3158 (_2!6107 lt!206919)))) (and (= (currentBit!5944 (_2!6107 lt!206919)) #b00000000000000000000000000000000) (= (currentByte!5949 (_2!6107 lt!206919)) (size!2775 (buf!3158 (_2!6107 lt!206919))))))))))

(assert (=> d!42855 d!43371))

(declare-fun b!134399 () Bool)

(declare-fun e!89159 () Bool)

(declare-fun e!89157 () Bool)

(assert (=> b!134399 (= e!89159 e!89157)))

(declare-fun lt!208398 () (_ BitVec 32))

(declare-fun res!111678 () Bool)

(declare-fun lt!208399 () tuple4!116)

(assert (=> b!134399 (= res!111678 (byteRangesEq!0 (select (arr!3425 (buf!3158 (_2!6107 lt!206919))) (_3!315 lt!208399)) (select (arr!3425 (buf!3158 (_2!6107 lt!206912))) (_3!315 lt!208399)) lt!208398 #b00000000000000000000000000001000))))

(assert (=> b!134399 (=> (not res!111678) (not e!89157))))

(declare-fun b!134400 () Bool)

(declare-fun e!89158 () Bool)

(assert (=> b!134400 (= e!89158 (arrayRangesEq!178 (buf!3158 (_2!6107 lt!206919)) (buf!3158 (_2!6107 lt!206912)) (_1!6117 lt!208399) (_2!6117 lt!208399)))))

(declare-fun b!134401 () Bool)

(declare-fun e!89161 () Bool)

(assert (=> b!134401 (= e!89161 e!89159)))

(declare-fun c!7676 () Bool)

(assert (=> b!134401 (= c!7676 (= (_3!315 lt!208399) (_4!58 lt!208399)))))

(declare-fun bm!1760 () Bool)

(declare-fun call!1763 () Bool)

(declare-fun lt!208397 () (_ BitVec 32))

(assert (=> bm!1760 (= call!1763 (byteRangesEq!0 (ite c!7676 (select (arr!3425 (buf!3158 (_2!6107 lt!206919))) (_3!315 lt!208399)) (select (arr!3425 (buf!3158 (_2!6107 lt!206919))) (_4!58 lt!208399))) (ite c!7676 (select (arr!3425 (buf!3158 (_2!6107 lt!206912))) (_3!315 lt!208399)) (select (arr!3425 (buf!3158 (_2!6107 lt!206912))) (_4!58 lt!208399))) (ite c!7676 lt!208398 #b00000000000000000000000000000000) lt!208397))))

(declare-fun b!134402 () Bool)

(declare-fun e!89160 () Bool)

(assert (=> b!134402 (= e!89160 e!89161)))

(declare-fun res!111679 () Bool)

(assert (=> b!134402 (=> (not res!111679) (not e!89161))))

(assert (=> b!134402 (= res!111679 e!89158)))

(declare-fun res!111680 () Bool)

(assert (=> b!134402 (=> res!111680 e!89158)))

(assert (=> b!134402 (= res!111680 (bvsge (_1!6117 lt!208399) (_2!6117 lt!208399)))))

(assert (=> b!134402 (= lt!208397 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134402 (= lt!208398 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134402 (= lt!208399 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))))))

(declare-fun b!134403 () Bool)

(assert (=> b!134403 (= e!89159 call!1763)))

(declare-fun b!134404 () Bool)

(declare-fun res!111682 () Bool)

(assert (=> b!134404 (= res!111682 (= lt!208397 #b00000000000000000000000000000000))))

(declare-fun e!89156 () Bool)

(assert (=> b!134404 (=> res!111682 e!89156)))

(assert (=> b!134404 (= e!89157 e!89156)))

(declare-fun b!134405 () Bool)

(assert (=> b!134405 (= e!89156 call!1763)))

(declare-fun d!43373 () Bool)

(declare-fun res!111681 () Bool)

(assert (=> d!43373 (=> res!111681 e!89160)))

(assert (=> d!43373 (= res!111681 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))))))

(assert (=> d!43373 (= (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206919)) (buf!3158 (_2!6107 lt!206912)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))) e!89160)))

(assert (= (and d!43373 (not res!111681)) b!134402))

(assert (= (and b!134402 (not res!111680)) b!134400))

(assert (= (and b!134402 res!111679) b!134401))

(assert (= (and b!134401 c!7676) b!134403))

(assert (= (and b!134401 (not c!7676)) b!134399))

(assert (= (and b!134399 res!111678) b!134404))

(assert (= (and b!134404 (not res!111682)) b!134405))

(assert (= (or b!134403 b!134405) bm!1760))

(declare-fun m!204517 () Bool)

(assert (=> b!134399 m!204517))

(declare-fun m!204519 () Bool)

(assert (=> b!134399 m!204519))

(assert (=> b!134399 m!204517))

(assert (=> b!134399 m!204519))

(declare-fun m!204521 () Bool)

(assert (=> b!134399 m!204521))

(declare-fun m!204523 () Bool)

(assert (=> b!134400 m!204523))

(declare-fun m!204525 () Bool)

(assert (=> bm!1760 m!204525))

(assert (=> bm!1760 m!204519))

(declare-fun m!204527 () Bool)

(assert (=> bm!1760 m!204527))

(assert (=> bm!1760 m!204517))

(declare-fun m!204529 () Bool)

(assert (=> bm!1760 m!204529))

(assert (=> b!134402 m!202913))

(declare-fun m!204531 () Bool)

(assert (=> b!134402 m!204531))

(assert (=> b!133770 d!43373))

(assert (=> b!133770 d!42855))

(declare-fun d!43375 () Bool)

(declare-fun res!111683 () Bool)

(declare-fun e!89162 () Bool)

(assert (=> d!43375 (=> (not res!111683) (not e!89162))))

(assert (=> d!43375 (= res!111683 (= (size!2775 (buf!3158 (_2!6106 lt!207401))) (size!2775 (buf!3158 (_2!6107 lt!206919)))))))

(assert (=> d!43375 (= (isPrefixOf!0 (_2!6106 lt!207401) (_2!6107 lt!206919)) e!89162)))

(declare-fun b!134406 () Bool)

(declare-fun res!111685 () Bool)

(assert (=> b!134406 (=> (not res!111685) (not e!89162))))

(assert (=> b!134406 (= res!111685 (bvsle (bitIndex!0 (size!2775 (buf!3158 (_2!6106 lt!207401))) (currentByte!5949 (_2!6106 lt!207401)) (currentBit!5944 (_2!6106 lt!207401))) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206919))) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))))))

(declare-fun b!134407 () Bool)

(declare-fun e!89163 () Bool)

(assert (=> b!134407 (= e!89162 e!89163)))

(declare-fun res!111684 () Bool)

(assert (=> b!134407 (=> res!111684 e!89163)))

(assert (=> b!134407 (= res!111684 (= (size!2775 (buf!3158 (_2!6106 lt!207401))) #b00000000000000000000000000000000))))

(declare-fun b!134408 () Bool)

(assert (=> b!134408 (= e!89163 (arrayBitRangesEq!0 (buf!3158 (_2!6106 lt!207401)) (buf!3158 (_2!6107 lt!206919)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_2!6106 lt!207401))) (currentByte!5949 (_2!6106 lt!207401)) (currentBit!5944 (_2!6106 lt!207401)))))))

(assert (= (and d!43375 res!111683) b!134406))

(assert (= (and b!134406 res!111685) b!134407))

(assert (= (and b!134407 (not res!111684)) b!134408))

(assert (=> b!134406 m!204149))

(assert (=> b!134406 m!202913))

(assert (=> b!134408 m!204149))

(assert (=> b!134408 m!204149))

(declare-fun m!204533 () Bool)

(assert (=> b!134408 m!204533))

(assert (=> b!133893 d!43375))

(declare-fun b!134409 () Bool)

(declare-fun e!89166 () tuple3!510)

(declare-fun lt!208405 () Unit!8285)

(declare-fun lt!208411 () tuple3!510)

(assert (=> b!134409 (= e!89166 (tuple3!511 lt!208405 (_2!6110 lt!208411) (_3!312 lt!208411)))))

(declare-fun lt!208401 () tuple2!11596)

(assert (=> b!134409 (= lt!208401 (readByte!0 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001)))))

(declare-fun lt!208415 () array!6131)

(assert (=> b!134409 (= lt!208415 (array!6132 (store (arr!3425 lt!206927) (bvadd #b00000000000000000000000000000001 from!447) (_1!6111 lt!208401)) (size!2775 lt!206927)))))

(declare-fun lt!208418 () (_ BitVec 64))

(assert (=> b!134409 (= lt!208418 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!208419 () (_ BitVec 32))

(assert (=> b!134409 (= lt!208419 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!208434 () Unit!8285)

(assert (=> b!134409 (= lt!208434 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001) (_2!6111 lt!208401) lt!208418 lt!208419))))

(assert (=> b!134409 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6111 lt!208401)))) ((_ sign_extend 32) (currentByte!5949 (_2!6111 lt!208401))) ((_ sign_extend 32) (currentBit!5944 (_2!6111 lt!208401))) (bvsub lt!208419 ((_ extract 31 0) (bvsdiv (bvadd lt!208418 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!208431 () Unit!8285)

(assert (=> b!134409 (= lt!208431 lt!208434)))

(assert (=> b!134409 (= lt!208411 (readByteArrayLoop!0 (_2!6111 lt!208401) lt!208415 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1764 () (_ BitVec 64))

(assert (=> b!134409 (= (bitIndex!0 (size!2775 (buf!3158 (_2!6111 lt!208401))) (currentByte!5949 (_2!6111 lt!208401)) (currentBit!5944 (_2!6111 lt!208401))) (bvadd call!1764 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!208425 () Unit!8285)

(declare-fun Unit!8383 () Unit!8285)

(assert (=> b!134409 (= lt!208425 Unit!8383)))

(assert (=> b!134409 (= (bvadd (bitIndex!0 (size!2775 (buf!3158 (_2!6111 lt!208401))) (currentByte!5949 (_2!6111 lt!208401)) (currentBit!5944 (_2!6111 lt!208401))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2775 (buf!3158 (_2!6110 lt!208411))) (currentByte!5949 (_2!6110 lt!208411)) (currentBit!5944 (_2!6110 lt!208411))))))

(declare-fun lt!208413 () Unit!8285)

(declare-fun Unit!8384 () Unit!8285)

(assert (=> b!134409 (= lt!208413 Unit!8384)))

(assert (=> b!134409 (= (bvadd call!1764 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2775 (buf!3158 (_2!6110 lt!208411))) (currentByte!5949 (_2!6110 lt!208411)) (currentBit!5944 (_2!6110 lt!208411))))))

(declare-fun lt!208404 () Unit!8285)

(declare-fun Unit!8385 () Unit!8285)

(assert (=> b!134409 (= lt!208404 Unit!8385)))

(assert (=> b!134409 (and (= (buf!3158 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001)) (buf!3158 (_2!6110 lt!208411))) (= (size!2775 lt!206927) (size!2775 (_3!312 lt!208411))))))

(declare-fun lt!208409 () Unit!8285)

(declare-fun Unit!8386 () Unit!8285)

(assert (=> b!134409 (= lt!208409 Unit!8386)))

(declare-fun lt!208417 () Unit!8285)

(assert (=> b!134409 (= lt!208417 (arrayUpdatedAtPrefixLemma!4 lt!206927 (bvadd #b00000000000000000000000000000001 from!447) (_1!6111 lt!208401)))))

(declare-fun call!1765 () Bool)

(assert (=> b!134409 call!1765))

(declare-fun lt!208420 () Unit!8285)

(assert (=> b!134409 (= lt!208420 lt!208417)))

(declare-fun lt!208435 () (_ BitVec 32))

(assert (=> b!134409 (= lt!208435 #b00000000000000000000000000000000)))

(declare-fun lt!208424 () Unit!8285)

(assert (=> b!134409 (= lt!208424 (arrayRangesEqTransitive!4 lt!206927 lt!208415 (_3!312 lt!208411) lt!208435 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!134409 (arrayRangesEq!178 lt!206927 (_3!312 lt!208411) lt!208435 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!208423 () Unit!8285)

(assert (=> b!134409 (= lt!208423 lt!208424)))

(declare-fun call!1766 () Bool)

(assert (=> b!134409 call!1766))

(declare-fun lt!208432 () Unit!8285)

(declare-fun Unit!8387 () Unit!8285)

(assert (=> b!134409 (= lt!208432 Unit!8387)))

(declare-fun lt!208400 () Unit!8285)

(assert (=> b!134409 (= lt!208400 (arrayRangesEqImpliesEq!4 lt!208415 (_3!312 lt!208411) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!134409 (= (select (store (arr!3425 lt!206927) (bvadd #b00000000000000000000000000000001 from!447) (_1!6111 lt!208401)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3425 (_3!312 lt!208411)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!208414 () Unit!8285)

(assert (=> b!134409 (= lt!208414 lt!208400)))

(declare-fun lt!208430 () Bool)

(assert (=> b!134409 (= lt!208430 (= (select (arr!3425 (_3!312 lt!208411)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6111 lt!208401)))))

(declare-fun Unit!8388 () Unit!8285)

(assert (=> b!134409 (= lt!208405 Unit!8388)))

(assert (=> b!134409 lt!208430))

(declare-fun lt!208410 () tuple3!510)

(declare-fun b!134410 () Bool)

(declare-fun e!89165 () Bool)

(assert (=> b!134410 (= e!89165 (arrayRangesEq!178 lt!206927 (_3!312 lt!208410) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun e!89164 () Bool)

(declare-fun b!134411 () Bool)

(assert (=> b!134411 (= e!89164 (= (select (arr!3425 (_3!312 lt!208410)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6105 (readBytePure!0 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001)))))))

(assert (=> b!134411 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2775 (_3!312 lt!208410))))))

(declare-fun c!7677 () Bool)

(declare-fun bm!1761 () Bool)

(assert (=> bm!1761 (= call!1765 (arrayRangesEq!178 lt!206927 (ite c!7677 (array!6132 (store (arr!3425 lt!206927) (bvadd #b00000000000000000000000000000001 from!447) (_1!6111 lt!208401)) (size!2775 lt!206927)) lt!206927) #b00000000000000000000000000000000 (ite c!7677 (bvadd #b00000000000000000000000000000001 from!447) (size!2775 lt!206927))))))

(declare-fun b!134412 () Bool)

(declare-fun res!111686 () Bool)

(assert (=> b!134412 (=> (not res!111686) (not e!89165))))

(assert (=> b!134412 (= res!111686 (and (= (buf!3158 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001)) (buf!3158 (_2!6110 lt!208410))) (= (size!2775 lt!206927) (size!2775 (_3!312 lt!208410)))))))

(declare-fun bm!1762 () Bool)

(assert (=> bm!1762 (= call!1764 (bitIndex!0 (size!2775 (buf!3158 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001))) (currentByte!5949 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001)) (currentBit!5944 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001))))))

(declare-fun d!43377 () Bool)

(assert (=> d!43377 e!89164))

(declare-fun res!111688 () Bool)

(assert (=> d!43377 (=> res!111688 e!89164)))

(assert (=> d!43377 (= res!111688 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208403 () Bool)

(assert (=> d!43377 (= lt!208403 e!89165)))

(declare-fun res!111687 () Bool)

(assert (=> d!43377 (=> (not res!111687) (not e!89165))))

(declare-fun lt!208426 () (_ BitVec 64))

(declare-fun lt!208429 () (_ BitVec 64))

(assert (=> d!43377 (= res!111687 (= (bvadd lt!208429 lt!208426) (bitIndex!0 (size!2775 (buf!3158 (_2!6110 lt!208410))) (currentByte!5949 (_2!6110 lt!208410)) (currentBit!5944 (_2!6110 lt!208410)))))))

(assert (=> d!43377 (or (not (= (bvand lt!208429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208426 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!208429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!208429 lt!208426) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!208421 () (_ BitVec 64))

(assert (=> d!43377 (= lt!208426 (bvmul lt!208421 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!43377 (or (= lt!208421 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!208421 #b0000000000000000000000000000000000000000000000000000000000001000) lt!208421)))))

(assert (=> d!43377 (= lt!208421 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!43377 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!43377 (= lt!208429 (bitIndex!0 (size!2775 (buf!3158 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001))) (currentByte!5949 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001)) (currentBit!5944 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001))))))

(assert (=> d!43377 (= lt!208410 e!89166)))

(assert (=> d!43377 (= c!7677 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!43377 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2775 lt!206927)))))

(assert (=> d!43377 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001) lt!206927 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!208410)))

(declare-fun lt!208428 () Unit!8285)

(declare-fun b!134413 () Bool)

(assert (=> b!134413 (= e!89166 (tuple3!511 lt!208428 (withMovedByteIndex!0 (_1!6106 lt!206911) #b00000000000000000000000000000001) lt!206927))))

(assert (=> b!134413 (= call!1764 call!1764)))

(declare-fun lt!208416 () Unit!8285)

(declare-fun Unit!8389 () Unit!8285)

(assert (=> b!134413 (= lt!208416 Unit!8389)))

(declare-fun lt!208433 () Unit!8285)

(assert (=> b!134413 (= lt!208433 (arrayRangesEqReflexiveLemma!4 lt!206927))))

(assert (=> b!134413 call!1765))

(declare-fun lt!208412 () Unit!8285)

(assert (=> b!134413 (= lt!208412 lt!208433)))

(declare-fun lt!208427 () array!6131)

(assert (=> b!134413 (= lt!208427 lt!206927)))

(declare-fun lt!208408 () array!6131)

(assert (=> b!134413 (= lt!208408 lt!206927)))

(declare-fun lt!208406 () (_ BitVec 32))

(assert (=> b!134413 (= lt!208406 #b00000000000000000000000000000000)))

(declare-fun lt!208407 () (_ BitVec 32))

(assert (=> b!134413 (= lt!208407 (size!2775 lt!206927))))

(declare-fun lt!208402 () (_ BitVec 32))

(assert (=> b!134413 (= lt!208402 #b00000000000000000000000000000000)))

(declare-fun lt!208422 () (_ BitVec 32))

(assert (=> b!134413 (= lt!208422 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!134413 (= lt!208428 (arrayRangesEqSlicedLemma!4 lt!208427 lt!208408 lt!208406 lt!208407 lt!208402 lt!208422))))

(assert (=> b!134413 call!1766))

(declare-fun bm!1763 () Bool)

(assert (=> bm!1763 (= call!1766 (arrayRangesEq!178 (ite c!7677 lt!206927 lt!208427) (ite c!7677 (_3!312 lt!208411) lt!208408) (ite c!7677 #b00000000000000000000000000000000 lt!208402) (ite c!7677 (bvadd #b00000000000000000000000000000001 from!447) lt!208422)))))

(assert (= (and d!43377 c!7677) b!134409))

(assert (= (and d!43377 (not c!7677)) b!134413))

(assert (= (or b!134409 b!134413) bm!1761))

(assert (= (or b!134409 b!134413) bm!1763))

(assert (= (or b!134409 b!134413) bm!1762))

(assert (= (and d!43377 res!111687) b!134412))

(assert (= (and b!134412 res!111686) b!134410))

(assert (= (and d!43377 (not res!111688)) b!134411))

(declare-fun m!204535 () Bool)

(assert (=> bm!1761 m!204535))

(declare-fun m!204537 () Bool)

(assert (=> bm!1761 m!204537))

(assert (=> b!134413 m!204179))

(declare-fun m!204539 () Bool)

(assert (=> b!134413 m!204539))

(declare-fun m!204541 () Bool)

(assert (=> d!43377 m!204541))

(declare-fun m!204543 () Bool)

(assert (=> d!43377 m!204543))

(assert (=> bm!1762 m!204543))

(declare-fun m!204545 () Bool)

(assert (=> bm!1763 m!204545))

(declare-fun m!204547 () Bool)

(assert (=> b!134409 m!204547))

(assert (=> b!134409 m!202863))

(declare-fun m!204549 () Bool)

(assert (=> b!134409 m!204549))

(declare-fun m!204551 () Bool)

(assert (=> b!134409 m!204551))

(declare-fun m!204553 () Bool)

(assert (=> b!134409 m!204553))

(declare-fun m!204555 () Bool)

(assert (=> b!134409 m!204555))

(declare-fun m!204557 () Bool)

(assert (=> b!134409 m!204557))

(assert (=> b!134409 m!202863))

(declare-fun m!204559 () Bool)

(assert (=> b!134409 m!204559))

(declare-fun m!204561 () Bool)

(assert (=> b!134409 m!204561))

(declare-fun m!204563 () Bool)

(assert (=> b!134409 m!204563))

(declare-fun m!204565 () Bool)

(assert (=> b!134409 m!204565))

(assert (=> b!134409 m!204535))

(declare-fun m!204567 () Bool)

(assert (=> b!134409 m!204567))

(declare-fun m!204569 () Bool)

(assert (=> b!134409 m!204569))

(declare-fun m!204571 () Bool)

(assert (=> b!134410 m!204571))

(declare-fun m!204573 () Bool)

(assert (=> b!134411 m!204573))

(assert (=> b!134411 m!202863))

(declare-fun m!204575 () Bool)

(assert (=> b!134411 m!204575))

(assert (=> d!42926 d!43377))

(assert (=> d!42900 d!42908))

(declare-fun d!43379 () Bool)

(assert (=> d!43379 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_2!6107 lt!206912)))) ((_ sign_extend 32) (currentByte!5949 (_2!6107 lt!206919))) ((_ sign_extend 32) (currentBit!5944 (_2!6107 lt!206919))) lt!206922)))

(assert (=> d!43379 true))

(declare-fun _$5!41 () Unit!8285)

(assert (=> d!43379 (= (choose!26 (_2!6107 lt!206919) (buf!3158 (_2!6107 lt!206912)) lt!206922 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 (_2!6107 lt!206919)) (currentBit!5944 (_2!6107 lt!206919)))) _$5!41)))

(declare-fun bs!10562 () Bool)

(assert (= bs!10562 d!43379))

(assert (=> bs!10562 m!202893))

(assert (=> d!42900 d!43379))

(assert (=> d!42938 d!42944))

(declare-fun d!43381 () Bool)

(declare-fun res!111689 () Bool)

(declare-fun e!89167 () Bool)

(assert (=> d!43381 (=> (not res!111689) (not e!89167))))

(assert (=> d!43381 (= res!111689 (= (size!2775 (buf!3158 (_2!6106 lt!207356))) (size!2775 (buf!3158 (_2!6107 lt!206912)))))))

(assert (=> d!43381 (= (isPrefixOf!0 (_2!6106 lt!207356) (_2!6107 lt!206912)) e!89167)))

(declare-fun b!134414 () Bool)

(declare-fun res!111691 () Bool)

(assert (=> b!134414 (=> (not res!111691) (not e!89167))))

(assert (=> b!134414 (= res!111691 (bvsle (bitIndex!0 (size!2775 (buf!3158 (_2!6106 lt!207356))) (currentByte!5949 (_2!6106 lt!207356)) (currentBit!5944 (_2!6106 lt!207356))) (bitIndex!0 (size!2775 (buf!3158 (_2!6107 lt!206912))) (currentByte!5949 (_2!6107 lt!206912)) (currentBit!5944 (_2!6107 lt!206912)))))))

(declare-fun b!134415 () Bool)

(declare-fun e!89168 () Bool)

(assert (=> b!134415 (= e!89167 e!89168)))

(declare-fun res!111690 () Bool)

(assert (=> b!134415 (=> res!111690 e!89168)))

(assert (=> b!134415 (= res!111690 (= (size!2775 (buf!3158 (_2!6106 lt!207356))) #b00000000000000000000000000000000))))

(declare-fun b!134416 () Bool)

(assert (=> b!134416 (= e!89168 (arrayBitRangesEq!0 (buf!3158 (_2!6106 lt!207356)) (buf!3158 (_2!6107 lt!206912)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2775 (buf!3158 (_2!6106 lt!207356))) (currentByte!5949 (_2!6106 lt!207356)) (currentBit!5944 (_2!6106 lt!207356)))))))

(assert (= (and d!43381 res!111689) b!134414))

(assert (= (and b!134414 res!111691) b!134415))

(assert (= (and b!134415 (not res!111690)) b!134416))

(assert (=> b!134414 m!204263))

(assert (=> b!134414 m!202919))

(assert (=> b!134416 m!204263))

(assert (=> b!134416 m!204263))

(declare-fun m!204577 () Bool)

(assert (=> b!134416 m!204577))

(assert (=> b!133880 d!43381))

(assert (=> d!42827 d!43349))

(assert (=> b!133805 d!42855))

(declare-fun d!43383 () Bool)

(assert (=> d!43383 (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206912)) (buf!3158 (_2!6107 lt!206919)) lt!207166 lt!207179)))

(declare-fun lt!208436 () Unit!8285)

(assert (=> d!43383 (= lt!208436 (choose!8 (buf!3158 (_2!6107 lt!206919)) (buf!3158 (_2!6107 lt!206912)) lt!207166 lt!207179))))

(assert (=> d!43383 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!207166) (bvsle lt!207166 lt!207179))))

(assert (=> d!43383 (= (arrayBitRangesEqSymmetric!0 (buf!3158 (_2!6107 lt!206919)) (buf!3158 (_2!6107 lt!206912)) lt!207166 lt!207179) lt!208436)))

(declare-fun bs!10563 () Bool)

(assert (= bs!10563 d!43383))

(assert (=> bs!10563 m!203083))

(declare-fun m!204579 () Bool)

(assert (=> bs!10563 m!204579))

(assert (=> b!133805 d!43383))

(declare-fun b!134417 () Bool)

(declare-fun e!89172 () Bool)

(declare-fun e!89170 () Bool)

(assert (=> b!134417 (= e!89172 e!89170)))

(declare-fun lt!208439 () tuple4!116)

(declare-fun res!111692 () Bool)

(declare-fun lt!208438 () (_ BitVec 32))

(assert (=> b!134417 (= res!111692 (byteRangesEq!0 (select (arr!3425 (buf!3158 (_2!6107 lt!206912))) (_3!315 lt!208439)) (select (arr!3425 (buf!3158 (_2!6107 lt!206919))) (_3!315 lt!208439)) lt!208438 #b00000000000000000000000000001000))))

(assert (=> b!134417 (=> (not res!111692) (not e!89170))))

(declare-fun e!89171 () Bool)

(declare-fun b!134418 () Bool)

(assert (=> b!134418 (= e!89171 (arrayRangesEq!178 (buf!3158 (_2!6107 lt!206912)) (buf!3158 (_2!6107 lt!206919)) (_1!6117 lt!208439) (_2!6117 lt!208439)))))

(declare-fun b!134419 () Bool)

(declare-fun e!89174 () Bool)

(assert (=> b!134419 (= e!89174 e!89172)))

(declare-fun c!7678 () Bool)

(assert (=> b!134419 (= c!7678 (= (_3!315 lt!208439) (_4!58 lt!208439)))))

(declare-fun bm!1764 () Bool)

(declare-fun call!1767 () Bool)

(declare-fun lt!208437 () (_ BitVec 32))

(assert (=> bm!1764 (= call!1767 (byteRangesEq!0 (ite c!7678 (select (arr!3425 (buf!3158 (_2!6107 lt!206912))) (_3!315 lt!208439)) (select (arr!3425 (buf!3158 (_2!6107 lt!206912))) (_4!58 lt!208439))) (ite c!7678 (select (arr!3425 (buf!3158 (_2!6107 lt!206919))) (_3!315 lt!208439)) (select (arr!3425 (buf!3158 (_2!6107 lt!206919))) (_4!58 lt!208439))) (ite c!7678 lt!208438 #b00000000000000000000000000000000) lt!208437))))

(declare-fun b!134420 () Bool)

(declare-fun e!89173 () Bool)

(assert (=> b!134420 (= e!89173 e!89174)))

(declare-fun res!111693 () Bool)

(assert (=> b!134420 (=> (not res!111693) (not e!89174))))

(assert (=> b!134420 (= res!111693 e!89171)))

(declare-fun res!111694 () Bool)

(assert (=> b!134420 (=> res!111694 e!89171)))

(assert (=> b!134420 (= res!111694 (bvsge (_1!6117 lt!208439) (_2!6117 lt!208439)))))

(assert (=> b!134420 (= lt!208437 ((_ extract 31 0) (bvsrem lt!207179 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134420 (= lt!208438 ((_ extract 31 0) (bvsrem lt!207166 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134420 (= lt!208439 (arrayBitIndices!0 lt!207166 lt!207179))))

(declare-fun b!134421 () Bool)

(assert (=> b!134421 (= e!89172 call!1767)))

(declare-fun b!134422 () Bool)

(declare-fun res!111696 () Bool)

(assert (=> b!134422 (= res!111696 (= lt!208437 #b00000000000000000000000000000000))))

(declare-fun e!89169 () Bool)

(assert (=> b!134422 (=> res!111696 e!89169)))

(assert (=> b!134422 (= e!89170 e!89169)))

(declare-fun b!134423 () Bool)

(assert (=> b!134423 (= e!89169 call!1767)))

(declare-fun d!43385 () Bool)

(declare-fun res!111695 () Bool)

(assert (=> d!43385 (=> res!111695 e!89173)))

(assert (=> d!43385 (= res!111695 (bvsge lt!207166 lt!207179))))

(assert (=> d!43385 (= (arrayBitRangesEq!0 (buf!3158 (_2!6107 lt!206912)) (buf!3158 (_2!6107 lt!206919)) lt!207166 lt!207179) e!89173)))

(assert (= (and d!43385 (not res!111695)) b!134420))

(assert (= (and b!134420 (not res!111694)) b!134418))

(assert (= (and b!134420 res!111693) b!134419))

(assert (= (and b!134419 c!7678) b!134421))

(assert (= (and b!134419 (not c!7678)) b!134417))

(assert (= (and b!134417 res!111692) b!134422))

(assert (= (and b!134422 (not res!111696)) b!134423))

(assert (= (or b!134421 b!134423) bm!1764))

(declare-fun m!204581 () Bool)

(assert (=> b!134417 m!204581))

(declare-fun m!204583 () Bool)

(assert (=> b!134417 m!204583))

(assert (=> b!134417 m!204581))

(assert (=> b!134417 m!204583))

(declare-fun m!204585 () Bool)

(assert (=> b!134417 m!204585))

(declare-fun m!204587 () Bool)

(assert (=> b!134418 m!204587))

(declare-fun m!204589 () Bool)

(assert (=> bm!1764 m!204589))

(assert (=> bm!1764 m!204583))

(declare-fun m!204591 () Bool)

(assert (=> bm!1764 m!204591))

(assert (=> bm!1764 m!204581))

(declare-fun m!204593 () Bool)

(assert (=> bm!1764 m!204593))

(declare-fun m!204595 () Bool)

(assert (=> b!134420 m!204595))

(assert (=> b!133805 d!43385))

(declare-fun d!43387 () Bool)

(declare-fun e!89175 () Bool)

(assert (=> d!43387 e!89175))

(declare-fun res!111697 () Bool)

(assert (=> d!43387 (=> (not res!111697) (not e!89175))))

(declare-fun lt!208440 () BitStream!4814)

(declare-fun lt!208441 () (_ BitVec 64))

(assert (=> d!43387 (= res!111697 (= (bvadd lt!208441 (bvsub lt!207406 lt!207404)) (bitIndex!0 (size!2775 (buf!3158 lt!208440)) (currentByte!5949 lt!208440) (currentBit!5944 lt!208440))))))

(assert (=> d!43387 (or (not (= (bvand lt!208441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207406 lt!207404) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!208441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!208441 (bvsub lt!207406 lt!207404)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43387 (= lt!208441 (bitIndex!0 (size!2775 (buf!3158 (_2!6106 lt!207401))) (currentByte!5949 (_2!6106 lt!207401)) (currentBit!5944 (_2!6106 lt!207401))))))

(assert (=> d!43387 (= lt!208440 (_2!6107 (moveBitIndex!0 (_2!6106 lt!207401) (bvsub lt!207406 lt!207404))))))

(assert (=> d!43387 (moveBitIndexPrecond!0 (_2!6106 lt!207401) (bvsub lt!207406 lt!207404))))

(assert (=> d!43387 (= (withMovedBitIndex!0 (_2!6106 lt!207401) (bvsub lt!207406 lt!207404)) lt!208440)))

(declare-fun b!134424 () Bool)

(assert (=> b!134424 (= e!89175 (= (size!2775 (buf!3158 (_2!6106 lt!207401))) (size!2775 (buf!3158 lt!208440))))))

(assert (= (and d!43387 res!111697) b!134424))

(declare-fun m!204597 () Bool)

(assert (=> d!43387 m!204597))

(assert (=> d!43387 m!204149))

(declare-fun m!204599 () Bool)

(assert (=> d!43387 m!204599))

(declare-fun m!204601 () Bool)

(assert (=> d!43387 m!204601))

(assert (=> b!133895 d!43387))

(assert (=> b!133895 d!42855))

(assert (=> b!133895 d!42857))

(assert (=> d!42831 d!43355))

(declare-fun d!43389 () Bool)

(assert (=> d!43389 (= (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!206928)))) ((_ sign_extend 32) (currentByte!5949 (_1!6105 lt!206928))) ((_ sign_extend 32) (currentBit!5944 (_1!6105 lt!206928)))) (bvsub (bvmul ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!206928)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 (_1!6105 lt!206928))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 (_1!6105 lt!206928))))))))

(assert (=> d!42928 d!43389))

(declare-fun d!43391 () Bool)

(assert (=> d!43391 (= (invariant!0 (currentBit!5944 (_1!6105 lt!206928)) (currentByte!5949 (_1!6105 lt!206928)) (size!2775 (buf!3158 (_1!6105 lt!206928)))) (and (bvsge (currentBit!5944 (_1!6105 lt!206928)) #b00000000000000000000000000000000) (bvslt (currentBit!5944 (_1!6105 lt!206928)) #b00000000000000000000000000001000) (bvsge (currentByte!5949 (_1!6105 lt!206928)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5949 (_1!6105 lt!206928)) (size!2775 (buf!3158 (_1!6105 lt!206928)))) (and (= (currentBit!5944 (_1!6105 lt!206928)) #b00000000000000000000000000000000) (= (currentByte!5949 (_1!6105 lt!206928)) (size!2775 (buf!3158 (_1!6105 lt!206928))))))))))

(assert (=> d!42928 d!43391))

(declare-fun d!43393 () Bool)

(declare-fun e!89176 () Bool)

(assert (=> d!43393 e!89176))

(declare-fun res!111698 () Bool)

(assert (=> d!43393 (=> (not res!111698) (not e!89176))))

(declare-fun lt!208446 () (_ BitVec 64))

(declare-fun lt!208443 () (_ BitVec 64))

(declare-fun lt!208442 () (_ BitVec 64))

(assert (=> d!43393 (= res!111698 (= lt!208443 (bvsub lt!208442 lt!208446)))))

(assert (=> d!43393 (or (= (bvand lt!208442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208446 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!208442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!208442 lt!208446) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43393 (= lt!208446 (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!207375)))) ((_ sign_extend 32) (currentByte!5949 (_1!6105 lt!207375))) ((_ sign_extend 32) (currentBit!5944 (_1!6105 lt!207375)))))))

(declare-fun lt!208445 () (_ BitVec 64))

(declare-fun lt!208444 () (_ BitVec 64))

(assert (=> d!43393 (= lt!208442 (bvmul lt!208445 lt!208444))))

(assert (=> d!43393 (or (= lt!208445 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!208444 (bvsdiv (bvmul lt!208445 lt!208444) lt!208445)))))

(assert (=> d!43393 (= lt!208444 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43393 (= lt!208445 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!207375)))))))

(assert (=> d!43393 (= lt!208443 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 (_1!6105 lt!207375))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 (_1!6105 lt!207375)))))))

(assert (=> d!43393 (invariant!0 (currentBit!5944 (_1!6105 lt!207375)) (currentByte!5949 (_1!6105 lt!207375)) (size!2775 (buf!3158 (_1!6105 lt!207375))))))

(assert (=> d!43393 (= (bitIndex!0 (size!2775 (buf!3158 (_1!6105 lt!207375))) (currentByte!5949 (_1!6105 lt!207375)) (currentBit!5944 (_1!6105 lt!207375))) lt!208443)))

(declare-fun b!134425 () Bool)

(declare-fun res!111699 () Bool)

(assert (=> b!134425 (=> (not res!111699) (not e!89176))))

(assert (=> b!134425 (= res!111699 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!208443))))

(declare-fun b!134426 () Bool)

(declare-fun lt!208447 () (_ BitVec 64))

(assert (=> b!134426 (= e!89176 (bvsle lt!208443 (bvmul lt!208447 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134426 (or (= lt!208447 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!208447 #b0000000000000000000000000000000000000000000000000000000000001000) lt!208447)))))

(assert (=> b!134426 (= lt!208447 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!207375)))))))

(assert (= (and d!43393 res!111698) b!134425))

(assert (= (and b!134425 res!111699) b!134426))

(declare-fun m!204603 () Bool)

(assert (=> d!43393 m!204603))

(declare-fun m!204605 () Bool)

(assert (=> d!43393 m!204605))

(assert (=> d!42924 d!43393))

(declare-fun d!43395 () Bool)

(declare-fun e!89179 () Bool)

(assert (=> d!43395 e!89179))

(declare-fun res!111702 () Bool)

(assert (=> d!43395 (=> (not res!111702) (not e!89179))))

(declare-fun lt!208452 () tuple2!11588)

(declare-fun lt!208453 () tuple2!11588)

(assert (=> d!43395 (= res!111702 (= (bitIndex!0 (size!2775 (buf!3158 (_1!6105 lt!208452))) (currentByte!5949 (_1!6105 lt!208452)) (currentBit!5944 (_1!6105 lt!208452))) (bitIndex!0 (size!2775 (buf!3158 (_1!6105 lt!208453))) (currentByte!5949 (_1!6105 lt!208453)) (currentBit!5944 (_1!6105 lt!208453)))))))

(assert (=> d!43395 (= lt!208453 (readBytePure!0 (BitStream!4815 (buf!3158 (_2!6107 lt!206912)) (currentByte!5949 lt!206913) (currentBit!5944 lt!206913))))))

(assert (=> d!43395 (= lt!208452 (readBytePure!0 lt!206913))))

(assert (=> d!43395 true))

(declare-fun _$8!63 () Unit!8285)

(assert (=> d!43395 (= (choose!14 lt!206913 (_2!6107 lt!206912) lt!207377 lt!207375 (tuple2!11589 (_1!6105 lt!207375) (_2!6105 lt!207375)) (_1!6105 lt!207375) (_2!6105 lt!207375) lt!207376 (tuple2!11589 (_1!6105 lt!207376) (_2!6105 lt!207376)) (_1!6105 lt!207376) (_2!6105 lt!207376)) _$8!63)))

(declare-fun b!134429 () Bool)

(assert (=> b!134429 (= e!89179 (= (_2!6105 lt!208452) (_2!6105 lt!208453)))))

(assert (= (and d!43395 res!111702) b!134429))

(declare-fun m!204607 () Bool)

(assert (=> d!43395 m!204607))

(declare-fun m!204609 () Bool)

(assert (=> d!43395 m!204609))

(declare-fun m!204611 () Bool)

(assert (=> d!43395 m!204611))

(assert (=> d!43395 m!202859))

(assert (=> d!42924 d!43395))

(declare-fun d!43397 () Bool)

(declare-fun e!89180 () Bool)

(assert (=> d!43397 e!89180))

(declare-fun res!111703 () Bool)

(assert (=> d!43397 (=> (not res!111703) (not e!89180))))

(declare-fun lt!208454 () (_ BitVec 64))

(declare-fun lt!208458 () (_ BitVec 64))

(declare-fun lt!208455 () (_ BitVec 64))

(assert (=> d!43397 (= res!111703 (= lt!208455 (bvsub lt!208454 lt!208458)))))

(assert (=> d!43397 (or (= (bvand lt!208454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!208458 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!208454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!208454 lt!208458) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43397 (= lt!208458 (remainingBits!0 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!207376)))) ((_ sign_extend 32) (currentByte!5949 (_1!6105 lt!207376))) ((_ sign_extend 32) (currentBit!5944 (_1!6105 lt!207376)))))))

(declare-fun lt!208457 () (_ BitVec 64))

(declare-fun lt!208456 () (_ BitVec 64))

(assert (=> d!43397 (= lt!208454 (bvmul lt!208457 lt!208456))))

(assert (=> d!43397 (or (= lt!208457 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!208456 (bvsdiv (bvmul lt!208457 lt!208456) lt!208457)))))

(assert (=> d!43397 (= lt!208456 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!43397 (= lt!208457 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!207376)))))))

(assert (=> d!43397 (= lt!208455 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5949 (_1!6105 lt!207376))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5944 (_1!6105 lt!207376)))))))

(assert (=> d!43397 (invariant!0 (currentBit!5944 (_1!6105 lt!207376)) (currentByte!5949 (_1!6105 lt!207376)) (size!2775 (buf!3158 (_1!6105 lt!207376))))))

(assert (=> d!43397 (= (bitIndex!0 (size!2775 (buf!3158 (_1!6105 lt!207376))) (currentByte!5949 (_1!6105 lt!207376)) (currentBit!5944 (_1!6105 lt!207376))) lt!208455)))

(declare-fun b!134430 () Bool)

(declare-fun res!111704 () Bool)

(assert (=> b!134430 (=> (not res!111704) (not e!89180))))

(assert (=> b!134430 (= res!111704 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!208455))))

(declare-fun b!134431 () Bool)

(declare-fun lt!208459 () (_ BitVec 64))

(assert (=> b!134431 (= e!89180 (bvsle lt!208455 (bvmul lt!208459 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!134431 (or (= lt!208459 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!208459 #b0000000000000000000000000000000000000000000000000000000000001000) lt!208459)))))

(assert (=> b!134431 (= lt!208459 ((_ sign_extend 32) (size!2775 (buf!3158 (_1!6105 lt!207376)))))))

(assert (= (and d!43397 res!111703) b!134430))

(assert (= (and b!134430 res!111704) b!134431))

(declare-fun m!204613 () Bool)

(assert (=> d!43397 m!204613))

(declare-fun m!204615 () Bool)

(assert (=> d!43397 m!204615))

(assert (=> d!42924 d!43397))

(assert (=> d!42924 d!42902))

(declare-fun d!43399 () Bool)

(declare-fun lt!208460 () tuple2!11596)

(assert (=> d!43399 (= lt!208460 (readByte!0 lt!207377))))

(assert (=> d!43399 (= (readBytePure!0 lt!207377) (tuple2!11589 (_2!6111 lt!208460) (_1!6111 lt!208460)))))

(declare-fun bs!10564 () Bool)

(assert (= bs!10564 d!43399))

(declare-fun m!204617 () Bool)

(assert (=> bs!10564 m!204617))

(assert (=> d!42924 d!43399))

(declare-fun d!43401 () Bool)

(declare-fun e!89181 () Bool)

(assert (=> d!43401 e!89181))

(declare-fun res!111705 () Bool)

(assert (=> d!43401 (=> (not res!111705) (not e!89181))))

(declare-fun lt!208461 () BitStream!4814)

(declare-fun lt!208462 () (_ BitVec 64))

(assert (=> d!43401 (= res!111705 (= (bvadd lt!208462 (bvsub lt!207361 lt!207359)) (bitIndex!0 (size!2775 (buf!3158 lt!208461)) (currentByte!5949 lt!208461) (currentBit!5944 lt!208461))))))

(assert (=> d!43401 (or (not (= (bvand lt!208462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!207361 lt!207359) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!208462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!208462 (bvsub lt!207361 lt!207359)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!43401 (= lt!208462 (bitIndex!0 (size!2775 (buf!3158 (_2!6106 lt!207356))) (currentByte!5949 (_2!6106 lt!207356)) (currentBit!5944 (_2!6106 lt!207356))))))

(assert (=> d!43401 (= lt!208461 (_2!6107 (moveBitIndex!0 (_2!6106 lt!207356) (bvsub lt!207361 lt!207359))))))

(assert (=> d!43401 (moveBitIndexPrecond!0 (_2!6106 lt!207356) (bvsub lt!207361 lt!207359))))

(assert (=> d!43401 (= (withMovedBitIndex!0 (_2!6106 lt!207356) (bvsub lt!207361 lt!207359)) lt!208461)))

(declare-fun b!134432 () Bool)

(assert (=> b!134432 (= e!89181 (= (size!2775 (buf!3158 (_2!6106 lt!207356))) (size!2775 (buf!3158 lt!208461))))))

(assert (= (and d!43401 res!111705) b!134432))

(declare-fun m!204619 () Bool)

(assert (=> d!43401 m!204619))

(assert (=> d!43401 m!204263))

(declare-fun m!204621 () Bool)

(assert (=> d!43401 m!204621))

(declare-fun m!204623 () Bool)

(assert (=> d!43401 m!204623))

(assert (=> b!133882 d!43401))

(assert (=> b!133882 d!42845))

(assert (=> b!133882 d!42857))

(push 1)

(assert (not d!43253))

(assert (not d!43275))

(assert (not d!43399))

(assert (not b!134323))

(assert (not b!134409))

(assert (not b!134355))

(assert (not b!134231))

(assert (not bm!1747))

(assert (not d!43379))

(assert (not d!43319))

(assert (not bm!1756))

(assert (not b!134414))

(assert (not d!43245))

(assert (not b!134309))

(assert (not b!134354))

(assert (not d!43271))

(assert (not b!134216))

(assert (not b!134413))

(assert (not b!134408))

(assert (not d!43357))

(assert (not b!134273))

(assert (not d!43317))

(assert (not d!43395))

(assert (not d!43369))

(assert (not b!134251))

(assert (not d!43303))

(assert (not b!134329))

(assert (not b!134229))

(assert (not b!134272))

(assert (not b!134394))

(assert (not d!43383))

(assert (not d!43313))

(assert (not b!134333))

(assert (not b!134234))

(assert (not b!134350))

(assert (not b!134330))

(assert (not b!134258))

(assert (not d!43387))

(assert (not d!43291))

(assert (not b!134420))

(assert (not d!43393))

(assert (not bm!1757))

(assert (not bm!1758))

(assert (not b!134266))

(assert (not bm!1761))

(assert (not d!43295))

(assert (not d!43361))

(assert (not b!134320))

(assert (not d!43365))

(assert (not b!134353))

(assert (not d!43325))

(assert (not b!134282))

(assert (not b!134286))

(assert (not d!43247))

(assert (not b!134228))

(assert (not b!134389))

(assert (not b!134292))

(assert (not b!134345))

(assert (not b!134280))

(assert (not b!134254))

(assert (not d!43289))

(assert (not b!134297))

(assert (not b!134294))

(assert (not d!43339))

(assert (not b!134418))

(assert (not d!43345))

(assert (not b!134390))

(assert (not d!43321))

(assert (not b!134261))

(assert (not bm!1750))

(assert (not d!43351))

(assert (not b!134398))

(assert (not bm!1753))

(assert (not b!134277))

(assert (not b!134315))

(assert (not b!134361))

(assert (not b!134252))

(assert (not b!134313))

(assert (not b!134392))

(assert (not d!43243))

(assert (not bm!1760))

(assert (not b!134417))

(assert (not d!43277))

(assert (not bm!1751))

(assert (not b!134301))

(assert (not bm!1764))

(assert (not bm!1746))

(assert (not bm!1762))

(assert (not b!134284))

(assert (not d!43227))

(assert (not b!134342))

(assert (not d!43237))

(assert (not d!43343))

(assert (not b!134378))

(assert (not b!134391))

(assert (not bm!1759))

(assert (not d!43225))

(assert (not bm!1763))

(assert (not d!43255))

(assert (not d!43285))

(assert (not b!134411))

(assert (not b!134373))

(assert (not b!134291))

(assert (not b!134316))

(assert (not d!43301))

(assert (not d!43377))

(assert (not b!134357))

(assert (not b!134260))

(assert (not b!134396))

(assert (not b!134295))

(assert (not b!134275))

(assert (not b!134319))

(assert (not b!134375))

(assert (not b!134321))

(assert (not b!134410))

(assert (not bm!1752))

(assert (not b!134298))

(assert (not d!43279))

(assert (not bm!1755))

(assert (not d!43363))

(assert (not b!134393))

(assert (not b!134303))

(assert (not b!134359))

(assert (not b!134327))

(assert (not b!134364))

(assert (not b!134279))

(assert (not b!134362))

(assert (not b!134227))

(assert (not b!134264))

(assert (not bm!1745))

(assert (not b!134274))

(assert (not b!134346))

(assert (not d!43353))

(assert (not b!134343))

(assert (not d!43221))

(assert (not b!134416))

(assert (not b!134311))

(assert (not d!43293))

(assert (not b!134406))

(assert (not b!134232))

(assert (not b!134267))

(assert (not b!134331))

(assert (not b!134348))

(assert (not d!43347))

(assert (not b!134376))

(assert (not d!43219))

(assert (not b!134402))

(assert (not b!134340))

(assert (not b!134400))

(assert (not b!134263))

(assert (not d!43297))

(assert (not bm!1754))

(assert (not b!134399))

(assert (not b!134283))

(assert (not b!134300))

(assert (not d!43239))

(assert (not b!134269))

(assert (not b!134236))

(assert (not b!134314))

(assert (not b!134374))

(assert (not b!134360))

(assert (not d!43397))

(assert (not d!43401))

(assert (not d!43337))

(assert (not b!134270))

(assert (not b!134317))

(assert (not d!43341))

(assert (not d!43283))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

