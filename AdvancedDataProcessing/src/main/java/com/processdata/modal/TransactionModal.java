package com.processdata.modal;

import java.util.ArrayList;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.NativeQuery;

import com.processdata.entity.Transaction;

public class TransactionModal {
	public ArrayList<Transaction> getAllTransactions(String offset) {
		ArrayList<Transaction> transactions = new ArrayList<Transaction>();
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = factory.openSession();
		String query = "select * from transaction limit 100 offset "+ offset +"";
		NativeQuery<Transaction> sqlQuery = session.createNativeQuery(query, Transaction.class);
		transactions = (ArrayList<Transaction>) sqlQuery.list();
		session.close();
		factory.close();
		return transactions;
	}
	public int getCount() {
		int count = 0;
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = factory.openSession();
		count = ((Number) session.createSQLQuery( "SELECT COUNT(*) FROM transaction" )
			      .uniqueResult()).intValue();
		session.close();
		factory.close();
		return count;
	}
}
