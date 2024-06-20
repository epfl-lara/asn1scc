; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51900 () Bool)

(assert start!51900)

(declare-fun res!200061 () Bool)

(declare-fun e!166015 () Bool)

(assert (=> start!51900 (=> (not res!200061) (not e!166015))))

(declare-datatypes ((array!13041 0))(
  ( (array!13042 (arr!6700 (Array (_ BitVec 32) (_ BitVec 8))) (size!5713 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10348 0))(
  ( (BitStream!10349 (buf!6167 array!13041) (currentByte!11482 (_ BitVec 32)) (currentBit!11477 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10348)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51900 (= res!200061 (validate_offset_bits!1 ((_ sign_extend 32) (size!5713 (buf!6167 thiss!1948))) ((_ sign_extend 32) (currentByte!11482 thiss!1948)) ((_ sign_extend 32) (currentBit!11477 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11482 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11477 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!51900 e!166015))

(declare-fun e!166016 () Bool)

(declare-fun inv!12 (BitStream!10348) Bool)

(assert (=> start!51900 (and (inv!12 thiss!1948) e!166016)))

(declare-fun b!239608 () Bool)

(declare-datatypes ((Unit!17515 0))(
  ( (Unit!17516) )
))
(declare-datatypes ((tuple2!20244 0))(
  ( (tuple2!20245 (_1!11044 Unit!17515) (_2!11044 BitStream!10348)) )
))
(declare-fun lt!374211 () tuple2!20244)

(assert (=> b!239608 (= e!166015 (not (inv!12 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211))))))))

(declare-fun alignToByte!0 (BitStream!10348) tuple2!20244)

(assert (=> b!239608 (= lt!374211 (alignToByte!0 thiss!1948))))

(declare-fun b!239609 () Bool)

(declare-fun array_inv!5454 (array!13041) Bool)

(assert (=> b!239609 (= e!166016 (array_inv!5454 (buf!6167 thiss!1948)))))

(assert (= (and start!51900 res!200061) b!239608))

(assert (= start!51900 b!239609))

(declare-fun m!361867 () Bool)

(assert (=> start!51900 m!361867))

(declare-fun m!361869 () Bool)

(assert (=> start!51900 m!361869))

(declare-fun m!361871 () Bool)

(assert (=> b!239608 m!361871))

(declare-fun m!361873 () Bool)

(assert (=> b!239608 m!361873))

(declare-fun m!361875 () Bool)

(assert (=> b!239609 m!361875))

(push 1)

(assert (not b!239608))

(assert (not b!239609))

(assert (not start!51900))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80998 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80998 (= (inv!12 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))) (invariant!0 (currentBit!11477 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))) (currentByte!11482 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))) (size!5713 (buf!6167 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))))))))

(declare-fun bs!20408 () Bool)

(assert (= bs!20408 d!80998))

(declare-fun m!361899 () Bool)

(assert (=> bs!20408 m!361899))

(assert (=> b!239608 d!80998))

(declare-fun d!81000 () Bool)

(declare-fun e!166045 () Bool)

(assert (=> d!81000 e!166045))

(declare-fun res!200079 () Bool)

(assert (=> d!81000 (=> (not res!200079) (not e!166045))))

