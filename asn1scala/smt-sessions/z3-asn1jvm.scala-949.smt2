; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26898 () Bool)

(assert start!26898)

(declare-fun b!138773 () Bool)

(declare-fun e!92304 () Bool)

(declare-datatypes ((array!6278 0))(
  ( (array!6279 (arr!3538 (Array (_ BitVec 32) (_ BitVec 8))) (size!2843 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4950 0))(
  ( (BitStream!4951 (buf!3256 array!6278) (currentByte!6069 (_ BitVec 32)) (currentBit!6064 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4950)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138773 (= e!92304 (not (invariant!0 (currentBit!6064 thiss!1634) (currentByte!6069 thiss!1634) (size!2843 (buf!3256 thiss!1634)))))))

(declare-fun isPrefixOf!0 (BitStream!4950 BitStream!4950) Bool)

(assert (=> b!138773 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8642 0))(
  ( (Unit!8643) )
))
(declare-fun lt!216654 () Unit!8642)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4950) Unit!8642)

(assert (=> b!138773 (= lt!216654 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!138772 () Bool)

(declare-fun res!115687 () Bool)

(assert (=> b!138772 (=> (not res!115687) (not e!92304))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!138772 (= res!115687 (bvsge from!447 to!404))))

(declare-fun b!138774 () Bool)

(declare-fun e!92306 () Bool)

(declare-fun array_inv!2632 (array!6278) Bool)

(assert (=> b!138774 (= e!92306 (array_inv!2632 (buf!3256 thiss!1634)))))

(declare-fun b!138771 () Bool)

(declare-fun res!115688 () Bool)

(assert (=> b!138771 (=> (not res!115688) (not e!92304))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138771 (= res!115688 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2843 (buf!3256 thiss!1634))) ((_ sign_extend 32) (currentByte!6069 thiss!1634)) ((_ sign_extend 32) (currentBit!6064 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!115689 () Bool)

(assert (=> start!26898 (=> (not res!115689) (not e!92304))))

(declare-fun arr!237 () array!6278)

(assert (=> start!26898 (= res!115689 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2843 arr!237))))))

(assert (=> start!26898 e!92304))

(assert (=> start!26898 true))

(assert (=> start!26898 (array_inv!2632 arr!237)))

(declare-fun inv!12 (BitStream!4950) Bool)

(assert (=> start!26898 (and (inv!12 thiss!1634) e!92306)))

(assert (= (and start!26898 res!115689) b!138771))

(assert (= (and b!138771 res!115688) b!138772))

(assert (= (and b!138772 res!115687) b!138773))

(assert (= start!26898 b!138774))

(declare-fun m!213685 () Bool)

(assert (=> b!138773 m!213685))

(declare-fun m!213687 () Bool)

(assert (=> b!138773 m!213687))

(declare-fun m!213689 () Bool)

(assert (=> b!138773 m!213689))

(declare-fun m!213691 () Bool)

(assert (=> b!138774 m!213691))

(declare-fun m!213693 () Bool)

(assert (=> b!138771 m!213693))

(declare-fun m!213695 () Bool)

(assert (=> start!26898 m!213695))

(declare-fun m!213697 () Bool)

(assert (=> start!26898 m!213697))

(check-sat (not b!138774) (not b!138773) (not start!26898) (not b!138771))
(check-sat)
(get-model)

(declare-fun d!44609 () Bool)

(assert (=> d!44609 (= (array_inv!2632 (buf!3256 thiss!1634)) (bvsge (size!2843 (buf!3256 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!138774 d!44609))

(declare-fun d!44611 () Bool)

(assert (=> d!44611 (= (invariant!0 (currentBit!6064 thiss!1634) (currentByte!6069 thiss!1634) (size!2843 (buf!3256 thiss!1634))) (and (bvsge (currentBit!6064 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6064 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6069 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6069 thiss!1634) (size!2843 (buf!3256 thiss!1634))) (and (= (currentBit!6064 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6069 thiss!1634) (size!2843 (buf!3256 thiss!1634)))))))))

(assert (=> b!138773 d!44611))

(declare-fun d!44615 () Bool)

(declare-fun res!115723 () Bool)

(declare-fun e!92337 () Bool)

(assert (=> d!44615 (=> (not res!115723) (not e!92337))))

(assert (=> d!44615 (= res!115723 (= (size!2843 (buf!3256 thiss!1634)) (size!2843 (buf!3256 thiss!1634))))))

(assert (=> d!44615 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!92337)))

(declare-fun b!138811 () Bool)

(declare-fun res!115724 () Bool)

(assert (=> b!138811 (=> (not res!115724) (not e!92337))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138811 (= res!115724 (bvsle (bitIndex!0 (size!2843 (buf!3256 thiss!1634)) (currentByte!6069 thiss!1634) (currentBit!6064 thiss!1634)) (bitIndex!0 (size!2843 (buf!3256 thiss!1634)) (currentByte!6069 thiss!1634) (currentBit!6064 thiss!1634))))))

(declare-fun b!138812 () Bool)

(declare-fun e!92336 () Bool)

(assert (=> b!138812 (= e!92337 e!92336)))

(declare-fun res!115725 () Bool)

(assert (=> b!138812 (=> res!115725 e!92336)))

(assert (=> b!138812 (= res!115725 (= (size!2843 (buf!3256 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!138813 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6278 array!6278 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!138813 (= e!92336 (arrayBitRangesEq!0 (buf!3256 thiss!1634) (buf!3256 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2843 (buf!3256 thiss!1634)) (currentByte!6069 thiss!1634) (currentBit!6064 thiss!1634))))))

(assert (= (and d!44615 res!115723) b!138811))

(assert (= (and b!138811 res!115724) b!138812))

(assert (= (and b!138812 (not res!115725)) b!138813))

(declare-fun m!213725 () Bool)

(assert (=> b!138811 m!213725))

(assert (=> b!138811 m!213725))

(assert (=> b!138813 m!213725))

(assert (=> b!138813 m!213725))

(declare-fun m!213727 () Bool)

(assert (=> b!138813 m!213727))

(assert (=> b!138773 d!44615))

(declare-fun d!44631 () Bool)

(assert (=> d!44631 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!216666 () Unit!8642)

(declare-fun choose!11 (BitStream!4950) Unit!8642)

(assert (=> d!44631 (= lt!216666 (choose!11 thiss!1634))))

(assert (=> d!44631 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!216666)))

(declare-fun bs!10902 () Bool)

(assert (= bs!10902 d!44631))

(assert (=> bs!10902 m!213687))

(declare-fun m!213731 () Bool)

(assert (=> bs!10902 m!213731))

(assert (=> b!138773 d!44631))

(declare-fun d!44637 () Bool)

(assert (=> d!44637 (= (array_inv!2632 arr!237) (bvsge (size!2843 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26898 d!44637))

(declare-fun d!44639 () Bool)

(assert (=> d!44639 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6064 thiss!1634) (currentByte!6069 thiss!1634) (size!2843 (buf!3256 thiss!1634))))))

(declare-fun bs!10904 () Bool)

(assert (= bs!10904 d!44639))

(assert (=> bs!10904 m!213685))

(assert (=> start!26898 d!44639))

