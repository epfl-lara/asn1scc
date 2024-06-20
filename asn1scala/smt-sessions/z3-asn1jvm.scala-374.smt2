; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8842 () Bool)

(assert start!8842)

(declare-fun res!37224 () Bool)

(declare-fun e!29277 () Bool)

(assert (=> start!8842 (=> (not res!37224) (not e!29277))))

(declare-datatypes ((array!2226 0))(
  ( (array!2227 (arr!1512 (Array (_ BitVec 32) (_ BitVec 8))) (size!1004 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2226)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8842 (= res!37224 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1004 srcBuffer!2))))))))

(assert (=> start!8842 e!29277))

(assert (=> start!8842 true))

(declare-fun array_inv!929 (array!2226) Bool)

(assert (=> start!8842 (array_inv!929 srcBuffer!2)))

(declare-datatypes ((BitStream!1752 0))(
  ( (BitStream!1753 (buf!1344 array!2226) (currentByte!2819 (_ BitVec 32)) (currentBit!2814 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1752)

(declare-fun e!29281 () Bool)

(declare-fun inv!12 (BitStream!1752) Bool)

(assert (=> start!8842 (and (inv!12 thiss!1379) e!29281)))

(declare-fun b!43904 () Bool)

(declare-fun res!37222 () Bool)

(declare-fun e!29278 () Bool)

(assert (=> b!43904 (=> res!37222 e!29278)))

(declare-datatypes ((Unit!3126 0))(
  ( (Unit!3127) )
))
(declare-datatypes ((tuple2!4302 0))(
  ( (tuple2!4303 (_1!2244 Unit!3126) (_2!2244 BitStream!1752)) )
))
(declare-fun lt!66786 () tuple2!4302)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!43904 (= res!37222 (not (invariant!0 (currentBit!2814 (_2!2244 lt!66786)) (currentByte!2819 (_2!2244 lt!66786)) (size!1004 (buf!1344 (_2!2244 lt!66786))))))))

(declare-fun b!43905 () Bool)

(declare-fun e!29279 () Bool)

(declare-fun e!29280 () Bool)

(assert (=> b!43905 (= e!29279 e!29280)))

(declare-fun res!37225 () Bool)

(assert (=> b!43905 (=> res!37225 e!29280)))

(declare-fun lt!66789 () tuple2!4302)

(declare-fun isPrefixOf!0 (BitStream!1752 BitStream!1752) Bool)

(assert (=> b!43905 (= res!37225 (not (isPrefixOf!0 thiss!1379 (_2!2244 lt!66789))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43905 (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!66789)))) ((_ sign_extend 32) (currentByte!2819 (_2!2244 lt!66789))) ((_ sign_extend 32) (currentBit!2814 (_2!2244 lt!66789))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!66792 () Unit!3126)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1752 BitStream!1752 (_ BitVec 64) (_ BitVec 64)) Unit!3126)

(assert (=> b!43905 (= lt!66792 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2244 lt!66789) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1752 (_ BitVec 8) (_ BitVec 32)) tuple2!4302)

(assert (=> b!43905 (= lt!66789 (appendBitFromByte!0 thiss!1379 (select (arr!1512 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!43906 () Bool)

(assert (=> b!43906 (= e!29281 (array_inv!929 (buf!1344 thiss!1379)))))

(declare-datatypes ((tuple2!4304 0))(
  ( (tuple2!4305 (_1!2245 BitStream!1752) (_2!2245 BitStream!1752)) )
))
(declare-fun lt!66790 () tuple2!4304)

(declare-fun e!29275 () Bool)

(declare-fun b!43907 () Bool)

(declare-datatypes ((List!517 0))(
  ( (Nil!514) (Cons!513 (h!632 Bool) (t!1267 List!517)) )
))
(declare-fun head!336 (List!517) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1752 array!2226 (_ BitVec 64) (_ BitVec 64)) List!517)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1752 BitStream!1752 (_ BitVec 64)) List!517)

(assert (=> b!43907 (= e!29275 (= (head!336 (byteArrayBitContentToList!0 (_2!2244 lt!66789) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!336 (bitStreamReadBitsIntoList!0 (_2!2244 lt!66789) (_1!2245 lt!66790) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!43908 () Bool)

(assert (=> b!43908 (= e!29278 (= (size!1004 (buf!1344 thiss!1379)) (size!1004 (buf!1344 (_2!2244 lt!66786)))))))

(declare-fun b!43909 () Bool)

(declare-fun res!37227 () Bool)

(assert (=> b!43909 (=> (not res!37227) (not e!29277))))

(assert (=> b!43909 (= res!37227 (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 thiss!1379))) ((_ sign_extend 32) (currentByte!2819 thiss!1379)) ((_ sign_extend 32) (currentBit!2814 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!43910 () Bool)

(declare-fun res!37220 () Bool)

(assert (=> b!43910 (=> res!37220 e!29278)))

(declare-fun lt!66791 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!43910 (= res!37220 (not (= (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!66786))) (currentByte!2819 (_2!2244 lt!66786)) (currentBit!2814 (_2!2244 lt!66786))) (bvsub (bvadd lt!66791 to!314) i!635))))))

(declare-fun b!43911 () Bool)

(assert (=> b!43911 (= e!29280 e!29278)))

(declare-fun res!37226 () Bool)

(assert (=> b!43911 (=> res!37226 e!29278)))

(assert (=> b!43911 (= res!37226 (not (isPrefixOf!0 (_2!2244 lt!66789) (_2!2244 lt!66786))))))

(assert (=> b!43911 (isPrefixOf!0 thiss!1379 (_2!2244 lt!66786))))

(declare-fun lt!66788 () Unit!3126)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1752 BitStream!1752 BitStream!1752) Unit!3126)

(assert (=> b!43911 (= lt!66788 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2244 lt!66789) (_2!2244 lt!66786)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1752 array!2226 (_ BitVec 64) (_ BitVec 64)) tuple2!4302)

(assert (=> b!43911 (= lt!66786 (appendBitsMSBFirstLoop!0 (_2!2244 lt!66789) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!43911 e!29275))

(declare-fun res!37221 () Bool)

(assert (=> b!43911 (=> (not res!37221) (not e!29275))))

(assert (=> b!43911 (= res!37221 (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!66789)))) ((_ sign_extend 32) (currentByte!2819 thiss!1379)) ((_ sign_extend 32) (currentBit!2814 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!66793 () Unit!3126)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1752 array!2226 (_ BitVec 64)) Unit!3126)

(assert (=> b!43911 (= lt!66793 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1344 (_2!2244 lt!66789)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1752 BitStream!1752) tuple2!4304)

(assert (=> b!43911 (= lt!66790 (reader!0 thiss!1379 (_2!2244 lt!66789)))))

(declare-fun b!43912 () Bool)

(assert (=> b!43912 (= e!29277 (not e!29279))))

(declare-fun res!37223 () Bool)

(assert (=> b!43912 (=> res!37223 e!29279)))

(assert (=> b!43912 (= res!37223 (bvsge i!635 to!314))))

(assert (=> b!43912 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!66787 () Unit!3126)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1752) Unit!3126)

(assert (=> b!43912 (= lt!66787 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!43912 (= lt!66791 (bitIndex!0 (size!1004 (buf!1344 thiss!1379)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379)))))

(assert (= (and start!8842 res!37224) b!43909))

(assert (= (and b!43909 res!37227) b!43912))

(assert (= (and b!43912 (not res!37223)) b!43905))

(assert (= (and b!43905 (not res!37225)) b!43911))

(assert (= (and b!43911 res!37221) b!43907))

(assert (= (and b!43911 (not res!37226)) b!43910))

(assert (= (and b!43910 (not res!37220)) b!43904))

(assert (= (and b!43904 (not res!37222)) b!43908))

(assert (= start!8842 b!43906))

(declare-fun m!66873 () Bool)

(assert (=> b!43906 m!66873))

(declare-fun m!66875 () Bool)

(assert (=> b!43905 m!66875))

(declare-fun m!66877 () Bool)

(assert (=> b!43905 m!66877))

(declare-fun m!66879 () Bool)

(assert (=> b!43905 m!66879))

(declare-fun m!66881 () Bool)

(assert (=> b!43905 m!66881))

(assert (=> b!43905 m!66879))

(declare-fun m!66883 () Bool)

(assert (=> b!43905 m!66883))

(declare-fun m!66885 () Bool)

(assert (=> start!8842 m!66885))

(declare-fun m!66887 () Bool)

(assert (=> start!8842 m!66887))

(declare-fun m!66889 () Bool)

(assert (=> b!43911 m!66889))

(declare-fun m!66891 () Bool)

(assert (=> b!43911 m!66891))

(declare-fun m!66893 () Bool)

(assert (=> b!43911 m!66893))

(declare-fun m!66895 () Bool)

(assert (=> b!43911 m!66895))

(declare-fun m!66897 () Bool)

(assert (=> b!43911 m!66897))

(declare-fun m!66899 () Bool)

(assert (=> b!43911 m!66899))

(declare-fun m!66901 () Bool)

(assert (=> b!43911 m!66901))

(declare-fun m!66903 () Bool)

(assert (=> b!43904 m!66903))

(declare-fun m!66905 () Bool)

(assert (=> b!43912 m!66905))

(declare-fun m!66907 () Bool)

(assert (=> b!43912 m!66907))

(declare-fun m!66909 () Bool)

(assert (=> b!43912 m!66909))

(declare-fun m!66911 () Bool)

(assert (=> b!43910 m!66911))

(declare-fun m!66913 () Bool)

(assert (=> b!43909 m!66913))

(declare-fun m!66915 () Bool)

(assert (=> b!43907 m!66915))

(assert (=> b!43907 m!66915))

(declare-fun m!66917 () Bool)

(assert (=> b!43907 m!66917))

(declare-fun m!66919 () Bool)

(assert (=> b!43907 m!66919))

(assert (=> b!43907 m!66919))

(declare-fun m!66921 () Bool)

(assert (=> b!43907 m!66921))

(check-sat (not b!43912) (not b!43910) (not b!43911) (not b!43909) (not b!43904) (not b!43906) (not start!8842) (not b!43905) (not b!43907))
(check-sat)
(get-model)

(declare-fun d!12750 () Bool)

(declare-fun e!29309 () Bool)

(assert (=> d!12750 e!29309))

(declare-fun res!37257 () Bool)

(assert (=> d!12750 (=> (not res!37257) (not e!29309))))

(declare-fun lt!66831 () (_ BitVec 64))

(declare-fun lt!66833 () (_ BitVec 64))

(declare-fun lt!66834 () (_ BitVec 64))

(assert (=> d!12750 (= res!37257 (= lt!66833 (bvsub lt!66834 lt!66831)))))

(assert (=> d!12750 (or (= (bvand lt!66834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66831 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66834 lt!66831) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12750 (= lt!66831 (remainingBits!0 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!66786)))) ((_ sign_extend 32) (currentByte!2819 (_2!2244 lt!66786))) ((_ sign_extend 32) (currentBit!2814 (_2!2244 lt!66786)))))))

(declare-fun lt!66835 () (_ BitVec 64))

(declare-fun lt!66832 () (_ BitVec 64))

(assert (=> d!12750 (= lt!66834 (bvmul lt!66835 lt!66832))))

(assert (=> d!12750 (or (= lt!66835 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!66832 (bvsdiv (bvmul lt!66835 lt!66832) lt!66835)))))

(assert (=> d!12750 (= lt!66832 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12750 (= lt!66835 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!66786)))))))

(assert (=> d!12750 (= lt!66833 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2819 (_2!2244 lt!66786))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2814 (_2!2244 lt!66786)))))))

