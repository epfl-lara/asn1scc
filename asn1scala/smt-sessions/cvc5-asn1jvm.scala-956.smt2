; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27008 () Bool)

(assert start!27008)

(declare-fun b!139103 () Bool)

(declare-fun e!92622 () Bool)

(declare-datatypes ((array!6324 0))(
  ( (array!6325 (arr!3558 (Array (_ BitVec 32) (_ BitVec 8))) (size!2863 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4990 0))(
  ( (BitStream!4991 (buf!3276 array!6324) (currentByte!6100 (_ BitVec 32)) (currentBit!6095 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4990)

(declare-fun array_inv!2652 (array!6324) Bool)

(assert (=> b!139103 (= e!92622 (array_inv!2652 (buf!3276 thiss!1634)))))

(declare-fun res!115962 () Bool)

(declare-fun e!92619 () Bool)

(assert (=> start!27008 (=> (not res!115962) (not e!92619))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6324)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27008 (= res!115962 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2863 arr!237))))))

(assert (=> start!27008 e!92619))

(assert (=> start!27008 true))

(assert (=> start!27008 (array_inv!2652 arr!237)))

(declare-fun inv!12 (BitStream!4990) Bool)

(assert (=> start!27008 (and (inv!12 thiss!1634) e!92622)))

(declare-fun b!139104 () Bool)

(declare-fun res!115959 () Bool)

(assert (=> b!139104 (=> (not res!115959) (not e!92619))))

(assert (=> b!139104 (= res!115959 (bvsge from!447 to!404))))

(declare-fun b!139105 () Bool)

(declare-fun res!115961 () Bool)

(assert (=> b!139105 (=> (not res!115961) (not e!92619))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139105 (= res!115961 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2863 (buf!3276 thiss!1634))) ((_ sign_extend 32) (currentByte!6100 thiss!1634)) ((_ sign_extend 32) (currentBit!6095 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139106 () Bool)

(declare-fun e!92621 () Bool)

(assert (=> b!139106 (= e!92619 (not e!92621))))

(declare-fun res!115960 () Bool)

(assert (=> b!139106 (=> res!115960 e!92621)))

(declare-fun lt!216843 () (_ BitVec 64))

(declare-fun lt!216841 () (_ BitVec 64))

(assert (=> b!139106 (= res!115960 (not (= lt!216843 (bvadd lt!216843 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216841)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139106 (= lt!216843 (bitIndex!0 (size!2863 (buf!3276 thiss!1634)) (currentByte!6100 thiss!1634) (currentBit!6095 thiss!1634)))))

(assert (=> b!139106 (= lt!216841 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!4990 BitStream!4990) Bool)

(assert (=> b!139106 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8682 0))(
  ( (Unit!8683) )
))
(declare-fun lt!216840 () Unit!8682)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4990) Unit!8682)

(assert (=> b!139106 (= lt!216840 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-datatypes ((tuple2!12176 0))(
  ( (tuple2!12177 (_1!6414 BitStream!4990) (_2!6414 BitStream!4990)) )
))
(declare-fun lt!216839 () tuple2!12176)

(declare-fun b!139107 () Bool)

(assert (=> b!139107 (= e!92621 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2863 (buf!3276 (_1!6414 lt!216839)))) ((_ sign_extend 32) (currentByte!6100 (_1!6414 lt!216839))) ((_ sign_extend 32) (currentBit!6095 (_1!6414 lt!216839))) (bvsub to!404 from!447)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139107 (validate_offset_bits!1 ((_ sign_extend 32) (size!2863 (buf!3276 thiss!1634))) ((_ sign_extend 32) (currentByte!6100 thiss!1634)) ((_ sign_extend 32) (currentBit!6095 thiss!1634)) lt!216841)))

(declare-fun lt!216842 () Unit!8682)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4990 array!6324 (_ BitVec 64)) Unit!8682)

(assert (=> b!139107 (= lt!216842 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3276 thiss!1634) lt!216841))))

(declare-fun reader!0 (BitStream!4990 BitStream!4990) tuple2!12176)

(assert (=> b!139107 (= lt!216839 (reader!0 thiss!1634 thiss!1634))))

(assert (= (and start!27008 res!115962) b!139105))

(assert (= (and b!139105 res!115961) b!139104))

(assert (= (and b!139104 res!115959) b!139106))

(assert (= (and b!139106 (not res!115960)) b!139107))

(assert (= start!27008 b!139103))

(declare-fun m!214045 () Bool)

(assert (=> b!139107 m!214045))

(declare-fun m!214047 () Bool)

(assert (=> b!139107 m!214047))

(declare-fun m!214049 () Bool)

(assert (=> b!139107 m!214049))

(declare-fun m!214051 () Bool)

(assert (=> b!139107 m!214051))

(declare-fun m!214053 () Bool)

(assert (=> b!139106 m!214053))

(declare-fun m!214055 () Bool)

(assert (=> b!139106 m!214055))

(declare-fun m!214057 () Bool)

(assert (=> b!139106 m!214057))

(declare-fun m!214059 () Bool)

(assert (=> b!139103 m!214059))

(declare-fun m!214061 () Bool)

(assert (=> b!139105 m!214061))

(declare-fun m!214063 () Bool)

(assert (=> start!27008 m!214063))

(declare-fun m!214065 () Bool)

(assert (=> start!27008 m!214065))

(push 1)

(assert (not b!139107))

(assert (not b!139105))

(assert (not start!27008))

(assert (not b!139106))

(assert (not b!139103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44699 () Bool)

(assert (=> d!44699 (= (array_inv!2652 (buf!3276 thiss!1634)) (bvsge (size!2863 (buf!3276 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!139103 d!44699))

(declare-fun d!44701 () Bool)

(assert (=> d!44701 (= (array_inv!2652 arr!237) (bvsge (size!2863 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27008 d!44701))

(declare-fun d!44703 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!44703 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6095 thiss!1634) (currentByte!6100 thiss!1634) (size!2863 (buf!3276 thiss!1634))))))

(declare-fun bs!10938 () Bool)

(assert (= bs!10938 d!44703))

(declare-fun m!214111 () Bool)

(assert (=> bs!10938 m!214111))

(assert (=> start!27008 d!44703))

(declare-fun d!44705 () Bool)

(declare-fun e!92655 () Bool)

(assert (=> d!44705 e!92655))

(declare-fun res!115991 () Bool)

(assert (=> d!44705 (=> (not res!115991) (not e!92655))))

(declare-fun lt!216894 () (_ BitVec 64))

(declare-fun lt!216897 () (_ BitVec 64))

(declare-fun lt!216893 () (_ BitVec 64))

(assert (=> d!44705 (= res!115991 (= lt!216893 (bvsub lt!216894 lt!216897)))))

(assert (=> d!44705 (or (= (bvand lt!216894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!216897 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!216894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!216894 lt!216897) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44705 (= lt!216897 (remainingBits!0 ((_ sign_extend 32) (size!2863 (buf!3276 thiss!1634))) ((_ sign_extend 32) (currentByte!6100 thiss!1634)) ((_ sign_extend 32) (currentBit!6095 thiss!1634))))))

(declare-fun lt!216892 () (_ BitVec 64))

(declare-fun lt!216895 () (_ BitVec 64))

(assert (=> d!44705 (= lt!216894 (bvmul lt!216892 lt!216895))))

(assert (=> d!44705 (or (= lt!216892 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!216895 (bvsdiv (bvmul lt!216892 lt!216895) lt!216892)))))

(assert (=> d!44705 (= lt!216895 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44705 (= lt!216892 ((_ sign_extend 32) (size!2863 (buf!3276 thiss!1634))))))

(assert (=> d!44705 (= lt!216893 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6100 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6095 thiss!1634))))))

(assert (=> d!44705 (invariant!0 (currentBit!6095 thiss!1634) (currentByte!6100 thiss!1634) (size!2863 (buf!3276 thiss!1634)))))

(assert (=> d!44705 (= (bitIndex!0 (size!2863 (buf!3276 thiss!1634)) (currentByte!6100 thiss!1634) (currentBit!6095 thiss!1634)) lt!216893)))

(declare-fun b!139142 () Bool)

(declare-fun res!115992 () Bool)

(assert (=> b!139142 (=> (not res!115992) (not e!92655))))

(assert (=> b!139142 (= res!115992 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!216893))))

(declare-fun b!139143 () Bool)

(declare-fun lt!216896 () (_ BitVec 64))

(assert (=> b!139143 (= e!92655 (bvsle lt!216893 (bvmul lt!216896 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139143 (or (= lt!216896 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!216896 #b0000000000000000000000000000000000000000000000000000000000001000) lt!216896)))))

(assert (=> b!139143 (= lt!216896 ((_ sign_extend 32) (size!2863 (buf!3276 thiss!1634))))))

(assert (= (and d!44705 res!115991) b!139142))

(assert (= (and b!139142 res!115992) b!139143))

(declare-fun m!214127 () Bool)

(assert (=> d!44705 m!214127))

(assert (=> d!44705 m!214111))

(assert (=> b!139106 d!44705))

(declare-fun d!44731 () Bool)

(declare-fun res!115999 () Bool)

(declare-fun e!92661 () Bool)

(assert (=> d!44731 (=> (not res!115999) (not e!92661))))

(assert (=> d!44731 (= res!115999 (= (size!2863 (buf!3276 thiss!1634)) (size!2863 (buf!3276 thiss!1634))))))

(assert (=> d!44731 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!92661)))

(declare-fun b!139150 () Bool)

(declare-fun res!116000 () Bool)

(assert (=> b!139150 (=> (not res!116000) (not e!92661))))

(assert (=> b!139150 (= res!116000 (bvsle (bitIndex!0 (size!2863 (buf!3276 thiss!1634)) (currentByte!6100 thiss!1634) (currentBit!6095 thiss!1634)) (bitIndex!0 (size!2863 (buf!3276 thiss!1634)) (currentByte!6100 thiss!1634) (currentBit!6095 thiss!1634))))))

(declare-fun b!139151 () Bool)

(declare-fun e!92660 () Bool)

(assert (=> b!139151 (= e!92661 e!92660)))

(declare-fun res!116001 () Bool)

(assert (=> b!139151 (=> res!116001 e!92660)))

(assert (=> b!139151 (= res!116001 (= (size!2863 (buf!3276 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!139152 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6324 array!6324 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139152 (= e!92660 (arrayBitRangesEq!0 (buf!3276 thiss!1634) (buf!3276 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2863 (buf!3276 thiss!1634)) (currentByte!6100 thiss!1634) (currentBit!6095 thiss!1634))))))

(assert (= (and d!44731 res!115999) b!139150))

(assert (= (and b!139150 res!116000) b!139151))

(assert (= (and b!139151 (not res!116001)) b!139152))

(assert (=> b!139150 m!214053))

(assert (=> b!139150 m!214053))

(assert (=> b!139152 m!214053))

(assert (=> b!139152 m!214053))

(declare-fun m!214129 () Bool)

(assert (=> b!139152 m!214129))

(assert (=> b!139106 d!44731))

(declare-fun d!44733 () Bool)

(assert (=> d!44733 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!216900 () Unit!8682)

(declare-fun choose!11 (BitStream!4990) Unit!8682)

(assert (=> d!44733 (= lt!216900 (choose!11 thiss!1634))))

(assert (=> d!44733 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!216900)))

(declare-fun bs!10948 () Bool)

(assert (= bs!10948 d!44733))

(assert (=> bs!10948 m!214055))

(declare-fun m!214131 () Bool)

(assert (=> bs!10948 m!214131))

(assert (=> b!139106 d!44733))

(declare-fun d!44735 () Bool)

(assert (=> d!44735 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2863 (buf!3276 thiss!1634))) ((_ sign_extend 32) (currentByte!6100 thiss!1634)) ((_ sign_extend 32) (currentBit!6095 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2863 (buf!3276 thiss!1634))) ((_ sign_extend 32) (currentByte!6100 thiss!1634)) ((_ sign_extend 32) (currentBit!6095 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10949 () Bool)

(assert (= bs!10949 d!44735))

(assert (=> bs!10949 m!214127))

(assert (=> b!139105 d!44735))

(declare-fun d!44737 () Bool)

(assert (=> d!44737 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2863 (buf!3276 (_1!6414 lt!216839)))) ((_ sign_extend 32) (currentByte!6100 (_1!6414 lt!216839))) ((_ sign_extend 32) (currentBit!6095 (_1!6414 lt!216839))) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2863 (buf!3276 (_1!6414 lt!216839)))) ((_ sign_extend 32) (currentByte!6100 (_1!6414 lt!216839))) ((_ sign_extend 32) (currentBit!6095 (_1!6414 lt!216839)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10950 () Bool)

(assert (= bs!10950 d!44737))

(declare-fun m!214133 () Bool)

(assert (=> bs!10950 m!214133))

(assert (=> b!139107 d!44737))

(declare-fun d!44739 () Bool)

(assert (=> d!44739 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2863 (buf!3276 thiss!1634))) ((_ sign_extend 32) (currentByte!6100 thiss!1634)) ((_ sign_extend 32) (currentBit!6095 thiss!1634)) lt!216841) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2863 (buf!3276 thiss!1634))) ((_ sign_extend 32) (currentByte!6100 thiss!1634)) ((_ sign_extend 32) (currentBit!6095 thiss!1634))) lt!216841))))

(declare-fun bs!10951 () Bool)

(assert (= bs!10951 d!44739))

(assert (=> bs!10951 m!214127))

(assert (=> b!139107 d!44739))

(declare-fun d!44741 () Bool)

(assert (=> d!44741 (validate_offset_bits!1 ((_ sign_extend 32) (size!2863 (buf!3276 thiss!1634))) ((_ sign_extend 32) (currentByte!6100 thiss!1634)) ((_ sign_extend 32) (currentBit!6095 thiss!1634)) lt!216841)))

(declare-fun lt!216903 () Unit!8682)

(declare-fun choose!9 (BitStream!4990 array!6324 (_ BitVec 64) BitStream!4990) Unit!8682)

(assert (=> d!44741 (= lt!216903 (choose!9 thiss!1634 (buf!3276 thiss!1634) lt!216841 (BitStream!4991 (buf!3276 thiss!1634) (currentByte!6100 thiss!1634) (currentBit!6095 thiss!1634))))))

(assert (=> d!44741 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3276 thiss!1634) lt!216841) lt!216903)))

(declare-fun bs!10952 () Bool)

(assert (= bs!10952 d!44741))

(assert (=> bs!10952 m!214047))

(declare-fun m!214135 () Bool)

(assert (=> bs!10952 m!214135))

(assert (=> b!139107 d!44741))

(declare-fun b!139223 () Bool)

(declare-fun lt!217112 () (_ BitVec 64))

(declare-fun lt!217110 () tuple2!12176)

(declare-fun lt!217111 () (_ BitVec 64))

(declare-fun e!92696 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4990 (_ BitVec 64)) BitStream!4990)

(assert (=> b!139223 (= e!92696 (= (_1!6414 lt!217110) (withMovedBitIndex!0 (_2!6414 lt!217110) (bvsub lt!217112 lt!217111))))))

(assert (=> b!139223 (or (= (bvand lt!217112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217111 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217112 lt!217111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139223 (= lt!217111 (bitIndex!0 (size!2863 (buf!3276 thiss!1634)) (currentByte!6100 thiss!1634) (currentBit!6095 thiss!1634)))))

(assert (=> b!139223 (= lt!217112 (bitIndex!0 (size!2863 (buf!3276 thiss!1634)) (currentByte!6100 thiss!1634) (currentBit!6095 thiss!1634)))))

(declare-fun d!44743 () Bool)

(assert (=> d!44743 e!92696))

(declare-fun res!116057 () Bool)

(assert (=> d!44743 (=> (not res!116057) (not e!92696))))

(assert (=> d!44743 (= res!116057 (isPrefixOf!0 (_1!6414 lt!217110) (_2!6414 lt!217110)))))

(declare-fun lt!217116 () BitStream!4990)

(assert (=> d!44743 (= lt!217110 (tuple2!12177 lt!217116 thiss!1634))))

(declare-fun lt!217115 () Unit!8682)

(declare-fun lt!217117 () Unit!8682)

(assert (=> d!44743 (= lt!217115 lt!217117)))

(assert (=> d!44743 (isPrefixOf!0 lt!217116 thiss!1634)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4990 BitStream!4990 BitStream!4990) Unit!8682)

(assert (=> d!44743 (= lt!217117 (lemmaIsPrefixTransitive!0 lt!217116 thiss!1634 thiss!1634))))

(declare-fun lt!217108 () Unit!8682)

(declare-fun lt!217125 () Unit!8682)

(assert (=> d!44743 (= lt!217108 lt!217125)))

(assert (=> d!44743 (isPrefixOf!0 lt!217116 thiss!1634)))

(assert (=> d!44743 (= lt!217125 (lemmaIsPrefixTransitive!0 lt!217116 thiss!1634 thiss!1634))))

(declare-fun lt!217106 () Unit!8682)

(declare-fun e!92697 () Unit!8682)

(assert (=> d!44743 (= lt!217106 e!92697)))

(declare-fun c!7759 () Bool)

(assert (=> d!44743 (= c!7759 (not (= (size!2863 (buf!3276 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!217123 () Unit!8682)

(declare-fun lt!217122 () Unit!8682)

(assert (=> d!44743 (= lt!217123 lt!217122)))

(assert (=> d!44743 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44743 (= lt!217122 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!217107 () Unit!8682)

(declare-fun lt!217114 () Unit!8682)

(assert (=> d!44743 (= lt!217107 lt!217114)))

(assert (=> d!44743 (= lt!217114 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!217119 () Unit!8682)

(declare-fun lt!217120 () Unit!8682)

(assert (=> d!44743 (= lt!217119 lt!217120)))

(assert (=> d!44743 (isPrefixOf!0 lt!217116 lt!217116)))

(assert (=> d!44743 (= lt!217120 (lemmaIsPrefixRefl!0 lt!217116))))

(declare-fun lt!217113 () Unit!8682)

(declare-fun lt!217109 () Unit!8682)

(assert (=> d!44743 (= lt!217113 lt!217109)))

(assert (=> d!44743 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44743 (= lt!217109 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44743 (= lt!217116 (BitStream!4991 (buf!3276 thiss!1634) (currentByte!6100 thiss!1634) (currentBit!6095 thiss!1634)))))

(assert (=> d!44743 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44743 (= (reader!0 thiss!1634 thiss!1634) lt!217110)))

(declare-fun b!139224 () Bool)

(declare-fun res!116058 () Bool)

(assert (=> b!139224 (=> (not res!116058) (not e!92696))))

(assert (=> b!139224 (= res!116058 (isPrefixOf!0 (_1!6414 lt!217110) thiss!1634))))

(declare-fun b!139225 () Bool)

(declare-fun res!116056 () Bool)

(assert (=> b!139225 (=> (not res!116056) (not e!92696))))

(assert (=> b!139225 (= res!116056 (isPrefixOf!0 (_2!6414 lt!217110) thiss!1634))))

(declare-fun b!139226 () Bool)

(declare-fun Unit!8690 () Unit!8682)

(assert (=> b!139226 (= e!92697 Unit!8690)))

(declare-fun b!139227 () Bool)

(declare-fun lt!217118 () Unit!8682)

(assert (=> b!139227 (= e!92697 lt!217118)))

(declare-fun lt!217121 () (_ BitVec 64))

(assert (=> b!139227 (= lt!217121 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217124 () (_ BitVec 64))

(assert (=> b!139227 (= lt!217124 (bitIndex!0 (size!2863 (buf!3276 thiss!1634)) (currentByte!6100 thiss!1634) (currentBit!6095 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6324 array!6324 (_ BitVec 64) (_ BitVec 64)) Unit!8682)

(assert (=> b!139227 (= lt!217118 (arrayBitRangesEqSymmetric!0 (buf!3276 thiss!1634) (buf!3276 thiss!1634) lt!217121 lt!217124))))

(assert (=> b!139227 (arrayBitRangesEq!0 (buf!3276 thiss!1634) (buf!3276 thiss!1634) lt!217121 lt!217124)))

(assert (= (and d!44743 c!7759) b!139227))

(assert (= (and d!44743 (not c!7759)) b!139226))

(assert (= (and d!44743 res!116057) b!139224))

(assert (= (and b!139224 res!116058) b!139225))

(assert (= (and b!139225 res!116056) b!139223))

(assert (=> b!139227 m!214053))

(declare-fun m!214187 () Bool)

(assert (=> b!139227 m!214187))

(declare-fun m!214189 () Bool)

(assert (=> b!139227 m!214189))

(declare-fun m!214191 () Bool)

(assert (=> b!139225 m!214191))

(declare-fun m!214193 () Bool)

(assert (=> d!44743 m!214193))

(declare-fun m!214195 () Bool)

(assert (=> d!44743 m!214195))

(assert (=> d!44743 m!214057))

(assert (=> d!44743 m!214057))

(assert (=> d!44743 m!214055))

(assert (=> d!44743 m!214055))

(declare-fun m!214197 () Bool)

(assert (=> d!44743 m!214197))

(declare-fun m!214199 () Bool)

(assert (=> d!44743 m!214199))

(assert (=> d!44743 m!214055))

(declare-fun m!214201 () Bool)

(assert (=> d!44743 m!214201))

(assert (=> d!44743 m!214195))

(declare-fun m!214203 () Bool)

(assert (=> b!139223 m!214203))

(assert (=> b!139223 m!214053))

(assert (=> b!139223 m!214053))

(declare-fun m!214205 () Bool)

(assert (=> b!139224 m!214205))

(assert (=> b!139107 d!44743))

(push 1)

(assert (not b!139152))

(assert (not d!44735))

(assert (not b!139223))

(assert (not b!139150))

(assert (not d!44705))

(assert (not d!44739))

(assert (not d!44737))

(assert (not d!44743))

(assert (not d!44733))

(assert (not b!139224))

(assert (not d!44741))

(assert (not d!44703))

(assert (not b!139225))

(assert (not b!139227))

(check-sat)

(pop 1)

(push 1)

(check-sat)

