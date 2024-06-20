; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!362 () Bool)

(assert start!362)

(declare-fun b!1015 () Bool)

(declare-fun res!3093 () Bool)

(declare-fun e!599 () Bool)

(assert (=> b!1015 (=> (not res!3093) (not e!599))))

(declare-datatypes ((array!103 0))(
  ( (array!104 (arr!426 (Array (_ BitVec 32) (_ BitVec 8))) (size!39 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!62 0))(
  ( (BitStream!63 (buf!351 array!103) (currentByte!1276 (_ BitVec 32)) (currentBit!1271 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!62)

(declare-datatypes ((Unit!23 0))(
  ( (Unit!24) )
))
(declare-datatypes ((tuple2!60 0))(
  ( (tuple2!61 (_1!30 Unit!23) (_2!30 BitStream!62)) )
))
(declare-fun lt!547 () tuple2!60)

(declare-fun isPrefixOf!0 (BitStream!62 BitStream!62) Bool)

(assert (=> b!1015 (= res!3093 (isPrefixOf!0 thiss!932 (_2!30 lt!547)))))

(declare-fun b!1016 () Bool)

(declare-fun res!3094 () Bool)

(declare-fun e!596 () Bool)

(assert (=> b!1016 (=> res!3094 e!596)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!1016 (= res!3094 (not (= (bitIndex!0 (size!39 (buf!351 (_2!30 lt!547))) (currentByte!1276 (_2!30 lt!547)) (currentBit!1271 (_2!30 lt!547))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!39 (buf!351 thiss!932)) (currentByte!1276 thiss!932) (currentBit!1271 thiss!932))))))))

(declare-fun b!1017 () Bool)

(declare-fun res!3088 () Bool)

(assert (=> b!1017 (=> res!3088 e!596)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1017 (= res!3088 (not (invariant!0 (currentBit!1271 (_2!30 lt!547)) (currentByte!1276 (_2!30 lt!547)) (size!39 (buf!351 (_2!30 lt!547))))))))

(declare-fun res!3087 () Bool)

(declare-fun e!601 () Bool)

(assert (=> start!362 (=> (not res!3087) (not e!601))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!362 (= res!3087 (validate_offset_bit!0 ((_ sign_extend 32) (size!39 (buf!351 thiss!932))) ((_ sign_extend 32) (currentByte!1276 thiss!932)) ((_ sign_extend 32) (currentBit!1271 thiss!932))))))

(assert (=> start!362 e!601))

(declare-fun e!597 () Bool)

(declare-fun inv!12 (BitStream!62) Bool)

(assert (=> start!362 (and (inv!12 thiss!932) e!597)))

(declare-fun b!1018 () Bool)

(declare-fun e!598 () Bool)

(assert (=> b!1018 (= e!599 e!598)))

(declare-fun res!3091 () Bool)

(assert (=> b!1018 (=> (not res!3091) (not e!598))))

(declare-datatypes ((tuple2!62 0))(
  ( (tuple2!63 (_1!31 BitStream!62) (_2!31 Bool)) )
))
(declare-fun lt!546 () tuple2!62)

(assert (=> b!1018 (= res!3091 (and (_2!31 lt!546) (= (_1!31 lt!546) (_2!30 lt!547))))))

(declare-fun readBitPure!0 (BitStream!62) tuple2!62)

(declare-fun readerFrom!0 (BitStream!62 (_ BitVec 32) (_ BitVec 32)) BitStream!62)

(assert (=> b!1018 (= lt!546 (readBitPure!0 (readerFrom!0 (_2!30 lt!547) (currentBit!1271 thiss!932) (currentByte!1276 thiss!932))))))

(declare-fun b!1019 () Bool)

(declare-fun array_inv!36 (array!103) Bool)

(assert (=> b!1019 (= e!597 (array_inv!36 (buf!351 thiss!932)))))

(declare-fun b!1020 () Bool)

(assert (=> b!1020 (= e!601 (not e!596))))

(declare-fun res!3092 () Bool)

(assert (=> b!1020 (=> res!3092 e!596)))

(assert (=> b!1020 (= res!3092 (not (= (size!39 (buf!351 (_2!30 lt!547))) (size!39 (buf!351 thiss!932)))))))

(declare-fun e!602 () Bool)

(assert (=> b!1020 e!602))

(declare-fun res!3089 () Bool)

(assert (=> b!1020 (=> (not res!3089) (not e!602))))

(assert (=> b!1020 (= res!3089 (= (size!39 (buf!351 thiss!932)) (size!39 (buf!351 (_2!30 lt!547)))))))

(declare-fun appendBit!0 (BitStream!62 Bool) tuple2!60)

(assert (=> b!1020 (= lt!547 (appendBit!0 thiss!932 true))))

(declare-fun b!1021 () Bool)

(declare-fun lt!548 () (_ BitVec 64))

(assert (=> b!1021 (= e!598 (= (bitIndex!0 (size!39 (buf!351 (_1!31 lt!546))) (currentByte!1276 (_1!31 lt!546)) (currentBit!1271 (_1!31 lt!546))) lt!548))))

(declare-fun b!1022 () Bool)

(assert (=> b!1022 (= e!596 (invariant!0 (currentBit!1271 thiss!932) (currentByte!1276 thiss!932) (size!39 (buf!351 (_2!30 lt!547)))))))

(declare-fun b!1023 () Bool)

(assert (=> b!1023 (= e!602 e!599)))

(declare-fun res!3090 () Bool)

(assert (=> b!1023 (=> (not res!3090) (not e!599))))

(declare-fun lt!545 () (_ BitVec 64))

(assert (=> b!1023 (= res!3090 (= lt!548 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!545)))))

(assert (=> b!1023 (= lt!548 (bitIndex!0 (size!39 (buf!351 (_2!30 lt!547))) (currentByte!1276 (_2!30 lt!547)) (currentBit!1271 (_2!30 lt!547))))))

(assert (=> b!1023 (= lt!545 (bitIndex!0 (size!39 (buf!351 thiss!932)) (currentByte!1276 thiss!932) (currentBit!1271 thiss!932)))))

(declare-fun b!1024 () Bool)

(declare-fun res!3086 () Bool)

(assert (=> b!1024 (=> res!3086 e!596)))

(assert (=> b!1024 (= res!3086 (not (isPrefixOf!0 thiss!932 (_2!30 lt!547))))))

(assert (= (and start!362 res!3087) b!1020))

(assert (= (and b!1020 res!3089) b!1023))

(assert (= (and b!1023 res!3090) b!1015))

(assert (= (and b!1015 res!3093) b!1018))

(assert (= (and b!1018 res!3091) b!1021))

(assert (= (and b!1020 (not res!3092)) b!1016))

(assert (= (and b!1016 (not res!3094)) b!1024))

(assert (= (and b!1024 (not res!3086)) b!1017))

(assert (= (and b!1017 (not res!3088)) b!1022))

(assert (= start!362 b!1019))

(declare-fun m!673 () Bool)

(assert (=> b!1015 m!673))

(declare-fun m!675 () Bool)

(assert (=> b!1016 m!675))

(declare-fun m!677 () Bool)

(assert (=> b!1016 m!677))

(declare-fun m!679 () Bool)

(assert (=> b!1017 m!679))

(assert (=> b!1024 m!673))

(declare-fun m!681 () Bool)

(assert (=> start!362 m!681))

(declare-fun m!683 () Bool)

(assert (=> start!362 m!683))

(declare-fun m!685 () Bool)

(assert (=> b!1018 m!685))

(assert (=> b!1018 m!685))

(declare-fun m!687 () Bool)

(assert (=> b!1018 m!687))

(assert (=> b!1023 m!675))

(assert (=> b!1023 m!677))

(declare-fun m!689 () Bool)

(assert (=> b!1020 m!689))

(declare-fun m!691 () Bool)

(assert (=> b!1021 m!691))

(declare-fun m!693 () Bool)

(assert (=> b!1022 m!693))

(declare-fun m!695 () Bool)

(assert (=> b!1019 m!695))

(push 1)

(assert (not b!1018))

(assert (not b!1022))

(assert (not b!1023))

(assert (not b!1020))

(assert (not b!1016))

(assert (not b!1024))

(assert (not b!1015))

(assert (not b!1019))

(assert (not b!1021))

(assert (not b!1017))

(assert (not start!362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1054 () Bool)

(assert (=> d!1054 (= (invariant!0 (currentBit!1271 (_2!30 lt!547)) (currentByte!1276 (_2!30 lt!547)) (size!39 (buf!351 (_2!30 lt!547)))) (and (bvsge (currentBit!1271 (_2!30 lt!547)) #b00000000000000000000000000000000) (bvslt (currentBit!1271 (_2!30 lt!547)) #b00000000000000000000000000001000) (bvsge (currentByte!1276 (_2!30 lt!547)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1276 (_2!30 lt!547)) (size!39 (buf!351 (_2!30 lt!547)))) (and (= (currentBit!1271 (_2!30 lt!547)) #b00000000000000000000000000000000) (= (currentByte!1276 (_2!30 lt!547)) (size!39 (buf!351 (_2!30 lt!547))))))))))

(assert (=> b!1017 d!1054))

(declare-fun d!1058 () Bool)

(assert (=> d!1058 (= (invariant!0 (currentBit!1271 thiss!932) (currentByte!1276 thiss!932) (size!39 (buf!351 (_2!30 lt!547)))) (and (bvsge (currentBit!1271 thiss!932) #b00000000000000000000000000000000) (bvslt (currentBit!1271 thiss!932) #b00000000000000000000000000001000) (bvsge (currentByte!1276 thiss!932) #b00000000000000000000000000000000) (or (bvslt (currentByte!1276 thiss!932) (size!39 (buf!351 (_2!30 lt!547)))) (and (= (currentBit!1271 thiss!932) #b00000000000000000000000000000000) (= (currentByte!1276 thiss!932) (size!39 (buf!351 (_2!30 lt!547))))))))))

(assert (=> b!1022 d!1058))

(declare-fun d!1062 () Bool)

(declare-fun e!616 () Bool)

(assert (=> d!1062 e!616))

(declare-fun res!3120 () Bool)

(assert (=> d!1062 (=> (not res!3120) (not e!616))))

(declare-fun lt!593 () (_ BitVec 64))

(declare-fun lt!594 () (_ BitVec 64))

(declare-fun lt!597 () (_ BitVec 64))

(assert (=> d!1062 (= res!3120 (= lt!593 (bvsub lt!594 lt!597)))))

(assert (=> d!1062 (or (= (bvand lt!594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!597 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!594 lt!597) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1062 (= lt!597 (remainingBits!0 ((_ sign_extend 32) (size!39 (buf!351 (_2!30 lt!547)))) ((_ sign_extend 32) (currentByte!1276 (_2!30 lt!547))) ((_ sign_extend 32) (currentBit!1271 (_2!30 lt!547)))))))

(declare-fun lt!596 () (_ BitVec 64))

(declare-fun lt!592 () (_ BitVec 64))

(assert (=> d!1062 (= lt!594 (bvmul lt!596 lt!592))))

(assert (=> d!1062 (or (= lt!596 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!592 (bvsdiv (bvmul lt!596 lt!592) lt!596)))))

(assert (=> d!1062 (= lt!592 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1062 (= lt!596 ((_ sign_extend 32) (size!39 (buf!351 (_2!30 lt!547)))))))

(assert (=> d!1062 (= lt!593 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1276 (_2!30 lt!547))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1271 (_2!30 lt!547)))))))

(assert (=> d!1062 (invariant!0 (currentBit!1271 (_2!30 lt!547)) (currentByte!1276 (_2!30 lt!547)) (size!39 (buf!351 (_2!30 lt!547))))))

(assert (=> d!1062 (= (bitIndex!0 (size!39 (buf!351 (_2!30 lt!547))) (currentByte!1276 (_2!30 lt!547)) (currentBit!1271 (_2!30 lt!547))) lt!593)))

(declare-fun b!1048 () Bool)

(declare-fun res!3119 () Bool)

(assert (=> b!1048 (=> (not res!3119) (not e!616))))

(assert (=> b!1048 (= res!3119 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!593))))

(declare-fun b!1049 () Bool)

(declare-fun lt!595 () (_ BitVec 64))

(assert (=> b!1049 (= e!616 (bvsle lt!593 (bvmul lt!595 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1049 (or (= lt!595 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!595 #b0000000000000000000000000000000000000000000000000000000000001000) lt!595)))))

(assert (=> b!1049 (= lt!595 ((_ sign_extend 32) (size!39 (buf!351 (_2!30 lt!547)))))))

(assert (= (and d!1062 res!3120) b!1048))

(assert (= (and b!1048 res!3119) b!1049))

(declare-fun m!709 () Bool)

(assert (=> d!1062 m!709))

(assert (=> d!1062 m!679))

(assert (=> b!1023 d!1062))

(declare-fun d!1070 () Bool)

(declare-fun e!619 () Bool)

(assert (=> d!1070 e!619))

(declare-fun res!3124 () Bool)

(assert (=> d!1070 (=> (not res!3124) (not e!619))))

(declare-fun lt!601 () (_ BitVec 64))

(declare-fun lt!605 () (_ BitVec 64))

(declare-fun lt!602 () (_ BitVec 64))

(assert (=> d!1070 (= res!3124 (= lt!601 (bvsub lt!602 lt!605)))))

(assert (=> d!1070 (or (= (bvand lt!602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!605 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!602 lt!605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1070 (= lt!605 (remainingBits!0 ((_ sign_extend 32) (size!39 (buf!351 thiss!932))) ((_ sign_extend 32) (currentByte!1276 thiss!932)) ((_ sign_extend 32) (currentBit!1271 thiss!932))))))

(declare-fun lt!604 () (_ BitVec 64))

(declare-fun lt!600 () (_ BitVec 64))

(assert (=> d!1070 (= lt!602 (bvmul lt!604 lt!600))))

(assert (=> d!1070 (or (= lt!604 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!600 (bvsdiv (bvmul lt!604 lt!600) lt!604)))))

(assert (=> d!1070 (= lt!600 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1070 (= lt!604 ((_ sign_extend 32) (size!39 (buf!351 thiss!932))))))

(assert (=> d!1070 (= lt!601 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1276 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1271 thiss!932))))))

(assert (=> d!1070 (invariant!0 (currentBit!1271 thiss!932) (currentByte!1276 thiss!932) (size!39 (buf!351 thiss!932)))))

(assert (=> d!1070 (= (bitIndex!0 (size!39 (buf!351 thiss!932)) (currentByte!1276 thiss!932) (currentBit!1271 thiss!932)) lt!601)))

(declare-fun b!1052 () Bool)

(declare-fun res!3123 () Bool)

(assert (=> b!1052 (=> (not res!3123) (not e!619))))

(assert (=> b!1052 (= res!3123 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!601))))

(declare-fun b!1053 () Bool)

(declare-fun lt!603 () (_ BitVec 64))

(assert (=> b!1053 (= e!619 (bvsle lt!601 (bvmul lt!603 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1053 (or (= lt!603 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!603 #b0000000000000000000000000000000000000000000000000000000000001000) lt!603)))))

(assert (=> b!1053 (= lt!603 ((_ sign_extend 32) (size!39 (buf!351 thiss!932))))))

(assert (= (and d!1070 res!3124) b!1052))

(assert (= (and b!1052 res!3123) b!1053))

(declare-fun m!711 () Bool)

(assert (=> d!1070 m!711))

(declare-fun m!713 () Bool)

(assert (=> d!1070 m!713))

(assert (=> b!1023 d!1070))

(declare-fun d!1072 () Bool)

(declare-datatypes ((tuple2!68 0))(
  ( (tuple2!69 (_1!34 Bool) (_2!34 BitStream!62)) )
))
(declare-fun lt!620 () tuple2!68)

(declare-fun readBit!0 (BitStream!62) tuple2!68)

(assert (=> d!1072 (= lt!620 (readBit!0 (readerFrom!0 (_2!30 lt!547) (currentBit!1271 thiss!932) (currentByte!1276 thiss!932))))))

(assert (=> d!1072 (= (readBitPure!0 (readerFrom!0 (_2!30 lt!547) (currentBit!1271 thiss!932) (currentByte!1276 thiss!932))) (tuple2!63 (_2!34 lt!620) (_1!34 lt!620)))))

(declare-fun bs!417 () Bool)

(assert (= bs!417 d!1072))

(assert (=> bs!417 m!685))

(declare-fun m!721 () Bool)

(assert (=> bs!417 m!721))

(assert (=> b!1018 d!1072))

(declare-fun d!1080 () Bool)

(declare-fun e!625 () Bool)

(assert (=> d!1080 e!625))

(declare-fun res!3134 () Bool)

(assert (=> d!1080 (=> (not res!3134) (not e!625))))

(assert (=> d!1080 (= res!3134 (invariant!0 (currentBit!1271 (_2!30 lt!547)) (currentByte!1276 (_2!30 lt!547)) (size!39 (buf!351 (_2!30 lt!547)))))))

(assert (=> d!1080 (= (readerFrom!0 (_2!30 lt!547) (currentBit!1271 thiss!932) (currentByte!1276 thiss!932)) (BitStream!63 (buf!351 (_2!30 lt!547)) (currentByte!1276 thiss!932) (currentBit!1271 thiss!932)))))

(declare-fun b!1061 () Bool)

(assert (=> b!1061 (= e!625 (invariant!0 (currentBit!1271 thiss!932) (currentByte!1276 thiss!932) (size!39 (buf!351 (_2!30 lt!547)))))))

(assert (= (and d!1080 res!3134) b!1061))

(assert (=> d!1080 m!679))

(assert (=> b!1061 m!693))

(assert (=> b!1018 d!1080))

(declare-fun d!1084 () Bool)

(assert (=> d!1084 (= (array_inv!36 (buf!351 thiss!932)) (bvsge (size!39 (buf!351 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!1019 d!1084))

(declare-fun d!1086 () Bool)

(declare-fun res!3146 () Bool)

(declare-fun e!634 () Bool)

(assert (=> d!1086 (=> (not res!3146) (not e!634))))

(assert (=> d!1086 (= res!3146 (= (size!39 (buf!351 thiss!932)) (size!39 (buf!351 (_2!30 lt!547)))))))

(assert (=> d!1086 (= (isPrefixOf!0 thiss!932 (_2!30 lt!547)) e!634)))

(declare-fun b!1073 () Bool)

(declare-fun res!3147 () Bool)

(assert (=> b!1073 (=> (not res!3147) (not e!634))))

(assert (=> b!1073 (= res!3147 (bvsle (bitIndex!0 (size!39 (buf!351 thiss!932)) (currentByte!1276 thiss!932) (currentBit!1271 thiss!932)) (bitIndex!0 (size!39 (buf!351 (_2!30 lt!547))) (currentByte!1276 (_2!30 lt!547)) (currentBit!1271 (_2!30 lt!547)))))))

(declare-fun b!1074 () Bool)

(declare-fun e!635 () Bool)

(assert (=> b!1074 (= e!634 e!635)))

(declare-fun res!3148 () Bool)

(assert (=> b!1074 (=> res!3148 e!635)))

(assert (=> b!1074 (= res!3148 (= (size!39 (buf!351 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!1075 () Bool)

(declare-fun arrayBitRangesEq!0 (array!103 array!103 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1075 (= e!635 (arrayBitRangesEq!0 (buf!351 thiss!932) (buf!351 (_2!30 lt!547)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!39 (buf!351 thiss!932)) (currentByte!1276 thiss!932) (currentBit!1271 thiss!932))))))

(assert (= (and d!1086 res!3146) b!1073))

(assert (= (and b!1073 res!3147) b!1074))

(assert (= (and b!1074 (not res!3148)) b!1075))

(assert (=> b!1073 m!677))

(assert (=> b!1073 m!675))

(assert (=> b!1075 m!677))

(assert (=> b!1075 m!677))

(declare-fun m!729 () Bool)

(assert (=> b!1075 m!729))

(assert (=> b!1024 d!1086))

(declare-fun d!1098 () Bool)

(assert (=> d!1098 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!39 (buf!351 thiss!932))) ((_ sign_extend 32) (currentByte!1276 thiss!932)) ((_ sign_extend 32) (currentBit!1271 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!39 (buf!351 thiss!932))) ((_ sign_extend 32) (currentByte!1276 thiss!932)) ((_ sign_extend 32) (currentBit!1271 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!421 () Bool)

(assert (= bs!421 d!1098))

(assert (=> bs!421 m!711))

(assert (=> start!362 d!1098))

(declare-fun d!1100 () Bool)

(assert (=> d!1100 (= (inv!12 thiss!932) (invariant!0 (currentBit!1271 thiss!932) (currentByte!1276 thiss!932) (size!39 (buf!351 thiss!932))))))

(declare-fun bs!422 () Bool)

(assert (= bs!422 d!1100))

(assert (=> bs!422 m!713))

(assert (=> start!362 d!1100))

(assert (=> b!1015 d!1086))

(declare-fun b!1127 () Bool)

(declare-fun e!661 () Bool)

(declare-fun lt!674 () tuple2!62)

(declare-fun lt!676 () tuple2!60)

(assert (=> b!1127 (= e!661 (= (bitIndex!0 (size!39 (buf!351 (_1!31 lt!674))) (currentByte!1276 (_1!31 lt!674)) (currentBit!1271 (_1!31 lt!674))) (bitIndex!0 (size!39 (buf!351 (_2!30 lt!676))) (currentByte!1276 (_2!30 lt!676)) (currentBit!1271 (_2!30 lt!676)))))))

(declare-fun b!1125 () Bool)

(declare-fun res!3195 () Bool)

(declare-fun e!660 () Bool)

(assert (=> b!1125 (=> (not res!3195) (not e!660))))

(assert (=> b!1125 (= res!3195 (isPrefixOf!0 thiss!932 (_2!30 lt!676)))))

(declare-fun d!1102 () Bool)

(assert (=> d!1102 e!660))

(declare-fun res!3196 () Bool)

(assert (=> d!1102 (=> (not res!3196) (not e!660))))

(assert (=> d!1102 (= res!3196 (= (size!39 (buf!351 thiss!932)) (size!39 (buf!351 (_2!30 lt!676)))))))

(declare-fun choose!16 (BitStream!62 Bool) tuple2!60)

(assert (=> d!1102 (= lt!676 (choose!16 thiss!932 true))))

(assert (=> d!1102 (validate_offset_bit!0 ((_ sign_extend 32) (size!39 (buf!351 thiss!932))) ((_ sign_extend 32) (currentByte!1276 thiss!932)) ((_ sign_extend 32) (currentBit!1271 thiss!932)))))

(assert (=> d!1102 (= (appendBit!0 thiss!932 true) lt!676)))

(declare-fun b!1124 () Bool)

(declare-fun res!3197 () Bool)

(assert (=> b!1124 (=> (not res!3197) (not e!660))))

(declare-fun lt!675 () (_ BitVec 64))

(declare-fun lt!677 () (_ BitVec 64))

(assert (=> b!1124 (= res!3197 (= (bitIndex!0 (size!39 (buf!351 (_2!30 lt!676))) (currentByte!1276 (_2!30 lt!676)) (currentBit!1271 (_2!30 lt!676))) (bvadd lt!675 lt!677)))))

(assert (=> b!1124 (or (not (= (bvand lt!675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!677 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!675 lt!677) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1124 (= lt!677 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!1124 (= lt!675 (bitIndex!0 (size!39 (buf!351 thiss!932)) (currentByte!1276 thiss!932) (currentBit!1271 thiss!932)))))

(declare-fun b!1126 () Bool)

(assert (=> b!1126 (= e!660 e!661)))

(declare-fun res!3194 () Bool)

(assert (=> b!1126 (=> (not res!3194) (not e!661))))

(assert (=> b!1126 (= res!3194 (and (= (_2!31 lt!674) true) (= (_1!31 lt!674) (_2!30 lt!676))))))

(assert (=> b!1126 (= lt!674 (readBitPure!0 (readerFrom!0 (_2!30 lt!676) (currentBit!1271 thiss!932) (currentByte!1276 thiss!932))))))

(assert (= (and d!1102 res!3196) b!1124))

(assert (= (and b!1124 res!3197) b!1125))

(assert (= (and b!1125 res!3195) b!1126))

(assert (= (and b!1126 res!3194) b!1127))

(declare-fun m!759 () Bool)

(assert (=> d!1102 m!759))

(assert (=> d!1102 m!681))

(declare-fun m!761 () Bool)

(assert (=> b!1125 m!761))

(declare-fun m!763 () Bool)

(assert (=> b!1126 m!763))

(assert (=> b!1126 m!763))

(declare-fun m!765 () Bool)

(assert (=> b!1126 m!765))

(declare-fun m!767 () Bool)

(assert (=> b!1127 m!767))

(declare-fun m!769 () Bool)

(assert (=> b!1127 m!769))

(assert (=> b!1124 m!769))

(assert (=> b!1124 m!677))

(assert (=> b!1020 d!1102))

(declare-fun d!1116 () Bool)

(declare-fun e!662 () Bool)

(assert (=> d!1116 e!662))

(declare-fun res!3199 () Bool)

(assert (=> d!1116 (=> (not res!3199) (not e!662))))

(declare-fun lt!680 () (_ BitVec 64))

(declare-fun lt!679 () (_ BitVec 64))

(declare-fun lt!683 () (_ BitVec 64))

(assert (=> d!1116 (= res!3199 (= lt!679 (bvsub lt!680 lt!683)))))

(assert (=> d!1116 (or (= (bvand lt!680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!683 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!680 lt!683) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1116 (= lt!683 (remainingBits!0 ((_ sign_extend 32) (size!39 (buf!351 (_1!31 lt!546)))) ((_ sign_extend 32) (currentByte!1276 (_1!31 lt!546))) ((_ sign_extend 32) (currentBit!1271 (_1!31 lt!546)))))))

(declare-fun lt!682 () (_ BitVec 64))

(declare-fun lt!678 () (_ BitVec 64))

(assert (=> d!1116 (= lt!680 (bvmul lt!682 lt!678))))

(assert (=> d!1116 (or (= lt!682 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!678 (bvsdiv (bvmul lt!682 lt!678) lt!682)))))

(assert (=> d!1116 (= lt!678 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1116 (= lt!682 ((_ sign_extend 32) (size!39 (buf!351 (_1!31 lt!546)))))))

(assert (=> d!1116 (= lt!679 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1276 (_1!31 lt!546))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1271 (_1!31 lt!546)))))))

