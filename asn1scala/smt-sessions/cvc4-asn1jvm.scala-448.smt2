; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11884 () Bool)

(assert start!11884)

(declare-datatypes ((array!2741 0))(
  ( (array!2742 (arr!1810 (Array (_ BitVec 32) (_ BitVec 8))) (size!1246 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2180 0))(
  ( (BitStream!2181 (buf!1627 array!2741) (currentByte!3245 (_ BitVec 32)) (currentBit!3240 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4115 0))(
  ( (Unit!4116) )
))
(declare-datatypes ((tuple2!5482 0))(
  ( (tuple2!5483 (_1!2852 Unit!4115) (_2!2852 BitStream!2180)) )
))
(declare-fun lt!94022 () tuple2!5482)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!94017 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun e!40121 () Bool)

(declare-fun b!60168 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60168 (= e!40121 (= lt!94017 (bvsub (bvsub (bvadd (bitIndex!0 (size!1246 (buf!1627 (_2!2852 lt!94022))) (currentByte!3245 (_2!2852 lt!94022)) (currentBit!3240 (_2!2852 lt!94022))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60169 () Bool)

(declare-fun res!50154 () Bool)

(declare-fun e!40117 () Bool)

(assert (=> b!60169 (=> res!50154 e!40117)))

(declare-fun thiss!1379 () BitStream!2180)

(declare-fun lt!94015 () tuple2!5482)

(assert (=> b!60169 (= res!50154 (not (= (size!1246 (buf!1627 thiss!1379)) (size!1246 (buf!1627 (_2!2852 lt!94015))))))))

(declare-fun b!60170 () Bool)

(declare-fun e!40122 () Bool)

(declare-fun e!40119 () Bool)

(assert (=> b!60170 (= e!40122 e!40119)))

(declare-fun res!50153 () Bool)

(assert (=> b!60170 (=> res!50153 e!40119)))

(declare-fun isPrefixOf!0 (BitStream!2180 BitStream!2180) Bool)

(assert (=> b!60170 (= res!50153 (not (isPrefixOf!0 (_2!2852 lt!94022) (_2!2852 lt!94015))))))

(assert (=> b!60170 (isPrefixOf!0 thiss!1379 (_2!2852 lt!94015))))

(declare-fun lt!94030 () Unit!4115)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2180 BitStream!2180 BitStream!2180) Unit!4115)

(assert (=> b!60170 (= lt!94030 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2852 lt!94022) (_2!2852 lt!94015)))))

(declare-fun srcBuffer!2 () array!2741)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2180 array!2741 (_ BitVec 64) (_ BitVec 64)) tuple2!5482)

(assert (=> b!60170 (= lt!94015 (appendBitsMSBFirstLoop!0 (_2!2852 lt!94022) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!40124 () Bool)

(assert (=> b!60170 e!40124))

(declare-fun res!50151 () Bool)

(assert (=> b!60170 (=> (not res!50151) (not e!40124))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60170 (= res!50151 (validate_offset_bits!1 ((_ sign_extend 32) (size!1246 (buf!1627 (_2!2852 lt!94022)))) ((_ sign_extend 32) (currentByte!3245 thiss!1379)) ((_ sign_extend 32) (currentBit!3240 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94029 () Unit!4115)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2180 array!2741 (_ BitVec 64)) Unit!4115)

(assert (=> b!60170 (= lt!94029 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1627 (_2!2852 lt!94022)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5484 0))(
  ( (tuple2!5485 (_1!2853 BitStream!2180) (_2!2853 BitStream!2180)) )
))
(declare-fun lt!94025 () tuple2!5484)

(declare-fun reader!0 (BitStream!2180 BitStream!2180) tuple2!5484)

(assert (=> b!60170 (= lt!94025 (reader!0 thiss!1379 (_2!2852 lt!94022)))))

(declare-fun b!60172 () Bool)

(declare-fun e!40125 () Bool)

(assert (=> b!60172 (= e!40125 e!40122)))

(declare-fun res!50147 () Bool)

(assert (=> b!60172 (=> res!50147 e!40122)))

(assert (=> b!60172 (= res!50147 (not (isPrefixOf!0 thiss!1379 (_2!2852 lt!94022))))))

(declare-fun lt!94019 () (_ BitVec 64))

(assert (=> b!60172 (validate_offset_bits!1 ((_ sign_extend 32) (size!1246 (buf!1627 (_2!2852 lt!94022)))) ((_ sign_extend 32) (currentByte!3245 (_2!2852 lt!94022))) ((_ sign_extend 32) (currentBit!3240 (_2!2852 lt!94022))) lt!94019)))

(assert (=> b!60172 (= lt!94019 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94024 () Unit!4115)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2180 BitStream!2180 (_ BitVec 64) (_ BitVec 64)) Unit!4115)

(assert (=> b!60172 (= lt!94024 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2852 lt!94022) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2180 (_ BitVec 8) (_ BitVec 32)) tuple2!5482)

(assert (=> b!60172 (= lt!94022 (appendBitFromByte!0 thiss!1379 (select (arr!1810 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60173 () Bool)

(declare-fun e!40118 () Bool)

(assert (=> b!60173 (= e!40118 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!94028 () tuple2!5484)

(declare-datatypes ((List!665 0))(
  ( (Nil!662) (Cons!661 (h!780 Bool) (t!1415 List!665)) )
))
(declare-fun lt!94023 () List!665)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2180 BitStream!2180 (_ BitVec 64)) List!665)

(assert (=> b!60173 (= lt!94023 (bitStreamReadBitsIntoList!0 (_2!2852 lt!94015) (_1!2853 lt!94028) lt!94019))))

(declare-fun lt!94021 () tuple2!5484)

(declare-fun lt!94018 () List!665)

(assert (=> b!60173 (= lt!94018 (bitStreamReadBitsIntoList!0 (_2!2852 lt!94015) (_1!2853 lt!94021) (bvsub to!314 i!635)))))

(assert (=> b!60173 (validate_offset_bits!1 ((_ sign_extend 32) (size!1246 (buf!1627 (_2!2852 lt!94015)))) ((_ sign_extend 32) (currentByte!3245 (_2!2852 lt!94022))) ((_ sign_extend 32) (currentBit!3240 (_2!2852 lt!94022))) lt!94019)))

(declare-fun lt!94026 () Unit!4115)

(assert (=> b!60173 (= lt!94026 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2852 lt!94022) (buf!1627 (_2!2852 lt!94015)) lt!94019))))

(assert (=> b!60173 (= lt!94028 (reader!0 (_2!2852 lt!94022) (_2!2852 lt!94015)))))

(assert (=> b!60173 (validate_offset_bits!1 ((_ sign_extend 32) (size!1246 (buf!1627 (_2!2852 lt!94015)))) ((_ sign_extend 32) (currentByte!3245 thiss!1379)) ((_ sign_extend 32) (currentBit!3240 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94027 () Unit!4115)

(assert (=> b!60173 (= lt!94027 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1627 (_2!2852 lt!94015)) (bvsub to!314 i!635)))))

(assert (=> b!60173 (= lt!94021 (reader!0 thiss!1379 (_2!2852 lt!94015)))))

(declare-fun b!60174 () Bool)

(declare-fun res!50149 () Bool)

(assert (=> b!60174 (=> res!50149 e!40118)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60174 (= res!50149 (not (invariant!0 (currentBit!3240 (_2!2852 lt!94022)) (currentByte!3245 (_2!2852 lt!94022)) (size!1246 (buf!1627 (_2!2852 lt!94015))))))))

(declare-fun b!60175 () Bool)

(assert (=> b!60175 (= e!40119 e!40117)))

(declare-fun res!50142 () Bool)

(assert (=> b!60175 (=> res!50142 e!40117)))

(declare-fun lt!94020 () (_ BitVec 64))

(assert (=> b!60175 (= res!50142 (not (= lt!94017 (bvsub (bvadd lt!94020 to!314) i!635))))))

(assert (=> b!60175 (= lt!94017 (bitIndex!0 (size!1246 (buf!1627 (_2!2852 lt!94015))) (currentByte!3245 (_2!2852 lt!94015)) (currentBit!3240 (_2!2852 lt!94015))))))

(declare-fun b!60176 () Bool)

(declare-fun res!50146 () Bool)

(declare-fun e!40126 () Bool)

(assert (=> b!60176 (=> (not res!50146) (not e!40126))))

(assert (=> b!60176 (= res!50146 (validate_offset_bits!1 ((_ sign_extend 32) (size!1246 (buf!1627 thiss!1379))) ((_ sign_extend 32) (currentByte!3245 thiss!1379)) ((_ sign_extend 32) (currentBit!3240 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!50150 () Bool)

(assert (=> start!11884 (=> (not res!50150) (not e!40126))))

(assert (=> start!11884 (= res!50150 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1246 srcBuffer!2))))))))

(assert (=> start!11884 e!40126))

(assert (=> start!11884 true))

(declare-fun array_inv!1149 (array!2741) Bool)

(assert (=> start!11884 (array_inv!1149 srcBuffer!2)))

(declare-fun e!40127 () Bool)

(declare-fun inv!12 (BitStream!2180) Bool)

(assert (=> start!11884 (and (inv!12 thiss!1379) e!40127)))

(declare-fun b!60171 () Bool)

(declare-fun head!484 (List!665) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2180 array!2741 (_ BitVec 64) (_ BitVec 64)) List!665)

(assert (=> b!60171 (= e!40124 (= (head!484 (byteArrayBitContentToList!0 (_2!2852 lt!94022) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!484 (bitStreamReadBitsIntoList!0 (_2!2852 lt!94022) (_1!2853 lt!94025) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60177 () Bool)

(declare-fun res!50152 () Bool)

(assert (=> b!60177 (=> res!50152 e!40118)))

(assert (=> b!60177 (= res!50152 (not (invariant!0 (currentBit!3240 (_2!2852 lt!94022)) (currentByte!3245 (_2!2852 lt!94022)) (size!1246 (buf!1627 (_2!2852 lt!94022))))))))

(declare-fun b!60178 () Bool)

(assert (=> b!60178 (= e!40127 (array_inv!1149 (buf!1627 thiss!1379)))))

(declare-fun b!60179 () Bool)

(assert (=> b!60179 (= e!40117 e!40118)))

(declare-fun res!50143 () Bool)

(assert (=> b!60179 (=> res!50143 e!40118)))

(assert (=> b!60179 (= res!50143 (not (= (size!1246 (buf!1627 (_2!2852 lt!94022))) (size!1246 (buf!1627 (_2!2852 lt!94015))))))))

(assert (=> b!60179 e!40121))

(declare-fun res!50145 () Bool)

(assert (=> b!60179 (=> (not res!50145) (not e!40121))))

(assert (=> b!60179 (= res!50145 (= (size!1246 (buf!1627 (_2!2852 lt!94015))) (size!1246 (buf!1627 thiss!1379))))))

(declare-fun b!60180 () Bool)

(assert (=> b!60180 (= e!40126 (not e!40125))))

(declare-fun res!50144 () Bool)

(assert (=> b!60180 (=> res!50144 e!40125)))

(assert (=> b!60180 (= res!50144 (bvsge i!635 to!314))))

(assert (=> b!60180 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!94016 () Unit!4115)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2180) Unit!4115)

(assert (=> b!60180 (= lt!94016 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!60180 (= lt!94020 (bitIndex!0 (size!1246 (buf!1627 thiss!1379)) (currentByte!3245 thiss!1379) (currentBit!3240 thiss!1379)))))

(declare-fun b!60181 () Bool)

(declare-fun res!50148 () Bool)

(assert (=> b!60181 (=> res!50148 e!40117)))

(assert (=> b!60181 (= res!50148 (not (invariant!0 (currentBit!3240 (_2!2852 lt!94015)) (currentByte!3245 (_2!2852 lt!94015)) (size!1246 (buf!1627 (_2!2852 lt!94015))))))))

(assert (= (and start!11884 res!50150) b!60176))

(assert (= (and b!60176 res!50146) b!60180))

(assert (= (and b!60180 (not res!50144)) b!60172))

(assert (= (and b!60172 (not res!50147)) b!60170))

(assert (= (and b!60170 res!50151) b!60171))

(assert (= (and b!60170 (not res!50153)) b!60175))

(assert (= (and b!60175 (not res!50142)) b!60181))

(assert (= (and b!60181 (not res!50148)) b!60169))

(assert (= (and b!60169 (not res!50154)) b!60179))

(assert (= (and b!60179 res!50145) b!60168))

(assert (= (and b!60179 (not res!50143)) b!60177))

(assert (= (and b!60177 (not res!50152)) b!60174))

(assert (= (and b!60174 (not res!50149)) b!60173))

(assert (= start!11884 b!60178))

(declare-fun m!94801 () Bool)

(assert (=> b!60175 m!94801))

(declare-fun m!94803 () Bool)

(assert (=> start!11884 m!94803))

(declare-fun m!94805 () Bool)

(assert (=> start!11884 m!94805))

(declare-fun m!94807 () Bool)

(assert (=> b!60170 m!94807))

(declare-fun m!94809 () Bool)

(assert (=> b!60170 m!94809))

(declare-fun m!94811 () Bool)

(assert (=> b!60170 m!94811))

(declare-fun m!94813 () Bool)

(assert (=> b!60170 m!94813))

(declare-fun m!94815 () Bool)

(assert (=> b!60170 m!94815))

(declare-fun m!94817 () Bool)

(assert (=> b!60170 m!94817))

(declare-fun m!94819 () Bool)

(assert (=> b!60170 m!94819))

(declare-fun m!94821 () Bool)

(assert (=> b!60173 m!94821))

(declare-fun m!94823 () Bool)

(assert (=> b!60173 m!94823))

(declare-fun m!94825 () Bool)

(assert (=> b!60173 m!94825))

(declare-fun m!94827 () Bool)

(assert (=> b!60173 m!94827))

(declare-fun m!94829 () Bool)

(assert (=> b!60173 m!94829))

(declare-fun m!94831 () Bool)

(assert (=> b!60173 m!94831))

(declare-fun m!94833 () Bool)

(assert (=> b!60173 m!94833))

(declare-fun m!94835 () Bool)

(assert (=> b!60173 m!94835))

(declare-fun m!94837 () Bool)

(assert (=> b!60178 m!94837))

(declare-fun m!94839 () Bool)

(assert (=> b!60168 m!94839))

(declare-fun m!94841 () Bool)

(assert (=> b!60176 m!94841))

(declare-fun m!94843 () Bool)

(assert (=> b!60171 m!94843))

(assert (=> b!60171 m!94843))

(declare-fun m!94845 () Bool)

(assert (=> b!60171 m!94845))

(declare-fun m!94847 () Bool)

(assert (=> b!60171 m!94847))

(assert (=> b!60171 m!94847))

(declare-fun m!94849 () Bool)

(assert (=> b!60171 m!94849))

(declare-fun m!94851 () Bool)

(assert (=> b!60172 m!94851))

(declare-fun m!94853 () Bool)

(assert (=> b!60172 m!94853))

(declare-fun m!94855 () Bool)

(assert (=> b!60172 m!94855))

(declare-fun m!94857 () Bool)

(assert (=> b!60172 m!94857))

(assert (=> b!60172 m!94853))

(declare-fun m!94859 () Bool)

(assert (=> b!60172 m!94859))

(declare-fun m!94861 () Bool)

(assert (=> b!60181 m!94861))

(declare-fun m!94863 () Bool)

(assert (=> b!60177 m!94863))

(declare-fun m!94865 () Bool)

(assert (=> b!60174 m!94865))

(declare-fun m!94867 () Bool)

(assert (=> b!60180 m!94867))

(declare-fun m!94869 () Bool)

(assert (=> b!60180 m!94869))

(declare-fun m!94871 () Bool)

(assert (=> b!60180 m!94871))

(push 1)

(assert (not b!60172))

(assert (not b!60173))

(assert (not b!60176))

(assert (not b!60174))

(assert (not start!11884))

(assert (not b!60177))

(assert (not b!60171))

(assert (not b!60170))

(assert (not b!60180))

(assert (not b!60178))

(assert (not b!60181))

(assert (not b!60175))

(assert (not b!60168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

