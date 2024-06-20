; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51174 () Bool)

(assert start!51174)

(declare-fun res!199799 () Bool)

(declare-fun e!165203 () Bool)

(assert (=> start!51174 (=> (not res!199799) (not e!165203))))

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12779 0))(
  ( (array!12780 (arr!6603 (Array (_ BitVec 32) (_ BitVec 8))) (size!5616 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12779)

(declare-fun i!492 () (_ BitVec 32))

(assert (=> start!51174 (= res!199799 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5616 charSet!5)) (bvslt ret!59 (size!5616 charSet!5)) (bvslt i!492 (size!5616 charSet!5)) (= ret!59 #b00000000000000000000000000000000)))))

(assert (=> start!51174 e!165203))

(assert (=> start!51174 true))

(declare-fun array_inv!5357 (array!12779) Bool)

(assert (=> start!51174 (array_inv!5357 charSet!5)))

(declare-fun b!239038 () Bool)

(declare-fun e!165201 () Bool)

(assert (=> b!239038 (= e!165203 e!165201)))

(declare-fun res!199800 () Bool)

(assert (=> b!239038 (=> (not res!199800) (not e!165201))))

(declare-datatypes ((Unit!17469 0))(
  ( (Unit!17470) )
))
(declare-datatypes ((tuple2!20230 0))(
  ( (tuple2!20231 (_1!11033 Unit!17469) (_2!11033 (_ BitVec 32))) )
))
(declare-fun lt!373929 () tuple2!20230)

(assert (=> b!239038 (= res!199800 (and (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5616 charSet!5)) (= (_2!11033 lt!373929) #b00000000000000000000000000000000)))))

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun Unit!17471 () Unit!17469)

(declare-fun Unit!17472 () Unit!17469)

(assert (=> b!239038 (= lt!373929 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6603 charSet!5) i!492))) (tuple2!20231 Unit!17471 i!492) (tuple2!20231 Unit!17472 ret!59)))))

(declare-fun b!239039 () Bool)

(declare-datatypes ((tuple3!1552 0))(
  ( (tuple3!1553 (_1!11034 Unit!17469) (_2!11034 (_ BitVec 32)) (_3!918 (_ BitVec 32))) )
))
(declare-fun lt!373928 () tuple3!1552)

(assert (=> b!239039 (= e!165201 (or (bvslt (_2!11034 lt!373928) #b00000000000000000000000000000000) (bvsgt (_2!11034 lt!373928) (size!5616 charSet!5)) (bvsge (_3!918 lt!373928) (size!5616 charSet!5)) (bvslt (_3!918 lt!373928) #b00000000000000000000000000000000)))))

(declare-fun GetCharIndexWhile!0 ((_ BitVec 8) array!12779 (_ BitVec 32) (_ BitVec 32)) tuple3!1552)

(assert (=> b!239039 (= lt!373928 (GetCharIndexWhile!0 ch!5 charSet!5 (bvadd #b00000000000000000000000000000001 i!492) (_2!11033 lt!373929)))))

(assert (= (and start!51174 res!199799) b!239038))

(assert (= (and b!239038 res!199800) b!239039))

(declare-fun m!361053 () Bool)

(assert (=> start!51174 m!361053))

(declare-fun m!361055 () Bool)

(assert (=> b!239038 m!361055))

(declare-fun m!361057 () Bool)

(assert (=> b!239039 m!361057))

(push 1)

(assert (not b!239039))

(assert (not start!51174))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80382 () Bool)

(declare-fun lt!373954 () tuple3!1552)

(assert (=> d!80382 (and (bvsge (_2!11034 lt!373954) #b00000000000000000000000000000000) (bvsle (_2!11034 lt!373954) (size!5616 charSet!5)) (bvslt (_3!918 lt!373954) (size!5616 charSet!5)) (bvsge (_3!918 lt!373954) #b00000000000000000000000000000000) (or (bvsge (_2!11034 lt!373954) (size!5616 charSet!5)) (not (= (_3!918 lt!373954) #b00000000000000000000000000000000))))))

(declare-fun e!165212 () tuple3!1552)

(assert (=> d!80382 (= lt!373954 e!165212)))

(declare-fun c!11395 () Bool)

(declare-fun lt!373956 () (_ BitVec 32))

(declare-fun lt!373955 () tuple2!20230)

(assert (=> d!80382 (= c!11395 (and (bvslt lt!373956 (size!5616 charSet!5)) (= (_2!11033 lt!373955) #b00000000000000000000000000000000)))))

(assert (=> d!80382 (= lt!373956 (bvadd #b00000000000000000000000000000001 i!492 #b00000000000000000000000000000001))))

(declare-fun Unit!17479 () Unit!17469)

(declare-fun Unit!17480 () Unit!17469)

(assert (=> d!80382 (= lt!373955 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6603 charSet!5) (bvadd #b00000000000000000000000000000001 i!492)))) (tuple2!20231 Unit!17479 (bvadd #b00000000000000000000000000000001 i!492)) (tuple2!20231 Unit!17480 (_2!11033 lt!373929))))))

(assert (=> d!80382 (and (bvsge (bvadd #b00000000000000000000000000000001 i!492) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!492) (size!5616 charSet!5)) (bvslt (_2!11033 lt!373929) (size!5616 charSet!5)) (bvsge (_2!11033 lt!373929) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5616 charSet!5)) (= (_2!11033 lt!373929) #b00000000000000000000000000000000))))

(assert (=> d!80382 (= (GetCharIndexWhile!0 ch!5 charSet!5 (bvadd #b00000000000000000000000000000001 i!492) (_2!11033 lt!373929)) lt!373954)))

(declare-fun b!239056 () Bool)

(assert (=> b!239056 (= e!165212 (GetCharIndexWhile!0 ch!5 charSet!5 lt!373956 (_2!11033 lt!373955)))))

(declare-fun b!239057 () Bool)

(declare-fun Unit!17481 () Unit!17469)

(assert (=> b!239057 (= e!165212 (tuple3!1553 Unit!17481 lt!373956 (_2!11033 lt!373955)))))

(assert (= (and d!80382 c!11395) b!239056))

(assert (= (and d!80382 (not c!11395)) b!239057))

(declare-fun m!361067 () Bool)

(assert (=> d!80382 m!361067))

(declare-fun m!361069 () Bool)

(assert (=> b!239056 m!361069))

(assert (=> b!239039 d!80382))

(declare-fun d!80384 () Bool)

(assert (=> d!80384 (= (array_inv!5357 charSet!5) (bvsge (size!5616 charSet!5) #b00000000000000000000000000000000))))

(assert (=> start!51174 d!80384))

(push 1)

(assert (not b!239056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