(assert (=> d!81000 (= res!200079 (validate_offset_bits!1 ((_ sign_extend 32) (size!5713 (buf!6167 thiss!1948))) ((_ sign_extend 32) (currentByte!11482 thiss!1948)) ((_ sign_extend 32) (currentBit!11477 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11477 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun Unit!17525 () Unit!17515)

(declare-fun Unit!17526 () Unit!17515)

(assert (=> d!81000 (= (alignToByte!0 thiss!1948) (ite (not (= (currentBit!11477 thiss!1948) #b00000000000000000000000000000000)) (tuple2!20245 Unit!17525 (BitStream!10349 (buf!6167 thiss!1948) (bvadd (currentByte!11482 thiss!1948) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!20245 Unit!17526 thiss!1948)))))

(declare-fun b!239632 () Bool)

(declare-fun e!166046 () Bool)

(assert (=> b!239632 (= e!166045 e!166046)))

(declare-fun res!200078 () Bool)

(assert (=> b!239632 (=> (not res!200078) (not e!166046))))

(declare-fun lt!374235 () tuple2!20244)

(assert (=> b!239632 (= res!200078 (= (buf!6167 (_2!11044 lt!374235)) (buf!6167 thiss!1948)))))

(declare-fun Unit!17527 () Unit!17515)

(declare-fun Unit!17528 () Unit!17515)

(assert (=> b!239632 (= lt!374235 (ite (not (= (currentBit!11477 thiss!1948) #b00000000000000000000000000000000)) (tuple2!20245 Unit!17527 (BitStream!10349 (buf!6167 thiss!1948) (bvadd (currentByte!11482 thiss!1948) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!20245 Unit!17528 thiss!1948)))))

(declare-fun b!239633 () Bool)

(declare-fun lt!374233 () (_ BitVec 64))

(declare-fun lt!374234 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239633 (= e!166046 (bvsle (bitIndex!0 (size!5713 (buf!6167 (_2!11044 lt!374235))) (currentByte!11482 (_2!11044 lt!374235)) (currentBit!11477 (_2!11044 lt!374235))) (bvadd lt!374234 lt!374233)))))

(assert (=> b!239633 (or (not (= (bvand lt!374234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374233 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!374234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!374234 lt!374233) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239633 (= lt!374233 #b0000000000000000000000000000000000000000000000000000000000000111)))

(assert (=> b!239633 (= lt!374234 (bitIndex!0 (size!5713 (buf!6167 thiss!1948)) (currentByte!11482 thiss!1948) (currentBit!11477 thiss!1948)))))

(assert (= (and d!81000 res!200079) b!239632))

(assert (= (and b!239632 res!200078) b!239633))

(declare-fun m!361917 () Bool)

(assert (=> d!81000 m!361917))

(declare-fun m!361919 () Bool)

(assert (=> b!239633 m!361919))

(declare-fun m!361921 () Bool)

(assert (=> b!239633 m!361921))

(assert (=> b!239608 d!81000))

(declare-fun d!81018 () Bool)

(assert (=> d!81018 (= (array_inv!5454 (buf!6167 thiss!1948)) (bvsge (size!5713 (buf!6167 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239609 d!81018))

(declare-fun d!81020 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81020 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5713 (buf!6167 thiss!1948))) ((_ sign_extend 32) (currentByte!11482 thiss!1948)) ((_ sign_extend 32) (currentBit!11477 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11482 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11477 thiss!1948))) #b00000000000000000000000000011111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5713 (buf!6167 thiss!1948))) ((_ sign_extend 32) (currentByte!11482 thiss!1948)) ((_ sign_extend 32) (currentBit!11477 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11482 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11477 thiss!1948))) #b00000000000000000000000000011111))))))

(declare-fun bs!20414 () Bool)

(assert (= bs!20414 d!81020))

(declare-fun m!361923 () Bool)

(assert (=> bs!20414 m!361923))

(assert (=> start!51900 d!81020))

(declare-fun d!81022 () Bool)

(assert (=> d!81022 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11477 thiss!1948) (currentByte!11482 thiss!1948) (size!5713 (buf!6167 thiss!1948))))))

(declare-fun bs!20415 () Bool)

(assert (= bs!20415 d!81022))

(declare-fun m!361925 () Bool)

(assert (=> bs!20415 m!361925))

(assert (=> start!51900 d!81022))

(push 1)

(assert (not d!81000))

(assert (not d!81020))

(assert (not b!239633))

(assert (not d!80998))

(assert (not d!81022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81036 () Bool)

(assert (=> d!81036 (= (invariant!0 (currentBit!11477 thiss!1948) (currentByte!11482 thiss!1948) (size!5713 (buf!6167 thiss!1948))) (and (bvsge (currentBit!11477 thiss!1948) #b00000000000000000000000000000000) (bvslt (currentBit!11477 thiss!1948) #b00000000000000000000000000001000) (bvsge (currentByte!11482 thiss!1948) #b00000000000000000000000000000000) (or (bvslt (currentByte!11482 thiss!1948) (size!5713 (buf!6167 thiss!1948))) (and (= (currentBit!11477 thiss!1948) #b00000000000000000000000000000000) (= (currentByte!11482 thiss!1948) (size!5713 (buf!6167 thiss!1948)))))))))

(assert (=> d!81022 d!81036))

(declare-fun d!81038 () Bool)

(assert (=> d!81038 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5713 (buf!6167 thiss!1948))) ((_ sign_extend 32) (currentByte!11482 thiss!1948)) ((_ sign_extend 32) (currentBit!11477 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11477 thiss!1948)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5713 (buf!6167 thiss!1948))) ((_ sign_extend 32) (currentByte!11482 thiss!1948)) ((_ sign_extend 32) (currentBit!11477 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11477 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun bs!20417 () Bool)

(assert (= bs!20417 d!81038))

(assert (=> bs!20417 m!361923))

(assert (=> d!81000 d!81038))

(declare-fun d!81040 () Bool)

(assert (=> d!81040 (= (remainingBits!0 ((_ sign_extend 32) (size!5713 (buf!6167 thiss!1948))) ((_ sign_extend 32) (currentByte!11482 thiss!1948)) ((_ sign_extend 32) (currentBit!11477 thiss!1948))) (bvsub (bvmul ((_ sign_extend 32) (size!5713 (buf!6167 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11482 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11477 thiss!1948)))))))

(assert (=> d!81020 d!81040))

(declare-fun d!81042 () Bool)

(declare-fun e!166059 () Bool)

(assert (=> d!81042 e!166059))

(declare-fun res!200099 () Bool)

(assert (=> d!81042 (=> (not res!200099) (not e!166059))))

(declare-fun lt!374282 () (_ BitVec 64))

(declare-fun lt!374285 () (_ BitVec 64))

(declare-fun lt!374283 () (_ BitVec 64))

(assert (=> d!81042 (= res!200099 (= lt!374283 (bvsub lt!374285 lt!374282)))))

(assert (=> d!81042 (or (= (bvand lt!374285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374285 lt!374282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81042 (= lt!374282 (remainingBits!0 ((_ sign_extend 32) (size!5713 (buf!6167 (_2!11044 lt!374235)))) ((_ sign_extend 32) (currentByte!11482 (_2!11044 lt!374235))) ((_ sign_extend 32) (currentBit!11477 (_2!11044 lt!374235)))))))

(declare-fun lt!374284 () (_ BitVec 64))

(declare-fun lt!374286 () (_ BitVec 64))

(assert (=> d!81042 (= lt!374285 (bvmul lt!374284 lt!374286))))

(assert (=> d!81042 (or (= lt!374284 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374286 (bvsdiv (bvmul lt!374284 lt!374286) lt!374284)))))

(assert (=> d!81042 (= lt!374286 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81042 (= lt!374284 ((_ sign_extend 32) (size!5713 (buf!6167 (_2!11044 lt!374235)))))))

(assert (=> d!81042 (= lt!374283 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11482 (_2!11044 lt!374235))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11477 (_2!11044 lt!374235)))))))

(assert (=> d!81042 (invariant!0 (currentBit!11477 (_2!11044 lt!374235)) (currentByte!11482 (_2!11044 lt!374235)) (size!5713 (buf!6167 (_2!11044 lt!374235))))))

(assert (=> d!81042 (= (bitIndex!0 (size!5713 (buf!6167 (_2!11044 lt!374235))) (currentByte!11482 (_2!11044 lt!374235)) (currentBit!11477 (_2!11044 lt!374235))) lt!374283)))

(declare-fun b!239652 () Bool)

(declare-fun res!200098 () Bool)

(assert (=> b!239652 (=> (not res!200098) (not e!166059))))

(assert (=> b!239652 (= res!200098 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374283))))

(declare-fun b!239653 () Bool)

(declare-fun lt!374281 () (_ BitVec 64))

(assert (=> b!239653 (= e!166059 (bvsle lt!374283 (bvmul lt!374281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239653 (or (= lt!374281 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374281 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374281)))))

(assert (=> b!239653 (= lt!374281 ((_ sign_extend 32) (size!5713 (buf!6167 (_2!11044 lt!374235)))))))

(assert (= (and d!81042 res!200099) b!239652))

(assert (= (and b!239652 res!200098) b!239653))

(declare-fun m!361937 () Bool)

(assert (=> d!81042 m!361937))

(declare-fun m!361939 () Bool)

(assert (=> d!81042 m!361939))

(assert (=> b!239633 d!81042))

(declare-fun d!81044 () Bool)

(declare-fun e!166060 () Bool)

(assert (=> d!81044 e!166060))

(declare-fun res!200101 () Bool)

(assert (=> d!81044 (=> (not res!200101) (not e!166060))))

(declare-fun lt!374289 () (_ BitVec 64))

(declare-fun lt!374288 () (_ BitVec 64))

(declare-fun lt!374291 () (_ BitVec 64))

(assert (=> d!81044 (= res!200101 (= lt!374289 (bvsub lt!374291 lt!374288)))))

(assert (=> d!81044 (or (= (bvand lt!374291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374288 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374291 lt!374288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81044 (= lt!374288 (remainingBits!0 ((_ sign_extend 32) (size!5713 (buf!6167 thiss!1948))) ((_ sign_extend 32) (currentByte!11482 thiss!1948)) ((_ sign_extend 32) (currentBit!11477 thiss!1948))))))

(declare-fun lt!374290 () (_ BitVec 64))

(declare-fun lt!374292 () (_ BitVec 64))

(assert (=> d!81044 (= lt!374291 (bvmul lt!374290 lt!374292))))

(assert (=> d!81044 (or (= lt!374290 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374292 (bvsdiv (bvmul lt!374290 lt!374292) lt!374290)))))

(assert (=> d!81044 (= lt!374292 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81044 (= lt!374290 ((_ sign_extend 32) (size!5713 (buf!6167 thiss!1948))))))

(assert (=> d!81044 (= lt!374289 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11482 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11477 thiss!1948))))))

(assert (=> d!81044 (invariant!0 (currentBit!11477 thiss!1948) (currentByte!11482 thiss!1948) (size!5713 (buf!6167 thiss!1948)))))

(assert (=> d!81044 (= (bitIndex!0 (size!5713 (buf!6167 thiss!1948)) (currentByte!11482 thiss!1948) (currentBit!11477 thiss!1948)) lt!374289)))

(declare-fun b!239654 () Bool)

(declare-fun res!200100 () Bool)

(assert (=> b!239654 (=> (not res!200100) (not e!166060))))

(assert (=> b!239654 (= res!200100 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374289))))

(declare-fun b!239655 () Bool)

(declare-fun lt!374287 () (_ BitVec 64))

(assert (=> b!239655 (= e!166060 (bvsle lt!374289 (bvmul lt!374287 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239655 (or (= lt!374287 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374287 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374287)))))

(assert (=> b!239655 (= lt!374287 ((_ sign_extend 32) (size!5713 (buf!6167 thiss!1948))))))

(assert (= (and d!81044 res!200101) b!239654))

(assert (= (and b!239654 res!200100) b!239655))

(assert (=> d!81044 m!361923))

(assert (=> d!81044 m!361925))

(assert (=> b!239633 d!81044))

(declare-fun d!81046 () Bool)

(assert (=> d!81046 (= (invariant!0 (currentBit!11477 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))) (currentByte!11482 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))) (size!5713 (buf!6167 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))))) (and (bvsge (currentBit!11477 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))) #b00000000000000000000000000000000) (bvslt (currentBit!11477 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))) #b00000000000000000000000000001000) (bvsge (currentByte!11482 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!11482 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))) (size!5713 (buf!6167 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))))) (and (= (currentBit!11477 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))) #b00000000000000000000000000000000) (= (currentByte!11482 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211)))) (size!5713 (buf!6167 (BitStream!10349 (buf!6167 (_2!11044 lt!374211)) (bvmul #b00000000000000000000000000000100 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11482 (_2!11044 lt!374211))) #b00000000000000000000000000000100)) (currentBit!11477 (_2!11044 lt!374211))))))))))))

(assert (=> d!80998 d!81046))

(push 1)

(assert (not d!81038))

(assert (not d!81044))

(assert (not d!81042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