(assert (=> d!12750 (invariant!0 (currentBit!2814 (_2!2244 lt!66786)) (currentByte!2819 (_2!2244 lt!66786)) (size!1004 (buf!1344 (_2!2244 lt!66786))))))

(assert (=> d!12750 (= (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!66786))) (currentByte!2819 (_2!2244 lt!66786)) (currentBit!2814 (_2!2244 lt!66786))) lt!66833)))

(declare-fun b!43944 () Bool)

(declare-fun res!37256 () Bool)

(assert (=> b!43944 (=> (not res!37256) (not e!29309))))

(assert (=> b!43944 (= res!37256 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!66833))))

(declare-fun b!43945 () Bool)

(declare-fun lt!66830 () (_ BitVec 64))

(assert (=> b!43945 (= e!29309 (bvsle lt!66833 (bvmul lt!66830 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43945 (or (= lt!66830 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!66830 #b0000000000000000000000000000000000000000000000000000000000001000) lt!66830)))))

(assert (=> b!43945 (= lt!66830 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!66786)))))))

(assert (= (and d!12750 res!37257) b!43944))

(assert (= (and b!43944 res!37256) b!43945))

(declare-fun m!66973 () Bool)

(assert (=> d!12750 m!66973))

(assert (=> d!12750 m!66903))

(assert (=> b!43910 d!12750))

(declare-fun d!12752 () Bool)

(assert (=> d!12752 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 thiss!1379))) ((_ sign_extend 32) (currentByte!2819 thiss!1379)) ((_ sign_extend 32) (currentBit!2814 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1004 (buf!1344 thiss!1379))) ((_ sign_extend 32) (currentByte!2819 thiss!1379)) ((_ sign_extend 32) (currentBit!2814 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3415 () Bool)

(assert (= bs!3415 d!12752))

(declare-fun m!66975 () Bool)

(assert (=> bs!3415 m!66975))

(assert (=> b!43909 d!12752))

(declare-fun d!12754 () Bool)

(assert (=> d!12754 (= (array_inv!929 srcBuffer!2) (bvsge (size!1004 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8842 d!12754))

(declare-fun d!12756 () Bool)

(assert (=> d!12756 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2814 thiss!1379) (currentByte!2819 thiss!1379) (size!1004 (buf!1344 thiss!1379))))))

(declare-fun bs!3416 () Bool)

(assert (= bs!3416 d!12756))

(declare-fun m!66977 () Bool)

(assert (=> bs!3416 m!66977))

(assert (=> start!8842 d!12756))

(declare-fun d!12758 () Bool)

(assert (=> d!12758 (= (invariant!0 (currentBit!2814 (_2!2244 lt!66786)) (currentByte!2819 (_2!2244 lt!66786)) (size!1004 (buf!1344 (_2!2244 lt!66786)))) (and (bvsge (currentBit!2814 (_2!2244 lt!66786)) #b00000000000000000000000000000000) (bvslt (currentBit!2814 (_2!2244 lt!66786)) #b00000000000000000000000000001000) (bvsge (currentByte!2819 (_2!2244 lt!66786)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2819 (_2!2244 lt!66786)) (size!1004 (buf!1344 (_2!2244 lt!66786)))) (and (= (currentBit!2814 (_2!2244 lt!66786)) #b00000000000000000000000000000000) (= (currentByte!2819 (_2!2244 lt!66786)) (size!1004 (buf!1344 (_2!2244 lt!66786))))))))))

(assert (=> b!43904 d!12758))

(declare-fun d!12760 () Bool)

(declare-fun res!37264 () Bool)

(declare-fun e!29315 () Bool)

(assert (=> d!12760 (=> (not res!37264) (not e!29315))))

(assert (=> d!12760 (= res!37264 (= (size!1004 (buf!1344 (_2!2244 lt!66789))) (size!1004 (buf!1344 (_2!2244 lt!66786)))))))

(assert (=> d!12760 (= (isPrefixOf!0 (_2!2244 lt!66789) (_2!2244 lt!66786)) e!29315)))

(declare-fun b!43952 () Bool)

(declare-fun res!37266 () Bool)

(assert (=> b!43952 (=> (not res!37266) (not e!29315))))

(assert (=> b!43952 (= res!37266 (bvsle (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!66789))) (currentByte!2819 (_2!2244 lt!66789)) (currentBit!2814 (_2!2244 lt!66789))) (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!66786))) (currentByte!2819 (_2!2244 lt!66786)) (currentBit!2814 (_2!2244 lt!66786)))))))

(declare-fun b!43953 () Bool)

(declare-fun e!29314 () Bool)

(assert (=> b!43953 (= e!29315 e!29314)))

(declare-fun res!37265 () Bool)

(assert (=> b!43953 (=> res!37265 e!29314)))

(assert (=> b!43953 (= res!37265 (= (size!1004 (buf!1344 (_2!2244 lt!66789))) #b00000000000000000000000000000000))))

(declare-fun b!43954 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2226 array!2226 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43954 (= e!29314 (arrayBitRangesEq!0 (buf!1344 (_2!2244 lt!66789)) (buf!1344 (_2!2244 lt!66786)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!66789))) (currentByte!2819 (_2!2244 lt!66789)) (currentBit!2814 (_2!2244 lt!66789)))))))

(assert (= (and d!12760 res!37264) b!43952))

(assert (= (and b!43952 res!37266) b!43953))

(assert (= (and b!43953 (not res!37265)) b!43954))

(declare-fun m!66979 () Bool)

(assert (=> b!43952 m!66979))

(assert (=> b!43952 m!66911))

(assert (=> b!43954 m!66979))

(assert (=> b!43954 m!66979))

(declare-fun m!66981 () Bool)

(assert (=> b!43954 m!66981))

(assert (=> b!43911 d!12760))

(declare-fun d!12762 () Bool)

(assert (=> d!12762 (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!66789)))) ((_ sign_extend 32) (currentByte!2819 thiss!1379)) ((_ sign_extend 32) (currentBit!2814 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!66838 () Unit!3126)

(declare-fun choose!9 (BitStream!1752 array!2226 (_ BitVec 64) BitStream!1752) Unit!3126)

(assert (=> d!12762 (= lt!66838 (choose!9 thiss!1379 (buf!1344 (_2!2244 lt!66789)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1753 (buf!1344 (_2!2244 lt!66789)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379))))))

(assert (=> d!12762 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1344 (_2!2244 lt!66789)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!66838)))

(declare-fun bs!3417 () Bool)

(assert (= bs!3417 d!12762))

(assert (=> bs!3417 m!66891))

(declare-fun m!66983 () Bool)

(assert (=> bs!3417 m!66983))

(assert (=> b!43911 d!12762))

(declare-fun d!12764 () Bool)

(assert (=> d!12764 (isPrefixOf!0 thiss!1379 (_2!2244 lt!66786))))

(declare-fun lt!66841 () Unit!3126)

(declare-fun choose!30 (BitStream!1752 BitStream!1752 BitStream!1752) Unit!3126)

(assert (=> d!12764 (= lt!66841 (choose!30 thiss!1379 (_2!2244 lt!66789) (_2!2244 lt!66786)))))

(assert (=> d!12764 (isPrefixOf!0 thiss!1379 (_2!2244 lt!66789))))

(assert (=> d!12764 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2244 lt!66789) (_2!2244 lt!66786)) lt!66841)))

