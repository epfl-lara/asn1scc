; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53352 () Bool)

(assert start!53352)

(declare-fun b!247728 () Bool)

(declare-fun e!171646 () Bool)

(declare-datatypes ((array!13522 0))(
  ( (array!13523 (arr!6916 (Array (_ BitVec 32) (_ BitVec 8))) (size!5929 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10780 0))(
  ( (BitStream!10781 (buf!6413 array!13522) (currentByte!11826 (_ BitVec 32)) (currentBit!11821 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10780)

(declare-fun array_inv!5670 (array!13522) Bool)

(assert (=> b!247728 (= e!171646 (array_inv!5670 (buf!6413 thiss!1005)))))

(declare-fun b!247729 () Bool)

(declare-fun e!171647 () Bool)

(declare-fun e!171643 () Bool)

(assert (=> b!247729 (= e!171647 (not e!171643))))

(declare-fun res!207318 () Bool)

(assert (=> b!247729 (=> res!207318 e!171643)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!247729 (= res!207318 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10780 BitStream!10780) Bool)

(assert (=> b!247729 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17976 0))(
  ( (Unit!17977) )
))
(declare-fun lt!386015 () Unit!17976)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10780) Unit!17976)

(assert (=> b!247729 (= lt!386015 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247731 () Bool)

(declare-fun res!207316 () Bool)

(assert (=> b!247731 (=> (not res!207316) (not e!171647))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247731 (= res!207316 (validate_offset_bits!1 ((_ sign_extend 32) (size!5929 (buf!6413 thiss!1005))) ((_ sign_extend 32) (currentByte!11826 thiss!1005)) ((_ sign_extend 32) (currentBit!11821 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247732 () Bool)

(declare-fun e!171644 () Bool)

(assert (=> b!247732 (= e!171643 e!171644)))

(declare-fun res!207314 () Bool)

(assert (=> b!247732 (=> res!207314 e!171644)))

(declare-fun lt!386014 () (_ BitVec 64))

(assert (=> b!247732 (= res!207314 (not (= lt!386014 (bvadd lt!386014 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247732 (= lt!386014 (bitIndex!0 (size!5929 (buf!6413 thiss!1005)) (currentByte!11826 thiss!1005) (currentBit!11821 thiss!1005)))))

(declare-fun b!247733 () Bool)

(declare-fun res!207315 () Bool)

(assert (=> b!247733 (=> (not res!207315) (not e!171647))))

(assert (=> b!247733 (= res!207315 (bvsge from!289 nBits!297))))

(declare-fun b!247730 () Bool)

(declare-datatypes ((tuple2!21246 0))(
  ( (tuple2!21247 (_1!11545 BitStream!10780) (_2!11545 BitStream!10780)) )
))
(declare-fun lt!386016 () tuple2!21246)

(assert (=> b!247730 (= e!171644 (validate_offset_bits!1 ((_ sign_extend 32) (size!5929 (buf!6413 (_1!11545 lt!386016)))) ((_ sign_extend 32) (currentByte!11826 (_1!11545 lt!386016))) ((_ sign_extend 32) (currentBit!11821 (_1!11545 lt!386016))) (bvsub nBits!297 from!289)))))

(declare-fun lt!386013 () Unit!17976)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10780 array!13522 (_ BitVec 64)) Unit!17976)

(assert (=> b!247730 (= lt!386013 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6413 thiss!1005) (bvsub nBits!297 from!289)))))

(declare-fun reader!0 (BitStream!10780 BitStream!10780) tuple2!21246)

(assert (=> b!247730 (= lt!386016 (reader!0 thiss!1005 thiss!1005))))

(declare-fun res!207317 () Bool)

(assert (=> start!53352 (=> (not res!207317) (not e!171647))))

(assert (=> start!53352 (= res!207317 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53352 e!171647))

(assert (=> start!53352 true))

(declare-fun inv!12 (BitStream!10780) Bool)

(assert (=> start!53352 (and (inv!12 thiss!1005) e!171646)))

(assert (= (and start!53352 res!207317) b!247731))

(assert (= (and b!247731 res!207316) b!247733))

(assert (= (and b!247733 res!207315) b!247729))

(assert (= (and b!247729 (not res!207318)) b!247732))

(assert (= (and b!247732 (not res!207314)) b!247730))

(assert (= start!53352 b!247728))

(declare-fun m!373389 () Bool)

(assert (=> b!247731 m!373389))

(declare-fun m!373391 () Bool)

(assert (=> b!247730 m!373391))

(declare-fun m!373393 () Bool)

(assert (=> b!247730 m!373393))

(declare-fun m!373395 () Bool)

(assert (=> b!247730 m!373395))

(declare-fun m!373397 () Bool)

(assert (=> b!247732 m!373397))

(declare-fun m!373399 () Bool)

(assert (=> b!247729 m!373399))

(declare-fun m!373401 () Bool)

(assert (=> b!247729 m!373401))

(declare-fun m!373403 () Bool)

(assert (=> b!247728 m!373403))

(declare-fun m!373405 () Bool)

(assert (=> start!53352 m!373405))

(push 1)

(assert (not b!247730))

(assert (not b!247729))

(assert (not b!247732))

(assert (not start!53352))

(assert (not b!247731))

(assert (not b!247728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82920 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82920 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5929 (buf!6413 (_1!11545 lt!386016)))) ((_ sign_extend 32) (currentByte!11826 (_1!11545 lt!386016))) ((_ sign_extend 32) (currentBit!11821 (_1!11545 lt!386016))) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5929 (buf!6413 (_1!11545 lt!386016)))) ((_ sign_extend 32) (currentByte!11826 (_1!11545 lt!386016))) ((_ sign_extend 32) (currentBit!11821 (_1!11545 lt!386016)))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21017 () Bool)

(assert (= bs!21017 d!82920))

(declare-fun m!373443 () Bool)

(assert (=> bs!21017 m!373443))

(assert (=> b!247730 d!82920))

(declare-fun d!82922 () Bool)

(assert (=> d!82922 (validate_offset_bits!1 ((_ sign_extend 32) (size!5929 (buf!6413 thiss!1005))) ((_ sign_extend 32) (currentByte!11826 thiss!1005)) ((_ sign_extend 32) (currentBit!11821 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!386043 () Unit!17976)

(declare-fun choose!9 (BitStream!10780 array!13522 (_ BitVec 64) BitStream!10780) Unit!17976)

(assert (=> d!82922 (= lt!386043 (choose!9 thiss!1005 (buf!6413 thiss!1005) (bvsub nBits!297 from!289) (BitStream!10781 (buf!6413 thiss!1005) (currentByte!11826 thiss!1005) (currentBit!11821 thiss!1005))))))

(assert (=> d!82922 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6413 thiss!1005) (bvsub nBits!297 from!289)) lt!386043)))

(declare-fun bs!21018 () Bool)

(assert (= bs!21018 d!82922))

(assert (=> bs!21018 m!373389))

(declare-fun m!373445 () Bool)

(assert (=> bs!21018 m!373445))

(assert (=> b!247730 d!82922))

(declare-fun d!82924 () Bool)

(declare-fun e!171687 () Bool)

(assert (=> d!82924 e!171687))

(declare-fun res!207362 () Bool)

(assert (=> d!82924 (=> (not res!207362) (not e!171687))))

(declare-fun lt!386134 () tuple2!21246)

(assert (=> d!82924 (= res!207362 (isPrefixOf!0 (_1!11545 lt!386134) (_2!11545 lt!386134)))))

(declare-fun lt!386135 () BitStream!10780)

(assert (=> d!82924 (= lt!386134 (tuple2!21247 lt!386135 thiss!1005))))

(declare-fun lt!386141 () Unit!17976)

(declare-fun lt!386139 () Unit!17976)

(assert (=> d!82924 (= lt!386141 lt!386139)))

(assert (=> d!82924 (isPrefixOf!0 lt!386135 thiss!1005)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10780 BitStream!10780 BitStream!10780) Unit!17976)

(assert (=> d!82924 (= lt!386139 (lemmaIsPrefixTransitive!0 lt!386135 thiss!1005 thiss!1005))))

(declare-fun lt!386140 () Unit!17976)

(declare-fun lt!386145 () Unit!17976)

(assert (=> d!82924 (= lt!386140 lt!386145)))

(assert (=> d!82924 (isPrefixOf!0 lt!386135 thiss!1005)))

(assert (=> d!82924 (= lt!386145 (lemmaIsPrefixTransitive!0 lt!386135 thiss!1005 thiss!1005))))

(declare-fun lt!386143 () Unit!17976)

(declare-fun e!171686 () Unit!17976)

(assert (=> d!82924 (= lt!386143 e!171686)))

(declare-fun c!11517 () Bool)

(assert (=> d!82924 (= c!11517 (not (= (size!5929 (buf!6413 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!386130 () Unit!17976)

(declare-fun lt!386142 () Unit!17976)

(assert (=> d!82924 (= lt!386130 lt!386142)))

(assert (=> d!82924 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82924 (= lt!386142 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun lt!386146 () Unit!17976)

(declare-fun lt!386136 () Unit!17976)

(assert (=> d!82924 (= lt!386146 lt!386136)))

(assert (=> d!82924 (= lt!386136 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun lt!386133 () Unit!17976)

(declare-fun lt!386129 () Unit!17976)

(assert (=> d!82924 (= lt!386133 lt!386129)))

(assert (=> d!82924 (isPrefixOf!0 lt!386135 lt!386135)))

(assert (=> d!82924 (= lt!386129 (lemmaIsPrefixRefl!0 lt!386135))))

(declare-fun lt!386132 () Unit!17976)

(declare-fun lt!386137 () Unit!17976)

(assert (=> d!82924 (= lt!386132 lt!386137)))

(assert (=> d!82924 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82924 (= lt!386137 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82924 (= lt!386135 (BitStream!10781 (buf!6413 thiss!1005) (currentByte!11826 thiss!1005) (currentBit!11821 thiss!1005)))))

(assert (=> d!82924 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82924 (= (reader!0 thiss!1005 thiss!1005) lt!386134)))

(declare-fun b!247790 () Bool)

(declare-fun res!207363 () Bool)

(assert (=> b!247790 (=> (not res!207363) (not e!171687))))

(assert (=> b!247790 (= res!207363 (isPrefixOf!0 (_2!11545 lt!386134) thiss!1005))))

(declare-fun b!247791 () Bool)

(declare-fun lt!386144 () Unit!17976)

(assert (=> b!247791 (= e!171686 lt!386144)))

(declare-fun lt!386131 () (_ BitVec 64))

(assert (=> b!247791 (= lt!386131 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!386127 () (_ BitVec 64))

(assert (=> b!247791 (= lt!386127 (bitIndex!0 (size!5929 (buf!6413 thiss!1005)) (currentByte!11826 thiss!1005) (currentBit!11821 thiss!1005)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13522 array!13522 (_ BitVec 64) (_ BitVec 64)) Unit!17976)

(assert (=> b!247791 (= lt!386144 (arrayBitRangesEqSymmetric!0 (buf!6413 thiss!1005) (buf!6413 thiss!1005) lt!386131 lt!386127))))

(declare-fun arrayBitRangesEq!0 (array!13522 array!13522 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247791 (arrayBitRangesEq!0 (buf!6413 thiss!1005) (buf!6413 thiss!1005) lt!386131 lt!386127)))

(declare-fun b!247792 () Bool)

(declare-fun Unit!17983 () Unit!17976)

(assert (=> b!247792 (= e!171686 Unit!17983)))

(declare-fun lt!386138 () (_ BitVec 64))

(declare-fun lt!386128 () (_ BitVec 64))

(declare-fun b!247793 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10780 (_ BitVec 64)) BitStream!10780)

(assert (=> b!247793 (= e!171687 (= (_1!11545 lt!386134) (withMovedBitIndex!0 (_2!11545 lt!386134) (bvsub lt!386138 lt!386128))))))

(assert (=> b!247793 (or (= (bvand lt!386138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386128 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386138 lt!386128) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247793 (= lt!386128 (bitIndex!0 (size!5929 (buf!6413 thiss!1005)) (currentByte!11826 thiss!1005) (currentBit!11821 thiss!1005)))))

(assert (=> b!247793 (= lt!386138 (bitIndex!0 (size!5929 (buf!6413 thiss!1005)) (currentByte!11826 thiss!1005) (currentBit!11821 thiss!1005)))))

(declare-fun b!247794 () Bool)

(declare-fun res!207361 () Bool)

(assert (=> b!247794 (=> (not res!207361) (not e!171687))))

(assert (=> b!247794 (= res!207361 (isPrefixOf!0 (_1!11545 lt!386134) thiss!1005))))

(assert (= (and d!82924 c!11517) b!247791))

(assert (= (and d!82924 (not c!11517)) b!247792))

(assert (= (and d!82924 res!207362) b!247794))

(assert (= (and b!247794 res!207361) b!247790))

(assert (= (and b!247790 res!207363) b!247793))

(assert (=> b!247791 m!373397))

(declare-fun m!373451 () Bool)

(assert (=> b!247791 m!373451))

(declare-fun m!373453 () Bool)

(assert (=> b!247791 m!373453))

(assert (=> d!82924 m!373401))

(declare-fun m!373455 () Bool)

(assert (=> d!82924 m!373455))

(declare-fun m!373457 () Bool)

(assert (=> d!82924 m!373457))

(declare-fun m!373459 () Bool)

(assert (=> d!82924 m!373459))

(assert (=> d!82924 m!373399))

(declare-fun m!373461 () Bool)

(assert (=> d!82924 m!373461))

(assert (=> d!82924 m!373401))

(assert (=> d!82924 m!373399))

(assert (=> d!82924 m!373459))

(assert (=> d!82924 m!373399))

(declare-fun m!373463 () Bool)

(assert (=> d!82924 m!373463))

(declare-fun m!373465 () Bool)

(assert (=> b!247793 m!373465))

(assert (=> b!247793 m!373397))

(assert (=> b!247793 m!373397))

(declare-fun m!373467 () Bool)

(assert (=> b!247790 m!373467))

(declare-fun m!373469 () Bool)

(assert (=> b!247794 m!373469))

(assert (=> b!247730 d!82924))

(declare-fun d!82932 () Bool)

(assert (=> d!82932 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5929 (buf!6413 thiss!1005))) ((_ sign_extend 32) (currentByte!11826 thiss!1005)) ((_ sign_extend 32) (currentBit!11821 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5929 (buf!6413 thiss!1005))) ((_ sign_extend 32) (currentByte!11826 thiss!1005)) ((_ sign_extend 32) (currentBit!11821 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21021 () Bool)

(assert (= bs!21021 d!82932))

(declare-fun m!373471 () Bool)

(assert (=> bs!21021 m!373471))

(assert (=> b!247731 d!82932))

(declare-fun d!82934 () Bool)

(declare-fun e!171692 () Bool)

(assert (=> d!82934 e!171692))

(declare-fun res!207372 () Bool)

(assert (=> d!82934 (=> (not res!207372) (not e!171692))))

(declare-fun lt!386183 () (_ BitVec 64))

(declare-fun lt!386180 () (_ BitVec 64))

(declare-fun lt!386182 () (_ BitVec 64))

(assert (=> d!82934 (= res!207372 (= lt!386182 (bvsub lt!386180 lt!386183)))))

(assert (=> d!82934 (or (= (bvand lt!386180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386183 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386180 lt!386183) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82934 (= lt!386183 (remainingBits!0 ((_ sign_extend 32) (size!5929 (buf!6413 thiss!1005))) ((_ sign_extend 32) (currentByte!11826 thiss!1005)) ((_ sign_extend 32) (currentBit!11821 thiss!1005))))))

(declare-fun lt!386184 () (_ BitVec 64))

(declare-fun lt!386181 () (_ BitVec 64))

(assert (=> d!82934 (= lt!386180 (bvmul lt!386184 lt!386181))))

(assert (=> d!82934 (or (= lt!386184 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!386181 (bvsdiv (bvmul lt!386184 lt!386181) lt!386184)))))

(assert (=> d!82934 (= lt!386181 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82934 (= lt!386184 ((_ sign_extend 32) (size!5929 (buf!6413 thiss!1005))))))

(assert (=> d!82934 (= lt!386182 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11826 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11821 thiss!1005))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!82934 (invariant!0 (currentBit!11821 thiss!1005) (currentByte!11826 thiss!1005) (size!5929 (buf!6413 thiss!1005)))))

(assert (=> d!82934 (= (bitIndex!0 (size!5929 (buf!6413 thiss!1005)) (currentByte!11826 thiss!1005) (currentBit!11821 thiss!1005)) lt!386182)))

(declare-fun b!247804 () Bool)

(declare-fun res!207371 () Bool)

(assert (=> b!247804 (=> (not res!207371) (not e!171692))))

(assert (=> b!247804 (= res!207371 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386182))))

(declare-fun b!247805 () Bool)

(declare-fun lt!386179 () (_ BitVec 64))

(assert (=> b!247805 (= e!171692 (bvsle lt!386182 (bvmul lt!386179 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247805 (or (= lt!386179 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!386179 #b0000000000000000000000000000000000000000000000000000000000001000) lt!386179)))))

(assert (=> b!247805 (= lt!386179 ((_ sign_extend 32) (size!5929 (buf!6413 thiss!1005))))))

(assert (= (and d!82934 res!207372) b!247804))

(assert (= (and b!247804 res!207371) b!247805))

(assert (=> d!82934 m!373471))

(declare-fun m!373495 () Bool)

(assert (=> d!82934 m!373495))

(assert (=> b!247732 d!82934))

(declare-fun d!82944 () Bool)

(assert (=> d!82944 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11821 thiss!1005) (currentByte!11826 thiss!1005) (size!5929 (buf!6413 thiss!1005))))))

(declare-fun bs!21023 () Bool)

(assert (= bs!21023 d!82944))

(assert (=> bs!21023 m!373495))

(assert (=> start!53352 d!82944))

(declare-fun d!82946 () Bool)

(assert (=> d!82946 (= (array_inv!5670 (buf!6413 thiss!1005)) (bvsge (size!5929 (buf!6413 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!247728 d!82946))

(declare-fun d!82948 () Bool)

(declare-fun res!207391 () Bool)

(declare-fun e!171704 () Bool)

(assert (=> d!82948 (=> (not res!207391) (not e!171704))))

(assert (=> d!82948 (= res!207391 (= (size!5929 (buf!6413 thiss!1005)) (size!5929 (buf!6413 thiss!1005))))))

(assert (=> d!82948 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!171704)))

(declare-fun b!247824 () Bool)

(declare-fun res!207393 () Bool)

(assert (=> b!247824 (=> (not res!207393) (not e!171704))))

(assert (=> b!247824 (= res!207393 (bvsle (bitIndex!0 (size!5929 (buf!6413 thiss!1005)) (currentByte!11826 thiss!1005) (currentBit!11821 thiss!1005)) (bitIndex!0 (size!5929 (buf!6413 thiss!1005)) (currentByte!11826 thiss!1005) (currentBit!11821 thiss!1005))))))

(declare-fun b!247825 () Bool)

(declare-fun e!171703 () Bool)

(assert (=> b!247825 (= e!171704 e!171703)))

(declare-fun res!207392 () Bool)

(assert (=> b!247825 (=> res!207392 e!171703)))

(assert (=> b!247825 (= res!207392 (= (size!5929 (buf!6413 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!247826 () Bool)

(assert (=> b!247826 (= e!171703 (arrayBitRangesEq!0 (buf!6413 thiss!1005) (buf!6413 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5929 (buf!6413 thiss!1005)) (currentByte!11826 thiss!1005) (currentBit!11821 thiss!1005))))))

(assert (= (and d!82948 res!207391) b!247824))

(assert (= (and b!247824 res!207393) b!247825))

(assert (= (and b!247825 (not res!207392)) b!247826))

(assert (=> b!247824 m!373397))

(assert (=> b!247824 m!373397))

(assert (=> b!247826 m!373397))

(assert (=> b!247826 m!373397))

(declare-fun m!373503 () Bool)

(assert (=> b!247826 m!373503))

(assert (=> b!247729 d!82948))

(declare-fun d!82956 () Bool)

(assert (=> d!82956 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!386223 () Unit!17976)

(declare-fun choose!11 (BitStream!10780) Unit!17976)

(assert (=> d!82956 (= lt!386223 (choose!11 thiss!1005))))

(assert (=> d!82956 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!386223)))

(declare-fun bs!21026 () Bool)

(assert (= bs!21026 d!82956))

(assert (=> bs!21026 m!373399))

(declare-fun m!373505 () Bool)

(assert (=> bs!21026 m!373505))

(assert (=> b!247729 d!82956))

(push 1)

(assert (not b!247791))

(assert (not b!247793))

(assert (not d!82956))

(assert (not d!82922))

(assert (not b!247824))

(assert (not d!82924))

(assert (not d!82934))

(assert (not d!82932))

(assert (not d!82944))

(assert (not b!247826))

(assert (not b!247790))

(assert (not d!82920))

(assert (not b!247794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