(declare-fun bs!3418 () Bool)

(assert (= bs!3418 d!12764))

(assert (=> bs!3418 m!66901))

(declare-fun m!66985 () Bool)

(assert (=> bs!3418 m!66985))

(assert (=> bs!3418 m!66881))

(assert (=> b!43911 d!12764))

(declare-fun d!12766 () Bool)

(declare-fun e!29375 () Bool)

(assert (=> d!12766 e!29375))

(declare-fun res!37337 () Bool)

(assert (=> d!12766 (=> (not res!37337) (not e!29375))))

(declare-fun lt!67133 () (_ BitVec 64))

(declare-fun lt!67169 () tuple2!4302)

(assert (=> d!12766 (= res!37337 (= (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!67169))) (currentByte!2819 (_2!2244 lt!67169)) (currentBit!2814 (_2!2244 lt!67169))) (bvsub lt!67133 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12766 (or (= (bvand lt!67133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67133 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!67150 () (_ BitVec 64))

(assert (=> d!12766 (= lt!67133 (bvadd lt!67150 to!314))))

(assert (=> d!12766 (or (not (= (bvand lt!67150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!67150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!67150 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12766 (= lt!67150 (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!66789))) (currentByte!2819 (_2!2244 lt!66789)) (currentBit!2814 (_2!2244 lt!66789))))))

(declare-fun e!29376 () tuple2!4302)

(assert (=> d!12766 (= lt!67169 e!29376)))

(declare-fun c!2939 () Bool)

(assert (=> d!12766 (= c!2939 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!67130 () Unit!3126)

(declare-fun lt!67159 () Unit!3126)

(assert (=> d!12766 (= lt!67130 lt!67159)))

(assert (=> d!12766 (isPrefixOf!0 (_2!2244 lt!66789) (_2!2244 lt!66789))))

(assert (=> d!12766 (= lt!67159 (lemmaIsPrefixRefl!0 (_2!2244 lt!66789)))))

(declare-fun lt!67131 () (_ BitVec 64))

(assert (=> d!12766 (= lt!67131 (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!66789))) (currentByte!2819 (_2!2244 lt!66789)) (currentBit!2814 (_2!2244 lt!66789))))))

(assert (=> d!12766 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12766 (= (appendBitsMSBFirstLoop!0 (_2!2244 lt!66789) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!67169)))

(declare-fun b!44073 () Bool)

(declare-fun res!37338 () Bool)

(assert (=> b!44073 (=> (not res!37338) (not e!29375))))

(assert (=> b!44073 (= res!37338 (= (size!1004 (buf!1344 (_2!2244 lt!66789))) (size!1004 (buf!1344 (_2!2244 lt!67169)))))))

(declare-fun b!44074 () Bool)

(declare-fun res!37335 () Bool)

(assert (=> b!44074 (=> (not res!37335) (not e!29375))))

(assert (=> b!44074 (= res!37335 (invariant!0 (currentBit!2814 (_2!2244 lt!67169)) (currentByte!2819 (_2!2244 lt!67169)) (size!1004 (buf!1344 (_2!2244 lt!67169)))))))

(declare-fun b!44075 () Bool)

(declare-fun res!37336 () Bool)

(assert (=> b!44075 (=> (not res!37336) (not e!29375))))

(assert (=> b!44075 (= res!37336 (isPrefixOf!0 (_2!2244 lt!66789) (_2!2244 lt!67169)))))

(declare-fun lt!67156 () tuple2!4302)

(declare-fun bm!519 () Bool)

(declare-fun call!522 () tuple2!4304)

(assert (=> bm!519 (= call!522 (reader!0 (_2!2244 lt!66789) (ite c!2939 (_2!2244 lt!67156) (_2!2244 lt!66789))))))

(declare-fun b!44076 () Bool)

(declare-fun lt!67143 () tuple2!4304)

(assert (=> b!44076 (= e!29375 (= (bitStreamReadBitsIntoList!0 (_2!2244 lt!67169) (_1!2245 lt!67143) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2244 lt!67169) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!44076 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44076 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!67135 () Unit!3126)

(declare-fun lt!67151 () Unit!3126)

(assert (=> b!44076 (= lt!67135 lt!67151)))

(declare-fun lt!67138 () (_ BitVec 64))

(assert (=> b!44076 (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!67169)))) ((_ sign_extend 32) (currentByte!2819 (_2!2244 lt!66789))) ((_ sign_extend 32) (currentBit!2814 (_2!2244 lt!66789))) lt!67138)))

(assert (=> b!44076 (= lt!67151 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2244 lt!66789) (buf!1344 (_2!2244 lt!67169)) lt!67138))))

(declare-fun e!29374 () Bool)

(assert (=> b!44076 e!29374))

(declare-fun res!37340 () Bool)

(assert (=> b!44076 (=> (not res!37340) (not e!29374))))

(assert (=> b!44076 (= res!37340 (and (= (size!1004 (buf!1344 (_2!2244 lt!66789))) (size!1004 (buf!1344 (_2!2244 lt!67169)))) (bvsge lt!67138 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44076 (= lt!67138 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!44076 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44076 (= lt!67143 (reader!0 (_2!2244 lt!66789) (_2!2244 lt!67169)))))

(declare-fun b!44077 () Bool)

(declare-fun res!37339 () Bool)

(assert (=> b!44077 (=> (not res!37339) (not e!29375))))

(assert (=> b!44077 (= res!37339 (= (size!1004 (buf!1344 (_2!2244 lt!67169))) (size!1004 (buf!1344 (_2!2244 lt!66789)))))))

(declare-fun b!44078 () Bool)

(assert (=> b!44078 (= e!29374 (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!66789)))) ((_ sign_extend 32) (currentByte!2819 (_2!2244 lt!66789))) ((_ sign_extend 32) (currentBit!2814 (_2!2244 lt!66789))) lt!67138))))

(declare-fun b!44079 () Bool)

(declare-fun Unit!3134 () Unit!3126)

(assert (=> b!44079 (= e!29376 (tuple2!4303 Unit!3134 (_2!2244 lt!66789)))))

(assert (=> b!44079 (= (size!1004 (buf!1344 (_2!2244 lt!66789))) (size!1004 (buf!1344 (_2!2244 lt!66789))))))

(declare-fun lt!67139 () Unit!3126)

(declare-fun Unit!3136 () Unit!3126)

(assert (=> b!44079 (= lt!67139 Unit!3136)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1752 array!2226 array!2226 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4316 0))(
  ( (tuple2!4317 (_1!2251 array!2226) (_2!2251 BitStream!1752)) )
))
(declare-fun readBits!0 (BitStream!1752 (_ BitVec 64)) tuple2!4316)

(assert (=> b!44079 (checkByteArrayBitContent!0 (_2!2244 lt!66789) srcBuffer!2 (_1!2251 (readBits!0 (_1!2245 call!522) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!44080 () Bool)

(declare-fun Unit!3139 () Unit!3126)

(assert (=> b!44080 (= e!29376 (tuple2!4303 Unit!3139 (_2!2244 lt!67156)))))

(declare-fun lt!67141 () tuple2!4302)

(assert (=> b!44080 (= lt!67141 (appendBitFromByte!0 (_2!2244 lt!66789) (select (arr!1512 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!67132 () (_ BitVec 64))

(assert (=> b!44080 (= lt!67132 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!67162 () (_ BitVec 64))

(assert (=> b!44080 (= lt!67162 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!67158 () Unit!3126)

(assert (=> b!44080 (= lt!67158 (validateOffsetBitsIneqLemma!0 (_2!2244 lt!66789) (_2!2244 lt!67141) lt!67132 lt!67162))))

(assert (=> b!44080 (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!67141)))) ((_ sign_extend 32) (currentByte!2819 (_2!2244 lt!67141))) ((_ sign_extend 32) (currentBit!2814 (_2!2244 lt!67141))) (bvsub lt!67132 lt!67162))))

(declare-fun lt!67167 () Unit!3126)

(assert (=> b!44080 (= lt!67167 lt!67158)))

(declare-fun lt!67149 () tuple2!4304)

(assert (=> b!44080 (= lt!67149 (reader!0 (_2!2244 lt!66789) (_2!2244 lt!67141)))))

(declare-fun lt!67153 () (_ BitVec 64))

(assert (=> b!44080 (= lt!67153 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!67171 () Unit!3126)

(assert (=> b!44080 (= lt!67171 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2244 lt!66789) (buf!1344 (_2!2244 lt!67141)) lt!67153))))

(assert (=> b!44080 (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!67141)))) ((_ sign_extend 32) (currentByte!2819 (_2!2244 lt!66789))) ((_ sign_extend 32) (currentBit!2814 (_2!2244 lt!66789))) lt!67153)))

(declare-fun lt!67137 () Unit!3126)

(assert (=> b!44080 (= lt!67137 lt!67171)))

(assert (=> b!44080 (= (head!336 (byteArrayBitContentToList!0 (_2!2244 lt!67141) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!336 (bitStreamReadBitsIntoList!0 (_2!2244 lt!67141) (_1!2245 lt!67149) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!67160 () Unit!3126)

(declare-fun Unit!3140 () Unit!3126)

(assert (=> b!44080 (= lt!67160 Unit!3140)))

(assert (=> b!44080 (= lt!67156 (appendBitsMSBFirstLoop!0 (_2!2244 lt!67141) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!67144 () Unit!3126)

(assert (=> b!44080 (= lt!67144 (lemmaIsPrefixTransitive!0 (_2!2244 lt!66789) (_2!2244 lt!67141) (_2!2244 lt!67156)))))

(assert (=> b!44080 (isPrefixOf!0 (_2!2244 lt!66789) (_2!2244 lt!67156))))

(declare-fun lt!67147 () Unit!3126)

(assert (=> b!44080 (= lt!67147 lt!67144)))

(assert (=> b!44080 (= (size!1004 (buf!1344 (_2!2244 lt!67156))) (size!1004 (buf!1344 (_2!2244 lt!66789))))))

(declare-fun lt!67152 () Unit!3126)

(declare-fun Unit!3141 () Unit!3126)

(assert (=> b!44080 (= lt!67152 Unit!3141)))

(assert (=> b!44080 (= (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!67156))) (currentByte!2819 (_2!2244 lt!67156)) (currentBit!2814 (_2!2244 lt!67156))) (bvsub (bvadd (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!66789))) (currentByte!2819 (_2!2244 lt!66789)) (currentBit!2814 (_2!2244 lt!66789))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!67154 () Unit!3126)

(declare-fun Unit!3142 () Unit!3126)

(assert (=> b!44080 (= lt!67154 Unit!3142)))

(assert (=> b!44080 (= (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!67156))) (currentByte!2819 (_2!2244 lt!67156)) (currentBit!2814 (_2!2244 lt!67156))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!67141))) (currentByte!2819 (_2!2244 lt!67141)) (currentBit!2814 (_2!2244 lt!67141))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67172 () Unit!3126)

(declare-fun Unit!3143 () Unit!3126)

(assert (=> b!44080 (= lt!67172 Unit!3143)))

(declare-fun lt!67136 () tuple2!4304)

(assert (=> b!44080 (= lt!67136 call!522)))

(declare-fun lt!67165 () (_ BitVec 64))

(assert (=> b!44080 (= lt!67165 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!67164 () Unit!3126)

(assert (=> b!44080 (= lt!67164 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2244 lt!66789) (buf!1344 (_2!2244 lt!67156)) lt!67165))))

(assert (=> b!44080 (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!67156)))) ((_ sign_extend 32) (currentByte!2819 (_2!2244 lt!66789))) ((_ sign_extend 32) (currentBit!2814 (_2!2244 lt!66789))) lt!67165)))

(declare-fun lt!67166 () Unit!3126)

(assert (=> b!44080 (= lt!67166 lt!67164)))

(declare-fun lt!67157 () tuple2!4304)

(assert (=> b!44080 (= lt!67157 (reader!0 (_2!2244 lt!67141) (_2!2244 lt!67156)))))

(declare-fun lt!67170 () (_ BitVec 64))

(assert (=> b!44080 (= lt!67170 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67168 () Unit!3126)

(assert (=> b!44080 (= lt!67168 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2244 lt!67141) (buf!1344 (_2!2244 lt!67156)) lt!67170))))

(assert (=> b!44080 (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!67156)))) ((_ sign_extend 32) (currentByte!2819 (_2!2244 lt!67141))) ((_ sign_extend 32) (currentBit!2814 (_2!2244 lt!67141))) lt!67170)))

(declare-fun lt!67145 () Unit!3126)

(assert (=> b!44080 (= lt!67145 lt!67168)))

(declare-fun lt!67140 () List!517)

(assert (=> b!44080 (= lt!67140 (byteArrayBitContentToList!0 (_2!2244 lt!67156) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!67142 () List!517)

(assert (=> b!44080 (= lt!67142 (byteArrayBitContentToList!0 (_2!2244 lt!67156) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!67148 () List!517)

(assert (=> b!44080 (= lt!67148 (bitStreamReadBitsIntoList!0 (_2!2244 lt!67156) (_1!2245 lt!67136) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!67163 () List!517)

(assert (=> b!44080 (= lt!67163 (bitStreamReadBitsIntoList!0 (_2!2244 lt!67156) (_1!2245 lt!67157) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!67146 () (_ BitVec 64))

(assert (=> b!44080 (= lt!67146 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!67129 () Unit!3126)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1752 BitStream!1752 BitStream!1752 BitStream!1752 (_ BitVec 64) List!517) Unit!3126)

(assert (=> b!44080 (= lt!67129 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2244 lt!67156) (_2!2244 lt!67156) (_1!2245 lt!67136) (_1!2245 lt!67157) lt!67146 lt!67148))))

(declare-fun tail!212 (List!517) List!517)

(assert (=> b!44080 (= (bitStreamReadBitsIntoList!0 (_2!2244 lt!67156) (_1!2245 lt!67157) (bvsub lt!67146 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!212 lt!67148))))

(declare-fun lt!67155 () Unit!3126)

(assert (=> b!44080 (= lt!67155 lt!67129)))

(declare-fun lt!67134 () Unit!3126)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2226 array!2226 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3126)

(assert (=> b!44080 (= lt!67134 (arrayBitRangesEqImpliesEq!0 (buf!1344 (_2!2244 lt!67141)) (buf!1344 (_2!2244 lt!67156)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!67131 (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!67141))) (currentByte!2819 (_2!2244 lt!67141)) (currentBit!2814 (_2!2244 lt!67141)))))))

(declare-fun bitAt!0 (array!2226 (_ BitVec 64)) Bool)

(assert (=> b!44080 (= (bitAt!0 (buf!1344 (_2!2244 lt!67141)) lt!67131) (bitAt!0 (buf!1344 (_2!2244 lt!67156)) lt!67131))))

(declare-fun lt!67161 () Unit!3126)

(assert (=> b!44080 (= lt!67161 lt!67134)))

(assert (= (and d!12766 c!2939) b!44080))

(assert (= (and d!12766 (not c!2939)) b!44079))

(assert (= (or b!44080 b!44079) bm!519))

(assert (= (and d!12766 res!37337) b!44074))

(assert (= (and b!44074 res!37335) b!44073))

(assert (= (and b!44073 res!37338) b!44075))

(assert (= (and b!44075 res!37336) b!44077))

(assert (= (and b!44077 res!37339) b!44076))

(assert (= (and b!44076 res!37340) b!44078))

(declare-fun m!67067 () Bool)

(assert (=> b!44078 m!67067))

(declare-fun m!67069 () Bool)

(assert (=> bm!519 m!67069))

(declare-fun m!67071 () Bool)

(assert (=> b!44079 m!67071))

(declare-fun m!67073 () Bool)

(assert (=> b!44079 m!67073))

(declare-fun m!67075 () Bool)

(assert (=> b!44074 m!67075))

(declare-fun m!67077 () Bool)

(assert (=> b!44075 m!67077))

(declare-fun m!67079 () Bool)

(assert (=> d!12766 m!67079))

(assert (=> d!12766 m!66979))

(declare-fun m!67081 () Bool)

(assert (=> d!12766 m!67081))

(declare-fun m!67083 () Bool)

(assert (=> d!12766 m!67083))

(declare-fun m!67085 () Bool)

(assert (=> b!44080 m!67085))

(declare-fun m!67087 () Bool)

(assert (=> b!44080 m!67087))

(declare-fun m!67089 () Bool)

(assert (=> b!44080 m!67089))

(declare-fun m!67091 () Bool)

(assert (=> b!44080 m!67091))

(declare-fun m!67093 () Bool)

(assert (=> b!44080 m!67093))

(declare-fun m!67095 () Bool)

(assert (=> b!44080 m!67095))

(declare-fun m!67097 () Bool)

(assert (=> b!44080 m!67097))

(declare-fun m!67099 () Bool)

(assert (=> b!44080 m!67099))

(declare-fun m!67101 () Bool)

(assert (=> b!44080 m!67101))

(declare-fun m!67103 () Bool)

(assert (=> b!44080 m!67103))

(assert (=> b!44080 m!67101))

(declare-fun m!67105 () Bool)

(assert (=> b!44080 m!67105))

(declare-fun m!67107 () Bool)

(assert (=> b!44080 m!67107))

(declare-fun m!67109 () Bool)

(assert (=> b!44080 m!67109))

(declare-fun m!67111 () Bool)

(assert (=> b!44080 m!67111))

(declare-fun m!67113 () Bool)

(assert (=> b!44080 m!67113))

(declare-fun m!67115 () Bool)

(assert (=> b!44080 m!67115))

(declare-fun m!67117 () Bool)

(assert (=> b!44080 m!67117))

(declare-fun m!67119 () Bool)

(assert (=> b!44080 m!67119))

(declare-fun m!67121 () Bool)

(assert (=> b!44080 m!67121))

(declare-fun m!67123 () Bool)

(assert (=> b!44080 m!67123))

(declare-fun m!67125 () Bool)

(assert (=> b!44080 m!67125))

(declare-fun m!67127 () Bool)

(assert (=> b!44080 m!67127))

(declare-fun m!67129 () Bool)

(assert (=> b!44080 m!67129))

(assert (=> b!44080 m!67113))

(declare-fun m!67131 () Bool)

(assert (=> b!44080 m!67131))

(declare-fun m!67133 () Bool)

(assert (=> b!44080 m!67133))

(declare-fun m!67135 () Bool)

(assert (=> b!44080 m!67135))

(assert (=> b!44080 m!66979))

(assert (=> b!44080 m!67121))

(declare-fun m!67137 () Bool)

(assert (=> b!44080 m!67137))

(declare-fun m!67139 () Bool)

(assert (=> b!44080 m!67139))

(assert (=> b!44080 m!67109))

(declare-fun m!67141 () Bool)

(assert (=> b!44080 m!67141))

(declare-fun m!67143 () Bool)

(assert (=> b!44080 m!67143))

(declare-fun m!67145 () Bool)

(assert (=> b!44080 m!67145))

(declare-fun m!67147 () Bool)

(assert (=> b!44076 m!67147))

(declare-fun m!67149 () Bool)

(assert (=> b!44076 m!67149))

(declare-fun m!67151 () Bool)

(assert (=> b!44076 m!67151))

(declare-fun m!67153 () Bool)

(assert (=> b!44076 m!67153))

(declare-fun m!67155 () Bool)

(assert (=> b!44076 m!67155))

(assert (=> b!43911 d!12766))

(declare-fun d!12824 () Bool)

(assert (=> d!12824 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!66789)))) ((_ sign_extend 32) (currentByte!2819 thiss!1379)) ((_ sign_extend 32) (currentBit!2814 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!66789)))) ((_ sign_extend 32) (currentByte!2819 thiss!1379)) ((_ sign_extend 32) (currentBit!2814 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3427 () Bool)

(assert (= bs!3427 d!12824))

(declare-fun m!67157 () Bool)

(assert (=> bs!3427 m!67157))

(assert (=> b!43911 d!12824))

(declare-fun b!44109 () Bool)

(declare-fun e!29388 () Unit!3126)

(declare-fun lt!67309 () Unit!3126)

(assert (=> b!44109 (= e!29388 lt!67309)))

(declare-fun lt!67302 () (_ BitVec 64))

(assert (=> b!44109 (= lt!67302 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67307 () (_ BitVec 64))

(assert (=> b!44109 (= lt!67307 (bitIndex!0 (size!1004 (buf!1344 thiss!1379)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2226 array!2226 (_ BitVec 64) (_ BitVec 64)) Unit!3126)

(assert (=> b!44109 (= lt!67309 (arrayBitRangesEqSymmetric!0 (buf!1344 thiss!1379) (buf!1344 (_2!2244 lt!66789)) lt!67302 lt!67307))))

(assert (=> b!44109 (arrayBitRangesEq!0 (buf!1344 (_2!2244 lt!66789)) (buf!1344 thiss!1379) lt!67302 lt!67307)))

(declare-fun b!44110 () Bool)

(declare-fun res!37360 () Bool)

(declare-fun e!29389 () Bool)

(assert (=> b!44110 (=> (not res!37360) (not e!29389))))

(declare-fun lt!67312 () tuple2!4304)

(assert (=> b!44110 (= res!37360 (isPrefixOf!0 (_1!2245 lt!67312) thiss!1379))))

(declare-fun d!12826 () Bool)

(assert (=> d!12826 e!29389))

(declare-fun res!37359 () Bool)

(assert (=> d!12826 (=> (not res!37359) (not e!29389))))

(assert (=> d!12826 (= res!37359 (isPrefixOf!0 (_1!2245 lt!67312) (_2!2245 lt!67312)))))

(declare-fun lt!67313 () BitStream!1752)

(assert (=> d!12826 (= lt!67312 (tuple2!4305 lt!67313 (_2!2244 lt!66789)))))

(declare-fun lt!67304 () Unit!3126)

(declare-fun lt!67315 () Unit!3126)

(assert (=> d!12826 (= lt!67304 lt!67315)))

(assert (=> d!12826 (isPrefixOf!0 lt!67313 (_2!2244 lt!66789))))

(assert (=> d!12826 (= lt!67315 (lemmaIsPrefixTransitive!0 lt!67313 (_2!2244 lt!66789) (_2!2244 lt!66789)))))

(declare-fun lt!67318 () Unit!3126)

(declare-fun lt!67319 () Unit!3126)

(assert (=> d!12826 (= lt!67318 lt!67319)))

(assert (=> d!12826 (isPrefixOf!0 lt!67313 (_2!2244 lt!66789))))

(assert (=> d!12826 (= lt!67319 (lemmaIsPrefixTransitive!0 lt!67313 thiss!1379 (_2!2244 lt!66789)))))

(declare-fun lt!67305 () Unit!3126)

(assert (=> d!12826 (= lt!67305 e!29388)))

(declare-fun c!2945 () Bool)

(assert (=> d!12826 (= c!2945 (not (= (size!1004 (buf!1344 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!67308 () Unit!3126)

(declare-fun lt!67310 () Unit!3126)

(assert (=> d!12826 (= lt!67308 lt!67310)))

(assert (=> d!12826 (isPrefixOf!0 (_2!2244 lt!66789) (_2!2244 lt!66789))))

(assert (=> d!12826 (= lt!67310 (lemmaIsPrefixRefl!0 (_2!2244 lt!66789)))))

(declare-fun lt!67316 () Unit!3126)

(declare-fun lt!67300 () Unit!3126)

(assert (=> d!12826 (= lt!67316 lt!67300)))

(assert (=> d!12826 (= lt!67300 (lemmaIsPrefixRefl!0 (_2!2244 lt!66789)))))

(declare-fun lt!67314 () Unit!3126)

(declare-fun lt!67301 () Unit!3126)

(assert (=> d!12826 (= lt!67314 lt!67301)))

(assert (=> d!12826 (isPrefixOf!0 lt!67313 lt!67313)))

(assert (=> d!12826 (= lt!67301 (lemmaIsPrefixRefl!0 lt!67313))))

(declare-fun lt!67311 () Unit!3126)

(declare-fun lt!67306 () Unit!3126)

(assert (=> d!12826 (= lt!67311 lt!67306)))

(assert (=> d!12826 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12826 (= lt!67306 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12826 (= lt!67313 (BitStream!1753 (buf!1344 (_2!2244 lt!66789)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379)))))

(assert (=> d!12826 (isPrefixOf!0 thiss!1379 (_2!2244 lt!66789))))

(assert (=> d!12826 (= (reader!0 thiss!1379 (_2!2244 lt!66789)) lt!67312)))

(declare-fun b!44111 () Bool)

(declare-fun Unit!3146 () Unit!3126)

(assert (=> b!44111 (= e!29388 Unit!3146)))

(declare-fun b!44112 () Bool)

(declare-fun lt!67317 () (_ BitVec 64))

(declare-fun lt!67303 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1752 (_ BitVec 64)) BitStream!1752)

(assert (=> b!44112 (= e!29389 (= (_1!2245 lt!67312) (withMovedBitIndex!0 (_2!2245 lt!67312) (bvsub lt!67317 lt!67303))))))

(assert (=> b!44112 (or (= (bvand lt!67317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67317 lt!67303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44112 (= lt!67303 (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!66789))) (currentByte!2819 (_2!2244 lt!66789)) (currentBit!2814 (_2!2244 lt!66789))))))

(assert (=> b!44112 (= lt!67317 (bitIndex!0 (size!1004 (buf!1344 thiss!1379)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379)))))

(declare-fun b!44113 () Bool)

(declare-fun res!37361 () Bool)

(assert (=> b!44113 (=> (not res!37361) (not e!29389))))

(assert (=> b!44113 (= res!37361 (isPrefixOf!0 (_2!2245 lt!67312) (_2!2244 lt!66789)))))

(assert (= (and d!12826 c!2945) b!44109))

(assert (= (and d!12826 (not c!2945)) b!44111))

(assert (= (and d!12826 res!37359) b!44110))

(assert (= (and b!44110 res!37360) b!44113))

(assert (= (and b!44113 res!37361) b!44112))

(declare-fun m!67253 () Bool)

(assert (=> b!44112 m!67253))

(assert (=> b!44112 m!66979))

(assert (=> b!44112 m!66909))

(declare-fun m!67255 () Bool)

(assert (=> b!44110 m!67255))

(declare-fun m!67257 () Bool)

(assert (=> d!12826 m!67257))

(assert (=> d!12826 m!66907))

(declare-fun m!67259 () Bool)

(assert (=> d!12826 m!67259))

(declare-fun m!67261 () Bool)

(assert (=> d!12826 m!67261))

(declare-fun m!67263 () Bool)

(assert (=> d!12826 m!67263))

(assert (=> d!12826 m!66905))

(assert (=> d!12826 m!67081))

(assert (=> d!12826 m!66881))

(declare-fun m!67265 () Bool)

(assert (=> d!12826 m!67265))

(declare-fun m!67267 () Bool)

(assert (=> d!12826 m!67267))

(assert (=> d!12826 m!67083))

(declare-fun m!67269 () Bool)

(assert (=> b!44113 m!67269))

(assert (=> b!44109 m!66909))

(declare-fun m!67271 () Bool)

(assert (=> b!44109 m!67271))

(declare-fun m!67273 () Bool)

(assert (=> b!44109 m!67273))

(assert (=> b!43911 d!12826))

(declare-fun d!12834 () Bool)

(declare-fun res!37362 () Bool)

(declare-fun e!29391 () Bool)

(assert (=> d!12834 (=> (not res!37362) (not e!29391))))

(assert (=> d!12834 (= res!37362 (= (size!1004 (buf!1344 thiss!1379)) (size!1004 (buf!1344 (_2!2244 lt!66786)))))))

(assert (=> d!12834 (= (isPrefixOf!0 thiss!1379 (_2!2244 lt!66786)) e!29391)))

(declare-fun b!44114 () Bool)

(declare-fun res!37364 () Bool)

(assert (=> b!44114 (=> (not res!37364) (not e!29391))))

(assert (=> b!44114 (= res!37364 (bvsle (bitIndex!0 (size!1004 (buf!1344 thiss!1379)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379)) (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!66786))) (currentByte!2819 (_2!2244 lt!66786)) (currentBit!2814 (_2!2244 lt!66786)))))))

(declare-fun b!44115 () Bool)

(declare-fun e!29390 () Bool)

(assert (=> b!44115 (= e!29391 e!29390)))

(declare-fun res!37363 () Bool)

(assert (=> b!44115 (=> res!37363 e!29390)))

(assert (=> b!44115 (= res!37363 (= (size!1004 (buf!1344 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44116 () Bool)

(assert (=> b!44116 (= e!29390 (arrayBitRangesEq!0 (buf!1344 thiss!1379) (buf!1344 (_2!2244 lt!66786)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1004 (buf!1344 thiss!1379)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379))))))

(assert (= (and d!12834 res!37362) b!44114))

(assert (= (and b!44114 res!37364) b!44115))

(assert (= (and b!44115 (not res!37363)) b!44116))

(assert (=> b!44114 m!66909))

(assert (=> b!44114 m!66911))

(assert (=> b!44116 m!66909))

(assert (=> b!44116 m!66909))

(declare-fun m!67275 () Bool)

(assert (=> b!44116 m!67275))

(assert (=> b!43911 d!12834))

(declare-fun d!12836 () Bool)

(assert (=> d!12836 (= (array_inv!929 (buf!1344 thiss!1379)) (bvsge (size!1004 (buf!1344 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!43906 d!12836))

(declare-fun d!12838 () Bool)

(declare-fun res!37365 () Bool)

(declare-fun e!29393 () Bool)

(assert (=> d!12838 (=> (not res!37365) (not e!29393))))

(assert (=> d!12838 (= res!37365 (= (size!1004 (buf!1344 thiss!1379)) (size!1004 (buf!1344 (_2!2244 lt!66789)))))))

(assert (=> d!12838 (= (isPrefixOf!0 thiss!1379 (_2!2244 lt!66789)) e!29393)))

(declare-fun b!44117 () Bool)

(declare-fun res!37367 () Bool)

(assert (=> b!44117 (=> (not res!37367) (not e!29393))))

(assert (=> b!44117 (= res!37367 (bvsle (bitIndex!0 (size!1004 (buf!1344 thiss!1379)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379)) (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!66789))) (currentByte!2819 (_2!2244 lt!66789)) (currentBit!2814 (_2!2244 lt!66789)))))))

(declare-fun b!44118 () Bool)

(declare-fun e!29392 () Bool)

(assert (=> b!44118 (= e!29393 e!29392)))

(declare-fun res!37366 () Bool)

(assert (=> b!44118 (=> res!37366 e!29392)))

(assert (=> b!44118 (= res!37366 (= (size!1004 (buf!1344 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44119 () Bool)

(assert (=> b!44119 (= e!29392 (arrayBitRangesEq!0 (buf!1344 thiss!1379) (buf!1344 (_2!2244 lt!66789)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1004 (buf!1344 thiss!1379)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379))))))

(assert (= (and d!12838 res!37365) b!44117))

(assert (= (and b!44117 res!37367) b!44118))

(assert (= (and b!44118 (not res!37366)) b!44119))

(assert (=> b!44117 m!66909))

(assert (=> b!44117 m!66979))

(assert (=> b!44119 m!66909))

(assert (=> b!44119 m!66909))

(declare-fun m!67277 () Bool)

(assert (=> b!44119 m!67277))

(assert (=> b!43905 d!12838))

(declare-fun d!12840 () Bool)

(assert (=> d!12840 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!66789)))) ((_ sign_extend 32) (currentByte!2819 (_2!2244 lt!66789))) ((_ sign_extend 32) (currentBit!2814 (_2!2244 lt!66789))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!66789)))) ((_ sign_extend 32) (currentByte!2819 (_2!2244 lt!66789))) ((_ sign_extend 32) (currentBit!2814 (_2!2244 lt!66789)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3430 () Bool)

(assert (= bs!3430 d!12840))

(declare-fun m!67279 () Bool)

(assert (=> bs!3430 m!67279))

(assert (=> b!43905 d!12840))

(declare-fun d!12842 () Bool)

(declare-fun e!29400 () Bool)

(assert (=> d!12842 e!29400))

(declare-fun res!37373 () Bool)

(assert (=> d!12842 (=> (not res!37373) (not e!29400))))

(assert (=> d!12842 (= res!37373 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!67373 () Unit!3126)

(declare-fun choose!27 (BitStream!1752 BitStream!1752 (_ BitVec 64) (_ BitVec 64)) Unit!3126)

(assert (=> d!12842 (= lt!67373 (choose!27 thiss!1379 (_2!2244 lt!66789) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12842 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12842 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2244 lt!66789) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!67373)))

(declare-fun b!44131 () Bool)

(assert (=> b!44131 (= e!29400 (validate_offset_bits!1 ((_ sign_extend 32) (size!1004 (buf!1344 (_2!2244 lt!66789)))) ((_ sign_extend 32) (currentByte!2819 (_2!2244 lt!66789))) ((_ sign_extend 32) (currentBit!2814 (_2!2244 lt!66789))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12842 res!37373) b!44131))

(declare-fun m!67305 () Bool)

(assert (=> d!12842 m!67305))

(assert (=> b!44131 m!66875))

(assert (=> b!43905 d!12842))

(declare-fun b!44192 () Bool)

(declare-fun e!29435 () Bool)

(declare-datatypes ((tuple2!4322 0))(
  ( (tuple2!4323 (_1!2254 BitStream!1752) (_2!2254 Bool)) )
))
(declare-fun lt!67541 () tuple2!4322)

(declare-fun lt!67545 () tuple2!4302)

(assert (=> b!44192 (= e!29435 (= (bitIndex!0 (size!1004 (buf!1344 (_1!2254 lt!67541))) (currentByte!2819 (_1!2254 lt!67541)) (currentBit!2814 (_1!2254 lt!67541))) (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!67545))) (currentByte!2819 (_2!2244 lt!67545)) (currentBit!2814 (_2!2244 lt!67545)))))))

(declare-fun b!44193 () Bool)

(declare-fun res!37438 () Bool)

(declare-fun e!29432 () Bool)

(assert (=> b!44193 (=> (not res!37438) (not e!29432))))

(assert (=> b!44193 (= res!37438 (= (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!67545))) (currentByte!2819 (_2!2244 lt!67545)) (currentBit!2814 (_2!2244 lt!67545))) (bvadd (bitIndex!0 (size!1004 (buf!1344 thiss!1379)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!44194 () Bool)

(declare-fun e!29433 () Bool)

(declare-fun lt!67546 () tuple2!4322)

(declare-fun lt!67544 () tuple2!4302)

(assert (=> b!44194 (= e!29433 (= (bitIndex!0 (size!1004 (buf!1344 (_1!2254 lt!67546))) (currentByte!2819 (_1!2254 lt!67546)) (currentBit!2814 (_1!2254 lt!67546))) (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!67544))) (currentByte!2819 (_2!2244 lt!67544)) (currentBit!2814 (_2!2244 lt!67544)))))))

(declare-fun b!44195 () Bool)

(declare-fun res!37436 () Bool)

(declare-fun e!29434 () Bool)

(assert (=> b!44195 (=> (not res!37436) (not e!29434))))

(declare-fun lt!67539 () (_ BitVec 64))

(declare-fun lt!67535 () (_ BitVec 64))

(assert (=> b!44195 (= res!37436 (= (bitIndex!0 (size!1004 (buf!1344 (_2!2244 lt!67544))) (currentByte!2819 (_2!2244 lt!67544)) (currentBit!2814 (_2!2244 lt!67544))) (bvadd lt!67539 lt!67535)))))

(assert (=> b!44195 (or (not (= (bvand lt!67539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!67539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!67539 lt!67535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44195 (= lt!67535 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!44195 (= lt!67539 (bitIndex!0 (size!1004 (buf!1344 thiss!1379)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379)))))

(declare-fun b!44196 () Bool)

(assert (=> b!44196 (= e!29432 e!29435)))

(declare-fun res!37437 () Bool)

(assert (=> b!44196 (=> (not res!37437) (not e!29435))))

(declare-fun lt!67536 () Bool)

(assert (=> b!44196 (= res!37437 (and (= (_2!2254 lt!67541) lt!67536) (= (_1!2254 lt!67541) (_2!2244 lt!67545))))))

(declare-fun readBitPure!0 (BitStream!1752) tuple2!4322)

(declare-fun readerFrom!0 (BitStream!1752 (_ BitVec 32) (_ BitVec 32)) BitStream!1752)

(assert (=> b!44196 (= lt!67541 (readBitPure!0 (readerFrom!0 (_2!2244 lt!67545) (currentBit!2814 thiss!1379) (currentByte!2819 thiss!1379))))))

(declare-fun b!44197 () Bool)

(assert (=> b!44197 (= e!29434 e!29433)))

(declare-fun res!37434 () Bool)

(assert (=> b!44197 (=> (not res!37434) (not e!29433))))

(declare-fun lt!67540 () (_ BitVec 8))

(assert (=> b!44197 (= res!37434 (and (= (_2!2254 lt!67546) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1512 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!67540)) #b00000000000000000000000000000000))) (= (_1!2254 lt!67546) (_2!2244 lt!67544))))))

(declare-fun lt!67538 () tuple2!4316)

(declare-fun lt!67537 () BitStream!1752)

(assert (=> b!44197 (= lt!67538 (readBits!0 lt!67537 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!44197 (= lt!67546 (readBitPure!0 lt!67537))))

(assert (=> b!44197 (= lt!67537 (readerFrom!0 (_2!2244 lt!67544) (currentBit!2814 thiss!1379) (currentByte!2819 thiss!1379)))))

(declare-fun b!44198 () Bool)

(declare-fun res!37431 () Bool)

(assert (=> b!44198 (=> (not res!37431) (not e!29434))))

(assert (=> b!44198 (= res!37431 (isPrefixOf!0 thiss!1379 (_2!2244 lt!67544)))))

(declare-fun d!12850 () Bool)

(assert (=> d!12850 e!29434))

(declare-fun res!37433 () Bool)

(assert (=> d!12850 (=> (not res!37433) (not e!29434))))

(assert (=> d!12850 (= res!37433 (= (size!1004 (buf!1344 (_2!2244 lt!67544))) (size!1004 (buf!1344 thiss!1379))))))

(declare-fun lt!67542 () array!2226)

(assert (=> d!12850 (= lt!67540 (select (arr!1512 lt!67542) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12850 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1004 lt!67542)))))

(assert (=> d!12850 (= lt!67542 (array!2227 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!67543 () tuple2!4302)

(assert (=> d!12850 (= lt!67544 (tuple2!4303 (_1!2244 lt!67543) (_2!2244 lt!67543)))))

(assert (=> d!12850 (= lt!67543 lt!67545)))

(assert (=> d!12850 e!29432))

(declare-fun res!37435 () Bool)

(assert (=> d!12850 (=> (not res!37435) (not e!29432))))

(assert (=> d!12850 (= res!37435 (= (size!1004 (buf!1344 thiss!1379)) (size!1004 (buf!1344 (_2!2244 lt!67545)))))))

(declare-fun appendBit!0 (BitStream!1752 Bool) tuple2!4302)

(assert (=> d!12850 (= lt!67545 (appendBit!0 thiss!1379 lt!67536))))

(assert (=> d!12850 (= lt!67536 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1512 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12850 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12850 (= (appendBitFromByte!0 thiss!1379 (select (arr!1512 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!67544)))

(declare-fun b!44199 () Bool)

(declare-fun res!37432 () Bool)

(assert (=> b!44199 (=> (not res!37432) (not e!29432))))

(assert (=> b!44199 (= res!37432 (isPrefixOf!0 thiss!1379 (_2!2244 lt!67545)))))

(assert (= (and d!12850 res!37435) b!44193))

(assert (= (and b!44193 res!37438) b!44199))

(assert (= (and b!44199 res!37432) b!44196))

(assert (= (and b!44196 res!37437) b!44192))

(assert (= (and d!12850 res!37433) b!44195))

(assert (= (and b!44195 res!37436) b!44198))

(assert (= (and b!44198 res!37431) b!44197))

(assert (= (and b!44197 res!37434) b!44194))

(declare-fun m!67413 () Bool)

(assert (=> b!44192 m!67413))

(declare-fun m!67415 () Bool)

(assert (=> b!44192 m!67415))

(declare-fun m!67417 () Bool)

(assert (=> d!12850 m!67417))

(declare-fun m!67419 () Bool)

(assert (=> d!12850 m!67419))

(declare-fun m!67421 () Bool)

(assert (=> d!12850 m!67421))

(declare-fun m!67423 () Bool)

(assert (=> b!44194 m!67423))

(declare-fun m!67425 () Bool)

(assert (=> b!44194 m!67425))

(declare-fun m!67427 () Bool)

(assert (=> b!44197 m!67427))

(declare-fun m!67429 () Bool)

(assert (=> b!44197 m!67429))

(declare-fun m!67431 () Bool)

(assert (=> b!44197 m!67431))

(declare-fun m!67433 () Bool)

(assert (=> b!44198 m!67433))

(assert (=> b!44195 m!67425))

(assert (=> b!44195 m!66909))

(declare-fun m!67435 () Bool)

(assert (=> b!44196 m!67435))

(assert (=> b!44196 m!67435))

(declare-fun m!67437 () Bool)

(assert (=> b!44196 m!67437))

(declare-fun m!67439 () Bool)

(assert (=> b!44199 m!67439))

(assert (=> b!44193 m!67415))

(assert (=> b!44193 m!66909))

(assert (=> b!43905 d!12850))

(declare-fun d!12880 () Bool)

(assert (=> d!12880 (= (head!336 (byteArrayBitContentToList!0 (_2!2244 lt!66789) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!632 (byteArrayBitContentToList!0 (_2!2244 lt!66789) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43907 d!12880))

(declare-fun d!12882 () Bool)

(declare-fun c!2952 () Bool)

(assert (=> d!12882 (= c!2952 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!29446 () List!517)

(assert (=> d!12882 (= (byteArrayBitContentToList!0 (_2!2244 lt!66789) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!29446)))

(declare-fun b!44221 () Bool)

(assert (=> b!44221 (= e!29446 Nil!514)))

(declare-fun b!44222 () Bool)

(assert (=> b!44222 (= e!29446 (Cons!513 (not (= (bvand ((_ sign_extend 24) (select (arr!1512 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2244 lt!66789) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!12882 c!2952) b!44221))

(assert (= (and d!12882 (not c!2952)) b!44222))

(assert (=> b!44222 m!66879))

(assert (=> b!44222 m!67421))

(declare-fun m!67441 () Bool)

(assert (=> b!44222 m!67441))

(assert (=> b!43907 d!12882))

(declare-fun d!12884 () Bool)

(assert (=> d!12884 (= (head!336 (bitStreamReadBitsIntoList!0 (_2!2244 lt!66789) (_1!2245 lt!66790) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!632 (bitStreamReadBitsIntoList!0 (_2!2244 lt!66789) (_1!2245 lt!66790) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43907 d!12884))

(declare-fun b!44256 () Bool)

(declare-datatypes ((tuple2!4328 0))(
  ( (tuple2!4329 (_1!2257 List!517) (_2!2257 BitStream!1752)) )
))
(declare-fun e!29464 () tuple2!4328)

(assert (=> b!44256 (= e!29464 (tuple2!4329 Nil!514 (_1!2245 lt!66790)))))

(declare-fun b!44259 () Bool)

(declare-fun e!29463 () Bool)

(declare-fun lt!67615 () List!517)

(declare-fun length!222 (List!517) Int)

(assert (=> b!44259 (= e!29463 (> (length!222 lt!67615) 0))))

(declare-fun b!44258 () Bool)

(declare-fun isEmpty!124 (List!517) Bool)

(assert (=> b!44258 (= e!29463 (isEmpty!124 lt!67615))))

(declare-fun b!44257 () Bool)

(declare-fun lt!67614 () (_ BitVec 64))

(declare-datatypes ((tuple2!4330 0))(
  ( (tuple2!4331 (_1!2258 Bool) (_2!2258 BitStream!1752)) )
))
(declare-fun lt!67613 () tuple2!4330)

(assert (=> b!44257 (= e!29464 (tuple2!4329 (Cons!513 (_1!2258 lt!67613) (bitStreamReadBitsIntoList!0 (_2!2244 lt!66789) (_2!2258 lt!67613) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!67614))) (_2!2258 lt!67613)))))

(declare-fun readBit!0 (BitStream!1752) tuple2!4330)

(assert (=> b!44257 (= lt!67613 (readBit!0 (_1!2245 lt!66790)))))

(assert (=> b!44257 (= lt!67614 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!12886 () Bool)

(assert (=> d!12886 e!29463))

(declare-fun c!2958 () Bool)

(assert (=> d!12886 (= c!2958 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12886 (= lt!67615 (_1!2257 e!29464))))

(declare-fun c!2957 () Bool)

(assert (=> d!12886 (= c!2957 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12886 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12886 (= (bitStreamReadBitsIntoList!0 (_2!2244 lt!66789) (_1!2245 lt!66790) #b0000000000000000000000000000000000000000000000000000000000000001) lt!67615)))

(assert (= (and d!12886 c!2957) b!44256))

(assert (= (and d!12886 (not c!2957)) b!44257))

(assert (= (and d!12886 c!2958) b!44258))

(assert (= (and d!12886 (not c!2958)) b!44259))

(declare-fun m!67469 () Bool)

(assert (=> b!44259 m!67469))

(declare-fun m!67471 () Bool)

(assert (=> b!44258 m!67471))

(declare-fun m!67473 () Bool)

(assert (=> b!44257 m!67473))

(declare-fun m!67475 () Bool)

(assert (=> b!44257 m!67475))

(assert (=> b!43907 d!12886))

(declare-fun d!12888 () Bool)

(declare-fun res!37479 () Bool)

(declare-fun e!29466 () Bool)

(assert (=> d!12888 (=> (not res!37479) (not e!29466))))

(assert (=> d!12888 (= res!37479 (= (size!1004 (buf!1344 thiss!1379)) (size!1004 (buf!1344 thiss!1379))))))

(assert (=> d!12888 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!29466)))

(declare-fun b!44260 () Bool)

(declare-fun res!37481 () Bool)

(assert (=> b!44260 (=> (not res!37481) (not e!29466))))

(assert (=> b!44260 (= res!37481 (bvsle (bitIndex!0 (size!1004 (buf!1344 thiss!1379)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379)) (bitIndex!0 (size!1004 (buf!1344 thiss!1379)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379))))))

(declare-fun b!44261 () Bool)

(declare-fun e!29465 () Bool)

(assert (=> b!44261 (= e!29466 e!29465)))

(declare-fun res!37480 () Bool)

(assert (=> b!44261 (=> res!37480 e!29465)))

(assert (=> b!44261 (= res!37480 (= (size!1004 (buf!1344 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44262 () Bool)

(assert (=> b!44262 (= e!29465 (arrayBitRangesEq!0 (buf!1344 thiss!1379) (buf!1344 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1004 (buf!1344 thiss!1379)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379))))))

(assert (= (and d!12888 res!37479) b!44260))

(assert (= (and b!44260 res!37481) b!44261))

(assert (= (and b!44261 (not res!37480)) b!44262))

(assert (=> b!44260 m!66909))

(assert (=> b!44260 m!66909))

(assert (=> b!44262 m!66909))

(assert (=> b!44262 m!66909))

(declare-fun m!67477 () Bool)

(assert (=> b!44262 m!67477))

(assert (=> b!43912 d!12888))

(declare-fun d!12890 () Bool)

(assert (=> d!12890 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!67618 () Unit!3126)

(declare-fun choose!11 (BitStream!1752) Unit!3126)

(assert (=> d!12890 (= lt!67618 (choose!11 thiss!1379))))

(assert (=> d!12890 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!67618)))

(declare-fun bs!3438 () Bool)

(assert (= bs!3438 d!12890))

(assert (=> bs!3438 m!66905))

(declare-fun m!67479 () Bool)

(assert (=> bs!3438 m!67479))

(assert (=> b!43912 d!12890))

(declare-fun d!12892 () Bool)

(declare-fun e!29467 () Bool)

(assert (=> d!12892 e!29467))

(declare-fun res!37483 () Bool)

(assert (=> d!12892 (=> (not res!37483) (not e!29467))))

(declare-fun lt!67623 () (_ BitVec 64))

(declare-fun lt!67622 () (_ BitVec 64))

(declare-fun lt!67620 () (_ BitVec 64))

(assert (=> d!12892 (= res!37483 (= lt!67622 (bvsub lt!67623 lt!67620)))))

(assert (=> d!12892 (or (= (bvand lt!67623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67620 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67623 lt!67620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12892 (= lt!67620 (remainingBits!0 ((_ sign_extend 32) (size!1004 (buf!1344 thiss!1379))) ((_ sign_extend 32) (currentByte!2819 thiss!1379)) ((_ sign_extend 32) (currentBit!2814 thiss!1379))))))

(declare-fun lt!67624 () (_ BitVec 64))

(declare-fun lt!67621 () (_ BitVec 64))

(assert (=> d!12892 (= lt!67623 (bvmul lt!67624 lt!67621))))

(assert (=> d!12892 (or (= lt!67624 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!67621 (bvsdiv (bvmul lt!67624 lt!67621) lt!67624)))))

(assert (=> d!12892 (= lt!67621 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12892 (= lt!67624 ((_ sign_extend 32) (size!1004 (buf!1344 thiss!1379))))))

(assert (=> d!12892 (= lt!67622 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2819 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2814 thiss!1379))))))

(assert (=> d!12892 (invariant!0 (currentBit!2814 thiss!1379) (currentByte!2819 thiss!1379) (size!1004 (buf!1344 thiss!1379)))))

(assert (=> d!12892 (= (bitIndex!0 (size!1004 (buf!1344 thiss!1379)) (currentByte!2819 thiss!1379) (currentBit!2814 thiss!1379)) lt!67622)))

(declare-fun b!44263 () Bool)

(declare-fun res!37482 () Bool)

(assert (=> b!44263 (=> (not res!37482) (not e!29467))))

(assert (=> b!44263 (= res!37482 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!67622))))

(declare-fun b!44264 () Bool)

(declare-fun lt!67619 () (_ BitVec 64))

(assert (=> b!44264 (= e!29467 (bvsle lt!67622 (bvmul lt!67619 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44264 (or (= lt!67619 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!67619 #b0000000000000000000000000000000000000000000000000000000000001000) lt!67619)))))

(assert (=> b!44264 (= lt!67619 ((_ sign_extend 32) (size!1004 (buf!1344 thiss!1379))))))

(assert (= (and d!12892 res!37483) b!44263))

(assert (= (and b!44263 res!37482) b!44264))

(assert (=> d!12892 m!66975))

(assert (=> d!12892 m!66977))

(assert (=> b!43912 d!12892))

(check-sat (not b!44195) (not d!12892) (not d!12756) (not b!43952) (not b!44192) (not b!44074) (not d!12840) (not b!44198) (not d!12850) (not b!44262) (not b!44193) (not b!44112) (not b!44079) (not d!12764) (not b!44194) (not b!44197) (not b!44076) (not b!44109) (not bm!519) (not b!44075) (not b!43954) (not b!44196) (not b!44119) (not b!44113) (not b!44080) (not b!44260) (not b!44199) (not b!44257) (not b!44259) (not b!44110) (not d!12826) (not b!44258) (not d!12842) (not b!44131) (not d!12766) (not d!12750) (not d!12752) (not d!12824) (not d!12762) (not b!44114) (not b!44117) (not b!44222) (not d!12890) (not b!44078) (not b!44116))
